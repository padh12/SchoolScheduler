Imports System.Xml
Imports System.IO
Partial Class Admin_AdminMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Response.Cache.SetCacheability(HttpCacheability.NoCache)
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1))
        Response.Cache.SetNoStore()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim obj As New DAC
        Dim data As New hris.Employee
        If Session("UserXml") Is Nothing Then
            Response.Redirect("~/Login.aspx")
        End If
        data = Session("UserXML")

        ''  lblUserName.Text = Data.FirstName + " " + Data.LastName

    End Sub
End Class

