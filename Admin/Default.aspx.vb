Imports Telerik.Web.UI
Imports Telerik.Web.UI.RadDateTimePicker
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Data

Partial Class Admin_Default
    Inherits System.Web.UI.Page
    Dim strQuery As String
    Dim strQuery1 As String
    Dim dbHandler As New dataaccess
    Dim modFunction As New MyFunctions
    Dim data As New hris.Employee
    Dim dblCid As Double
    Dim notice As New ArrayList
    Dim fromdate As DateTime
    Dim todate As DateTime
    Dim strQuery2 As String
    Dim strquery3 As String
    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim strReturnUrl As String = modFunction.chkGlobalSession().ToString
        If strReturnUrl <> "" Then
            Response.Redirect(strReturnUrl)
        End If
        If Not Page.IsPostBack Then
            ''LoadgvEmployeelogindetails()
            ''LoadgvEmployeeLeaveRequestDetails()
            loadgvEmloyeeCheckOutDetails()
        End If
 
    End Sub
    Protected Sub gvEmployeeLeaveRequestDetails_DeleteCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles gvEmployeeLeaveRequestDetails.DeleteCommand
        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        Dim obj As New DAC
        Dim data As New hris.Employee
        data = Session("UserXML")
        If e.CommandName = "Delete" Then
            strQuery = "update tbl_Trans_LeaveRequestApproval set isApproved=1,ApprovedBy=" & data.UserId & "  where Cid= " & ID & ""
            dbHandler.dbUpdate(strQuery)
            LoadgvEmployeeLeaveRequestDetails()
        End If
        MessageBox("Leave Request Successfully Approved")
    End Sub
    Protected Sub gvEmployeeLeaveRequestDetails_ItemDataBound(ByVal source As Object, ByVal e As Telerik.Web.UI.GridItemEventArgs)
        If TypeOf e.Item Is GridDataItem Then
            Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
            If dataItem("isApproved").Text = "Yes" Or dataItem("isCancelled").Text = "Yes" Then
                dataItem("ApprovalColumn").Enabled = False
                dataItem("DeclineColumn").Enabled = False
            End If
        End If
    End Sub
    Protected Sub gvEmployeeLeaveRequestDetails_EditCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles gvEmployeeLeaveRequestDetails.EditCommand
        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
        If e.CommandName = "Edit" Then
            '  LoadgvEmployeeLeaveRequestDetails()
            LoadgvEmployeeLeaveRequestDetails1()
        End If
    End Sub
    Protected Sub gvEmployeeLeaveRequestDetails_UpdateCommand(ByVal source As Object, ByVal e As GridCommandEventArgs)
        Dim txtCid As TextBox = DirectCast(e.Item.FindControl("TextBox1"), TextBox)
        Dim txtReason As TextBox = DirectCast(e.Item.FindControl("TextBox5"), TextBox)
        If e.CommandName = "Update" Then
            strQuery = "update tbl_Trans_LeaveRequestApproval set isCancelled=1,DeclineReason='" + txtReason.Text + "' where Cid= " + txtCid.Text + " "
            dbHandler.dbUpdate(strQuery)
            LoadgvEmployeeLeaveRequestDetails()
        End If
        MessageBox("Leave Request Successfully Decline")
    End Sub
    Protected Sub gvEmployeeLeaveRequestDetails_CancelCommand(ByVal source As Object, ByVal e As GridCommandEventArgs) Handles gvEmployeeLeaveRequestDetails.CancelCommand
        Response.Redirect("Default.aspx")
    End Sub
    Protected Sub gvEmployeeLeaveRequestDetails_PageIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridPageChangedEventArgs)
        Try
            gvEmployeeLeaveRequestDetails.CurrentPageIndex = e.NewPageIndex
            LoadgvEmployeeLeaveRequestDetails()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    Private Sub MessageBox(ByVal msg As String)
        Dim lbl As New Label()
        lbl.Text = "<script language='javascript'>" & Environment.NewLine & _
                   "window.alert('" + msg + "')</script>"
        Page.Controls.Add(lbl)
    End Sub
    Private Sub LoadgvEmployeeLeaveRequestDetails()
        strQuery1 = "SELECT A.Cid,D.BranchName,B.EmployeeId,B.FirstName,CONVERT(VARCHAR(11), FromDate, 106) AS FromDate,CONVERT(VARCHAR(11), ToDate, 106) AS ToDate,C.LeaveType,A.Reason,A.DeclineReason,CASE isApproved WHEN 0 THEN 'No' ELSE 'Yes' END isApproved,CASE isCancelled WHEN 0 THEN 'No' ELSE 'Yes' END isCancelled  " & _
            "FROM tbl_Trans_LeaveRequestApproval A,tbl_Master_Employee B,tbl_Master_LeaveType C,tbl_Master_Branch D " & _
            "where A.isApproved=0 and A.isCancelled=0 and B.Cid=A.EmployeeId AND C.Cid=A.LeaveType AND ToDate >= convert(varchar, getdate(), 101) AND B.Cid=A.EmployeeId and B.BranchId=D.Cid ORDER BY A.EmployeeId ASC"
        'strQuery1 = "SELECT A.Cid,D.BranchName,B.EmployeeId,B.FirstName,A.FromDate,A.ToDate,C.LeaveType,A.Reason,A.DeclineReason,CASE isApproved WHEN 0 THEN 'No' ELSE 'Yes' END isApproved,CASE isCancelled WHEN 0 THEN 'No' ELSE 'Yes' END isCancelled  " & _
        '    "FROM tbl_Trans_LeaveRequestApproval A,tbl_Master_Employee B,tbl_Master_LeaveType C,tbl_Master_Branch D " & _
        '    "where A.isApproved=0 and A.isCancelled=0 and B.Cid=A.EmployeeId AND C.Cid=A.LeaveType AND ToDate >= convert(varchar, getdate(), 101) AND B.Cid=A.EmployeeId and B.BranchId=D.Cid ORDER BY A.EmployeeId ASC"
        gvEmployeeLeaveRequestDetails.DataSource = dbHandler.fnDataSet(strQuery1)
        gvEmployeeLeaveRequestDetails.DataBind()
    End Sub
    Private Sub LoadgvEmployeeLeaveRequestDetails1()
        strQuery1 = "SELECT A.Cid,D.BranchName,B.EmployeeId,B.FirstName,A.FromDate,A.ToDate,C.LeaveType,A.Reason,A.DeclineReason,CASE isApproved WHEN 0 THEN 'No' ELSE 'Yes' END isApproved,CASE isCancelled WHEN 0 THEN 'No' ELSE 'Yes' END isCancelled  " & _
            "FROM tbl_Trans_LeaveRequestApproval A,tbl_Master_Employee B,tbl_Master_LeaveType C,tbl_Master_Branch D " & _
            "where A.isApproved=0 and A.isCancelled=0 and B.Cid=A.EmployeeId AND C.Cid=A.LeaveType AND ToDate >= convert(varchar, getdate(), 101) AND B.Cid=A.EmployeeId and B.BranchId=D.Cid ORDER BY A.EmployeeId ASC"
        gvEmployeeLeaveRequestDetails.DataSource = dbHandler.fnDataSet(strQuery1)
        gvEmployeeLeaveRequestDetails.DataBind()
    End Sub
    Private Sub LoadgvEmployeelogindetails()
        strQuery = "SELECT Cid,BranchName,EmployeeName,EmployeeId,FullName,CheckIn,CheckOut,LeaveType " & _
                       "FROM vwEmployeesTodaysList  " & _
                     "ORDER BY BranchName ASC,CheckIn DESC"
        gvEmployee.DataSource = dbHandler.fnDataSet(strQuery)
        gvEmployee.DataBind()
    End Sub
    Protected Sub gvEmployee_PageIndexChanged(ByVal sender As Object, ByVal e As Telerik.Web.UI.GridPageChangedEventArgs)
        Try
            gvEmployee.CurrentPageIndex = e.NewPageIndex
            LoadgvEmployeelogindetails()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    Protected Sub gvEmployee_PageSizeChanged(ByVal source As Object, ByVal e As GridPageSizeChangedEventArgs)
        Try
            gvEmployee.CurrentPageIndex = e.NewPageSize
            LoadgvEmployeelogindetails()
        Catch ex As Exception
            Throw ex
        End Try
    End Sub
    Private Sub loadgvEmloyeeCheckOutDetails()
        ' strQuery2 = "select Cid,EmployeeCid,CheckIn,CheckOut from tbl_Trans_Attendance where CheckOut is null "
        ' strQuery2 = "select A.Cid,B.EmployeeId,C.BranchName,B.FirstName,CONVERT(VARCHAR(11), CheckIn, 106) AS CheckIn,A.CheckOut from tbl_Trans_Attendance  A,tbl_Master_Employee B,tbl_Master_Branch C where a.EmployeeCid=b.Cid and B.BranchId=C.Cid and  isAdmin<>1 and A.CheckOut is null and A.CheckIn<CONVERT(VARCHAR,Getdate(),101)"
        strQuery2 = "select A.Cid,B.EmployeeId,C.BranchName,B.FirstName,A.CheckIn,A.CheckOut from tbl_Trans_Attendance  A,tbl_Master_Employee B,tbl_Master_Branch C where a.EmployeeCid=b.Cid and B.BranchId=C.Cid and  isAdmin<>1 and A.CheckOut is null and A.CheckIn<CONVERT(VARCHAR,Getdate(),101)"
        gvEmployeecheckout.DataSource = dbHandler.fnDataSet(strQuery2)
        gvEmployeecheckout.DataBind()
    End Sub

    Protected Sub gvEmployeecheckout_UpdateCommand(ByVal source As Object, ByVal e As Telerik.Web.UI.GridCommandEventArgs) Handles gvEmployeecheckout.UpdateCommand
        Dim id As String = (CType(e.Item, GridEditFormItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString()
        Dim datetimepic1 As RadDateTimePicker = DirectCast(e.Item.FindControl("rdpToDate"), RadDateTimePicker)
        If e.CommandName = "Update" Then
            strquery3 = "update tbl_Trans_Attendance set CheckOut= '" & Convert.ToString(datetimepic1.SelectedDate) & "' where Cid =" & id & " "
            dbHandler.dbUpdate(strquery3)
            loadgvEmloyeeCheckOutDetails()
        End If
        MessageBox("Employee CheckOut Successfully")

    End Sub
 
    Protected Sub gvEmployeecheckout_PageIndexChanged(ByVal source As Object, ByVal e As Telerik.Web.UI.GridPageChangedEventArgs) Handles gvEmployeecheckout.PageIndexChanged
        Try
            gvEmployeecheckout.CurrentPageIndex = e.NewPageIndex
            loadgvEmloyeeCheckOutDetails()
        Catch ex As Exception

        End Try
    End Sub
    Protected Sub gvEmployeecheckout_EditCommand(source As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles gvEmployeecheckout.EditCommand
        Dim ID As String = (CType(e.Item, GridDataItem)).OwnerTableView.DataKeyValues(e.Item.ItemIndex)("Cid").ToString
        Dim dataItem As GridDataItem = CType(e.Item, GridDataItem)
        If e.CommandName = "Edit" Then
            loadgvEmloyeeCheckOutDetails()
        End If
    End Sub

    Protected Sub gvEmployeecheckout_CancelCommand(source As Object, e As Telerik.Web.UI.GridCommandEventArgs) Handles gvEmployeecheckout.CancelCommand
        Response.Redirect("Default.aspx")
    End Sub
End Class
