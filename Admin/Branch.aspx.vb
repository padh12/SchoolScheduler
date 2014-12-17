Imports System.Data.SqlClient
Imports System.Data

Partial Class _Default
    Inherits System.Web.UI.Page
    Dim strQuery As String
    Dim dbHandler As New dataaccess
    Dim dblCid As Double
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            dblCid = CDbl(Request.QueryString("id"))
            If dblCid > 0 Then LoadData()
        End If

    End Sub
    Public Sub LoadData()
        Dim ds As New DataSet

        strQuery = "SELECT BranchName,Address,City,State,ContactPerson1 FROM tbl_Master_Branch WHERE Cid = " & Request.QueryString("Id")
        ds = dbHandler.fnDataSet(strQuery)

        txtBranchName.Text = ds.Tables(0).Rows(0)(0).ToString
        txtAddress.Text = ds.Tables(0).Rows(0)(1).ToString
        txtCity.Text = ds.Tables(0).Rows(0)(2).ToString
        txtState.Text = ds.Tables(0).Rows(0)(3).ToString
        txtContactPerson.Text = ds.Tables(0).Rows(0)(4).ToString


    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim data As New hris.Employee
        Dim mode As String

        dblCid = Request.QueryString("id")

        mode = IIf(dblCid > 0, "Edit", "Add")

        ''       data =
        strQuery = "EXEC spBranch " & dblCid & ",1,'" & txtBranchName.Text & "','" & txtAddress.Text & "'," & _
              "'" & txtCity.Text & "','" & txtState.Text & "',1,'" & txtContactPerson.Text & "','Phone1','Mail1','Contact Person2'," & _
              "'phone2','mail2','Officephone1','officefax','www.jtechindia.com','Admin@jtechindia.com',1,'" & mode & "','" & Server.MachineName & "','" & Request.ServerVariables("REMOTE_ADDR") & "'," & data.UserId & " "

        dbHandler.dbUpdate(strQuery)

        Response.Redirect("Branch-list.aspx")
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("Branch-list.aspx")
    End Sub
End Class
