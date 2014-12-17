
Partial Class About
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.Identity.IsAuthenticated = False Or Session("UserXML") = "" Then
            Response.Redirect("~/Account/Login.aspx")
        End If
    End Sub
End Class
