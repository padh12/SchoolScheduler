Imports System.Data.SqlClient
Imports System.Data
Partial Class Admin_Client
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
    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim obj As New DAC
        Dim data As New hris.Employee
        Dim mode As String

        dblCid = Request.QueryString("id")
        mode = IIf(dblCid > 0, "Edit", "Add")
        data = Session("userXML")
        strQuery = "EXEC spClient " & dblCid & ",'" & txtClientName.Text & "','" & txtAddress.Text & "'," & _
              "'" & txtCity.Text & "','" & txtState.Text & "','" & txtClientPhone.Text & "','" & txtClientFax.Text & "'," & _
              " '" & txtContactPerson.Text & "','" & txtContactPersonPhone.Text & "','" & txtMail.Text & "','" & txtWebsite.Text & "'," & _
              "1,'" & mode & "','" & Server.MachineName & "','" & Request.ServerVariables("REMOTE_ADDR") & "'," & data.UserId & " "

        dbHandler.dbUpdate(strQuery)
        Response.Redirect("ClientList.aspx")
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("ClientList.aspx")
    End Sub
    Public Sub LoadData()
        Dim ds As New DataSet
        strQuery = "SELECT ClientName,Address,City,State,ClientPhone,ClientFax,ContactPerson,Phone,Mail,Website FROM tbl_Master_Client WHERE Cid = " & Request.QueryString("Id")
        ds = dbHandler.fnDataSet(strQuery)
        txtClientName.Text = ds.Tables(0).Rows(0)(0).ToString
        txtAddress.Text = ds.Tables(0).Rows(0)(1).ToString
        txtCity.Text = ds.Tables(0).Rows(0)(2).ToString
        txtState.Text = ds.Tables(0).Rows(0)(3).ToString
        txtClientPhone.Text = ds.Tables(0).Rows(0)(4).ToString
        txtClientFax.Text = ds.Tables(0).Rows(0)(5).ToString
        txtMail.Text = ds.Tables(0).Rows(0)(8).ToString
        txtContactPerson.Text = ds.Tables(0).Rows(0)(6).ToString
        txtContactPersonPhone.Text = ds.Tables(0).Rows(0)(7).ToString
        txtWebsite.Text = ds.Tables(0).Rows(0)(9).ToString

    End Sub
End Class
