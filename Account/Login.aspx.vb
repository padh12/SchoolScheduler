Imports System.Data.SqlClient
Imports System.Data
Partial Class Account_Login
    Inherits System.Web.UI.Page
    Dim dbHandler As New dataaccess
    Dim strQuery As String
    Public Shared checkout As String
    Public Shared Cid As String
    Public Shared CheckInTime As String
    Public Shared Dateformat As String
    Dim ds As New DataSet
    Dim strUserName As String
    Dim strPassword As String
    Dim table As New DataTable
    Protected Sub LoginUser_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles LoginUser.Authenticate
        Dim strUserName As String
        Dim strPassword As String
        strUserName = ""
        strPassword = ""
        Dim result As Boolean
        strUserName = LoginUser.UserName
        strPassword = LoginUser.Password
        result = UserLoginChecking(UCase(strUserName), strPassword)
        If result Then
            Dim data As New hris.Employee
            Dim dac As New DAC
            data = dac.fnFillEmployyeSession(strUserName)
            Session("Userxml") = data
            If (Not Session("UserXml") Is Nothing) Then
                e.Authenticated = True
            Else
                e.Authenticated = False
            End If
        Else
            e.Authenticated = False
        End If
    End Sub
    Private Function UserLoginChecking(ByVal userName As String, ByVal password As String) As Boolean
        Dim objAttnCmd As SqlCommand
        Dim objAttnReader As SqlDataReader
        strQuery = "SELECT Id,UPPER(UserId) as UserId,UserName,Password " & _
                   "FROM tbl_Master_User WHERE UserId = '" & userName & "'"
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
    Private Sub Employeecheckout()
        strUserName = LoginUser.UserName
        Try
            ' strQuery = "select Cid,convert(nvarchar,CheckIn,101)CheckIn from vwEmployeeAttendance where CheckOut is null  and CheckIn<getdate()-1 and  Employeeid='" & strUserName & "'"
            strQuery = "select top 1  A.Cid,convert(nvarchar,A.CheckIn,101)CheckIn,A.CheckIn,convert(nvarchar(12),A.CheckIn,113)CheckIn from tbl_Trans_Attendance A ,vwEmployeeAttendance B   where A.CheckOut is null and B.Cid=A.EmployeeCid  and convert(nvarchar,A.CheckIn,101)<>convert(nvarchar,getdate(),101)  and  B.Employeeid='" & strUserName & "' and B.CheckOut is null"
            ds = dbHandler.fnDataSet(strQuery)
            table = ds.Tables(0)

            If (table.Rows.Count = 0) Then
                checkout = ""
            Else
                Session("checkout") = table.Rows(0)(1).ToString
                Session("Cid") = table.Rows(0)(0).ToString
                Session("CheckInTime") = table.Rows(0)(2).ToString
                Session("Dateformat") = table.Rows(0)(3).ToString
            End If

        Catch ex As Exception
            checkout = ""
        End Try
    End Sub
 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("userxml") = Nothing
      
        If User.Identity.IsAuthenticated = True And Not IsNothing(Session("userXML")) Then
            LoginUser.Focus()
        End If
        LoginUser.Focus()
    End Sub

   
End Class
