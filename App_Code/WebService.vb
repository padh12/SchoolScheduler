
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
Imports System.Data

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class empXml
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function myEmp(ByVal strUserName As String) As dataset
        Dim Data As New hris.Employee
        Dim dbHandler As New dataaccess


        'Dim objAttnCmd As SqlCommand
        'Dim objAttnReader As SqlDataReader
        Dim ds As New DataSet

        Dim strQuery As String

        'myEmp = vbNull

        strQuery = "SELECT Cid,FirstName,LastName,EmployeeId,CheckIn,CASE WHEN CheckOut IS Null then 0 ELSE 1 END as isCheckOut, " & _
                       "CheckOut,isAdmin FROM vwEmployeeAttendance WHERE EmployeeId = '" & strUserName & "' AND CONVERT(VARCHAR,CheckIn,103)= CONVERT(VARCHAR,GetDate(),103) "

        ds = dbHandler.fnDataSet(strQuery)

        'dbHandler.dbOpen()


        'objAttnCmd = New SqlCommand(strQuery, dbHandler.objCon)
        'objAttnReader = objAttnCmd.ExecuteReader()



        'If objAttnReader.Read Then
        '    data.UserId = objAttnReader("Cid")
        '    Data.FirstName = objAttnReader("FirstName")
        '    Data.LastName = objAttnReader("LastName")
        '    Data.EmpCode = objAttnReader("EmployeeId")
        '    Data.CheckIn = objAttnReader("CheckIn")
        '    Data.isCheckOut = objAttnReader("isCheckOut")
        '    If Data.isCheckOut = True Then
        '        Data.CheckOut = objAttnReader("CheckOut")
        '    Else
        '        Data.CheckOut = Now.Date
        '    End If
        '    Data.isAdmin = objAttnReader("isAdmin")
        '    '  myEmp = "test"
        '    '  myEmp = Data
        'End If

        Return ds
    End Function
End Class