Imports System.Data
Imports System.Data.SqlClient

Partial Class Account_ChangePassword
    Inherits System.Web.UI.Page
    Dim dbHandler As New dataaccess
    Dim strQuery As String

    Protected Sub ChangeUserPassword_ChangingPassword(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles ChangeUserPassword.ChangingPassword
        Dim objAttnCmd As SqlCommand
        Dim objAttnReader As SqlDataReader
        Dim data As New hris.Employee
        Dim obj As New DAC

        data = Session("userXML")

        strQuery = "SELECT Cid,Password FROM tbl_Master_Employee WHERE EmployeeId = '" & User.Identity.Name & "'"
        dbHandler.dbOpen()
        objAttnCmd = New SqlCommand(strQuery, dbHandler.objCon)
        objAttnReader = objAttnCmd.ExecuteReader()
        If objAttnReader.Read Then
            '' check the result   
            If objAttnReader("Password") <> ChangeUserPassword.CurrentPassword.ToString Then
                ChangeUserPassword.ChangePasswordFailureText = "Wrong Old password"
                'Response.Write("hi")
                e.Cancel = False
            Else
                strQuery = "EXEC spUpdatePassword " & objAttnReader("Cid") & ",'" & ChangeUserPassword.ConfirmNewPassword.ToString & "','" & Server.MachineName & "','" & Request.ServerVariables("REMOTE_ADDR") & "'," & data.UserId & " "
                dbHandler.dbUpdate(strQuery)
                e.Cancel = True
                Server.Transfer("ChangePasswordSuccess.aspx")
            End If
        End If
    End Sub

  
End Class

