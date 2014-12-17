Imports Telerik.Web.UI
Partial Class Admin_ClientList
    Inherits System.Web.UI.Page
    Dim strQuery As String
    Dim dbHandler As New dataaccess
    Dim data As New hris.Employee
    Dim obj As New DAC
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load   
        If Not Page.IsPostBack Then
            loadGrid()
        End If

    End Sub
    Private Sub loadGrid()
        strQuery = "SELECT Cid,ClientName,Address,City,State,ContactPerson " & _
                   "FROM tbl_Master_Client " & _
                   "ORDER BY Cid ASC"
        gvClientList.DataSource = dbHandler.fnDataSet(strQuery)
        gvClientList.DataBind()
    End Sub
    Protected Sub gvClientList_EditCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles gvClientList.EditCommand
        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        If e.CommandName = "Edit" Then
            Response.Redirect("Client.aspx?id=" & ID & "")
        End If
    End Sub
    Protected Sub gvClientList_DeleteCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles gvClientList.DeleteCommand
        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        If e.CommandName = "Delete" Then
            strQuery = "EXEC spClient " & ID & ",'','','','','','','','','','',1,'Del','" & Server.MachineName & "','" & Request.ServerVariables("REMOTE_ADDR") & "'," & data.UserId & ""
            dbHandler.dbUpdate(strQuery)
            loadGrid()
        End If
    End Sub
End Class
