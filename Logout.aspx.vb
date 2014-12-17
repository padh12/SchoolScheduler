Imports System.Security.Principal

Partial Class Logout
    Inherits System.Web.UI.Page



    Protected Sub Logout_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        HttpContext.Current.User = New GenericPrincipal(New GenericIdentity(String.Empty), Nothing)
        HttpContext.Current.Session.Clear()
        HttpContext.Current.Session.Abandon()
        HttpContext.Current.User = Nothing
        Response.Redirect("Login.aspx")
    End Sub
End Class
