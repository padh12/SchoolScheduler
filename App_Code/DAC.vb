Imports System
Imports System.Diagnostics
Imports System.Xml
Imports System.Xml.Serialization
Imports System.IO
Imports System.Reflection
Imports System.Text
Imports System.Runtime.Serialization.Formatters.Binary
Imports System.Runtime.Serialization
Imports System.Data.SqlClient
Imports hris.Employee

Public Class DAC

    Public Function fnFillEmployyeSession(ByVal strUserName As String) As Object
        Dim data As New hris.Employee
        Dim serialize As New DAC
        Dim dbHandler As New dataaccess

        Dim objAttnCmd As SqlCommand
        Dim objAttnReader As SqlDataReader

        Dim strQuery As String

        fnFillEmployyeSession = vbNull

        strQuery = "SELECT UserId,UserName,Password,isAdmin FROM tbl_Master_User WHERE UserId = '" & strUserName & "' "
        dbHandler.dbOpen()
        objAttnCmd = New SqlCommand(strQuery, dbHandler.objCon)
        objAttnReader = objAttnCmd.ExecuteReader()
        If objAttnReader.Read Then
            data.UserId = objAttnReader("UserId")
            data.UserName = objAttnReader("UserName")
            data.FirstName = objAttnReader("UserName")
            data.LastName = objAttnReader("UserName")
            data.isAdmin = objAttnReader("isAdmin")
            fnFillEmployyeSession = data
        End If
        Return fnFillEmployyeSession
    End Function

End Class

