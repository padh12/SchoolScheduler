Imports System.Data.SqlClient
Imports System.Data

Partial Class Login
    Inherits System.Web.UI.Page
    Dim strQuery As String
    Dim strUserName As String
    Dim strPassword As String
    Dim dbHandler As New dataaccess

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("userxml") = Nothing
        txtUserId.Focus()
    End Sub

    Protected Sub btlLogin_Click(sender As Object, e As System.EventArgs) Handles btlLogin.Click
        Dim strUserName As String
        Dim strPassword As String
        strUserName = ""
        strPassword = ""
        Dim result As Boolean
        strUserName = txtUserId.Text
        strPassword = txtPassword.Text
        result = UserLoginChecking(UCase(strUserName), strPassword)
        If result Then
            Dim data As New hris.Employee
            Dim dac As New DAC
            data = dac.fnFillEmployyeSession(strUserName)
            Session("Userxml") = data
            If (Not Session("UserXml") Is Nothing) Then
                Response.Redirect("~/Admin/Default.aspx")
            Else
                txtUserId.Text = ""
                txtUserId.Focus()
            End If
        Else
            txtUserId.Text = ""
            txtUserId.Focus()
        End If
    End Sub

    Private Function UserLoginChecking(ByVal userName As String, ByVal password As String) As Boolean
        Dim objAttnCmd As SqlCommand
        Dim objAttnReader As SqlDataReader
        strQuery = "SELECT Id,UPPER(UserId) as UserId,UserName,Password " & _
                   "FROM tbl_Master_User WHERE UserId = '" & userName & "' AND Password = '" & password & "'"
        dbHandler.dbOpen()
        objAttnCmd = New SqlCommand(strQuery, dbHandler.objCon)
        objAttnReader = objAttnCmd.ExecuteReader()
        If objAttnReader.Read Then
            '' check the result   
            If (String.IsNullOrEmpty(objAttnReader("UserId"))) Then
                ''invalid user/password , return flase                   
                Return False
            Else
                '' valid login  
                If String.Compare(objAttnReader("UserId"), userName) = 0 And String.Compare(objAttnReader("Password"), password) = 0 Then
                    Return True
                Else
                    Return False
                End If
                Return False
            End If
        Else
            Return False
        End If
    End Function

End Class
