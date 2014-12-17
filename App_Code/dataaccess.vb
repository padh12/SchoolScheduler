Imports Microsoft.VisualBasic
Imports system.Data.oledb
Imports System.Data.SqlClient
Imports System.Globalization
Imports System.Threading

Public Class dataaccess
    Inherits System.Web.UI.Page
    Public objCon As New SqlConnection
    Public strSql As String
    Dim strCon As String

    Protected Overloads Overrides Sub InitializeCulture()
        Dim objCultureInfo As New CultureInfo("en-IN")
        Thread.CurrentThread.CurrentUICulture = objCultureInfo

        Dim objDateTimeFormatInfo As DateTimeFormatInfo = objCultureInfo.DateTimeFormat
        objDateTimeFormatInfo.ShortDatePattern = "dd/MM/yy"
        objDateTimeFormatInfo.LongDatePattern = "dd/MM/yyyy"
        objCultureInfo.DateTimeFormat = objDateTimeFormatInfo
        objCultureInfo.NumberFormat.NumberGroupSeparator = ","
        objCultureInfo.NumberFormat.NumberDecimalSeparator = "."
        objCultureInfo.NumberFormat.NumberGroupSeparator = ","
        objCultureInfo.NumberFormat.CurrencyDecimalSeparator = "."
        objCultureInfo.NumberFormat.CurrencyGroupSeparator = ","
        objCultureInfo.NumberFormat.CurrencySymbol = "Rs."
        Thread.CurrentThread.CurrentCulture = objCultureInfo
        objDateTimeFormatInfo = Nothing
        objCultureInfo = Nothing
        MyBase.InitializeCulture()
    End Sub

    Public Sub dbOpen()
        strCon = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        '  strCon = "Data Source=Server;User ID=sa;Initial Catalog=JSolution;Persist Security Info=False;"
        If Not objCon.State = Data.ConnectionState.Open Then
            objCon.ConnectionString = strCon
            objCon.Open()
        End If
    End Sub

    Public Function fnDataSet(ByVal strQuery As String) As Data.DataSet
        Dim dsNew As New Data.DataSet
        Dim sqladapter As SqlDataAdapter
        dbOpen()
        sqladapter = New SqlDataAdapter(strQuery, strCon)
        sqladapter.Fill(dsNew)
        dbClose()
        fnDataSet = dsNew
        Return fnDataSet
    End Function



    Public Sub dbUpdate(ByVal strSql As String)
        Dim objCmd As SqlCommand
        Try
            dbOpen()
            objCmd = New SqlCommand(strSql, objCon)

            objCmd.ExecuteNonQuery()
            objCon.Close()
        Catch
            objCon.Close()
            ' Exit Sub ' and stop execution
        End Try
    End Sub

    Public Function ExecuteNonQuery(ByVal strSql As String) As Data.DataSet
        Dim objCmd As SqlCommand
        Dim sqlDataAdapter As SqlDataAdapter
        Dim dataSet As Data.DataSet
        Try
            dbOpen()
            objCmd = New SqlCommand(strSql, objCon)
            sqlDataAdapter = New SqlDataAdapter(objCmd)
            dataSet = New Data.DataSet
            sqlDataAdapter.Fill(dataSet)
            ExecuteNonQuery = dataSet
            objCon.Close()
        Catch
            objCon.Close()
            dataSet = New Data.DataSet
            ExecuteNonQuery = dataSet
            ' Exit Sub ' and stop execution
        End Try
    End Function

    Public Sub dbClose()
        If objCon.State = Data.ConnectionState.Open Then
            objCon.Close()
            'dsNew.Reset()
        End If
    End Sub


    Public Function fnEntryChecking(ByVal strTableQuery As String) As Boolean
        Dim objAttnCmd As SqlCommand
        Dim objAttnReader As SqlDataReader

        dbOpen()
        objAttnCmd = New SqlCommand(strTableQuery, objCon)
        objAttnReader = objAttnCmd.ExecuteReader()
        If objAttnReader.Read Then
            '' check the result   
            If Not (String.IsNullOrEmpty(objAttnReader("Cid"))) Then
                Return True
            Else
                Return False
            End If
        Else
            Return False
        End If

    End Function
End Class
