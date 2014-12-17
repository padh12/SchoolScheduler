Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Web

Public Class MyFunctions
    Dim dbHandler As New dataaccess
    ' Dim strQuery As String

    Public Function fnGetDays(ByVal intMonth As Int16, ByVal intYear As Int32) As Int16
        Dim intDays As Int16
        Select Case intMonth
            Case 1 : intDays = 31 '- Jan
            Case 2 : If intYear Mod 4 = 0 Then intDays = 29 Else intDays = 28 '- Feb
            Case 3 : intDays = 31 '- Mar
            Case 4 : intDays = 30 '- Apr
            Case 5 : intDays = 31 '- May
            Case 6 : intDays = 30 '- Jun
            Case 7 : intDays = 31 '- Jul
            Case 8 : intDays = 31 '- Aug
            Case 9 : intDays = 30 '- Sep
            Case 10 : intDays = 31 '- Oct
            Case 11 : intDays = 30 '- Nov
            Case 12 : intDays = 31 '- Dec
        End Select
        fnGetDays = intDays
        Return fnGetDays
    End Function

    Public Sub fillCbo(ByVal cboObj As DropDownList, ByVal StrQuery As String)
        cboObj.ClearSelection()
        cboObj.Items.Clear()
        cboObj.DataSource = dbHandler.fnDataSet(StrQuery)
        cboObj.DataBind()
    End Sub
    Public Sub fillCbo(ByVal cboObj As ListBox, ByVal StrQuery As String)
        cboObj.ClearSelection()
        cboObj.Items.Clear()
        cboObj.DataSource = dbHandler.fnDataSet(StrQuery)
        cboObj.DataBind()
    End Sub

    Public Function chkGlobalSession() As String
        chkGlobalSession = ""
    End Function

  
End Class
