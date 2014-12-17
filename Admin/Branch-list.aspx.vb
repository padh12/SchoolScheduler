Imports Telerik.Web.UI

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim strQuery As String
    Dim dbHandler As New dataaccess
    Dim data As New hris.Employee


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            loadGrid()
        End If

    End Sub
    Public Sub loadGrid()
        strQuery = "SELECT Cid,BranchName,Address,City,ContactPerson1 " & _
                   "FROM tbl_Master_Branch " & _
                   "ORDER BY BranchName ASC"

        RadGrid1.DataSource = dbHandler.fnDataSet(strQuery)

        RadGrid1.DataBind()
    End Sub

    Protected Sub RadGrid1_EditCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles RadGrid1.EditCommand
        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        If e.CommandName = "Edit" Then
            Response.Redirect("Branch.aspx?id=" & ID & "")
        End If
    End Sub
    Protected Sub RadGrid1_DeleteCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles RadGrid1.DeleteCommand

        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        If e.CommandName = "Delete" Then

            strQuery = "EXEC spBranch " & ID & ",1,'','','','',1,'','Phone1','Mail1','Contact Person2'," & _
                  "'phone2','mail2','Officephone1','officefax','www.jtechindia.com','Admin@jtechindia.com',1,'Del','" & Server.MachineName & "','" & Request.ServerVariables("REMOTE_ADDR") & "'," & data.UserId & " "
            dbHandler.dbUpdate(strQuery)
            loadGrid()
        End If
    End Sub
End Class
