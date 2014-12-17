<%@ Page Title="eHRIS - Dashboard" Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Admin_Default" MasterPageFile="~/Admin/AdminMaster.master" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style2
        {
            text-align:right ;	
        }
    </style>

  </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <telerik:RadScriptManager ID="ScriptManager1" runat="server" 
        EnableTheming="True">
    </telerik:RadScriptManager>

    <h2>
        Welcome to Admin Panel!
    </h2>
 
  <%--  <asp:HyperLink ID="HyperLink1" runat="server" onclick="Button1_Click">HyperLink</asp:HyperLink>--%>
    <br />   
    <table >
        <tr>
            <td>
                 <span class="lineTitle">Today's Attendance Details:</span> <br /> <br /> 

                 <telerik:RadGrid ID="gvEmployee" runat="server" Width="60%" GridLines="None"   OnPageIndexChanged="gvEmployee_PageIndexChanged" OnPageSizeChanged="gvEmployee_PageSizeChanged"
            AutoGenerateColumns="False" PageSize="13" AllowPaging="True"
            ShowStatusBar="True" Skin="Office2007" >
            <MasterTableView DataKeyNames="Cid" AllowMultiColumnSorting="false" Width="100%" EditMode="PopUp"  
                CommandItemDisplay="None" AlternatingItemStyle-BackColor="Cornsilk" GroupHeaderItemStyle-ForeColor="Red" >

                <Columns>
                        <telerik:GridBoundColumn UniqueName="Cid" SortExpression="Cid" HeaderText="Cid"
                        DataField="Cid" Visible="false" />                       
                        <telerik:GridBoundColumn HeaderText="Employee Name" UniqueName="EmployeeName" DataField="EmployeeName" HeaderStyle-Width="100px">
<HeaderStyle Width="100px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Employee Id" UniqueName="EmployeeId" DataField="EmployeeId"  HeaderStyle-Width="20px">
<HeaderStyle Width="20px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridDateTimeColumn HeaderText="Check-In @" UniqueName="CheckIn" DataField="CheckIn"  DataFormatString="{0:d}" HeaderStyle-Width="100px">
<HeaderStyle Width="50px"></HeaderStyle>
                        </telerik:GridDateTimeColumn>
                        <telerik:GridDateTimeColumn HeaderText="Check-Out @" UniqueName="CheckOut" DataField="CheckOut"  DataFormatString="{0:d}" HeaderStyle-Width="100px">
<HeaderStyle Width="50px"></HeaderStyle>
                        </telerik:GridDateTimeColumn>
                        <telerik:GridBoundColumn HeaderText="LeaveType" UniqueName="LeaveType" DataField="LeaveType" HeaderStyle-Width="100px" Visible="false">
<HeaderStyle Width="100px"></HeaderStyle>
 </telerik:GridBoundColumn>
                </Columns>
                    <GroupByExpressions>
                        <telerik:GridGroupByExpression>
                            <SelectFields>
                                <telerik:GridGroupByField FieldAlias="BranchName" FieldName="BranchName" ></telerik:GridGroupByField>
                            </SelectFields>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="BranchName" SortOrder="Ascending"></telerik:GridGroupByField>
                        </GroupByFields>
                    </telerik:GridGroupByExpression>
                    </GroupByExpressions>
            </MasterTableView>
            <ClientSettings >
            <Selecting AllowRowSelect="true" />
            </ClientSettings>
        </telerik:RadGrid>
       
            </td>
            <td>
            
                &nbsp;</td>
         <tr>
            <td>  
                <span class="lineTitle">Employee Leave Request Details :</span><a href="LeaveRequestApproval-list.aspx" target="_self"  class="style2" >All Aprroval Details</a><br /> <br /> 
                 <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
                </telerik:RadCodeBlock>

 
            <telerik:RadGrid ID="gvEmployeeLeaveRequestDetails" runat="server" Width="95%" GridLines="None" OnItemDataBound="gvEmployeeLeaveRequestDetails_ItemDataBound"  OnUpdateCommand="gvEmployeeLeaveRequestDetails_UpdateCommand"
            AutoGenerateColumns="False"  AllowSorting="False" AllowPaging="True" PageSize="13" OnPageIndexChanged="gvEmployeeLeaveRequestDetails_PageIndexChanged" 
            ShowStatusBar="True" Skin="Office2007" ShowGroupPanel="False" >
            <PagerStyle Mode="NextPrevAndNumeric"  />

            <MasterTableView DataKeyNames="Cid" AllowMultiColumnSorting="false" Width="100%" EditMode="PopUp" 
                CommandItemDisplay="None" AlternatingItemStyle-BackColor="Cornsilk" GroupHeaderItemStyle-ForeColor="Red" >

                <Columns>
                        <telerik:GridBoundColumn UniqueName="Cid" SortExpression="Cid" HeaderText="Cid"
                        DataField="Cid" Visible="false" />                       
                        <telerik:GridBoundColumn HeaderText="Employee Name" UniqueName="FirstName" DataField="FirstName" HeaderStyle-Width="100px">
<HeaderStyle Width="180px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn HeaderText="Employee Id" UniqueName="EmployeeId" DataField="EmployeeId"  HeaderStyle-Width="100px">
<HeaderStyle Width="100px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                        <telerik:GridDateTimeColumn HeaderText="FromDate" UniqueName="FromDate" DataField="FromDate"  DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-Width="120px">
<HeaderStyle Width="90px"></HeaderStyle>
                        </telerik:GridDateTimeColumn>
                        <telerik:GridDateTimeColumn HeaderText="ToDate" UniqueName="ToDate" DataField="ToDate"  DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-Width="120px">
<HeaderStyle Width="90px"></HeaderStyle>
                        </telerik:GridDateTimeColumn>
                        <telerik:GridBoundColumn HeaderText="LeaveType" UniqueName="LeaveType" DataField="LeaveType" HeaderStyle-Width="100px" Visible="true">
<HeaderStyle Width="170px"></HeaderStyle>
                         </telerik:GridBoundColumn>  
                        <telerik:GridBoundColumn HeaderText="Reason" UniqueName="Reason" DataField="Reason" HeaderStyle-Width="100px" Visible="true" >
<HeaderStyle Width="150px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                         <telerik:GridBoundColumn HeaderText="DeclineReason" UniqueName="DeclineReason" DataField="DeclineReason" HeaderStyle-Width="100px" Visible="False" >
<HeaderStyle Width="120px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn HeaderText="isApproved" UniqueName="isApproved" DataField="isApproved" HeaderStyle-Width="100px" Visible="true">
<HeaderStyle Width="80px"></HeaderStyle>
                        </telerik:GridBoundColumn>
                       <telerik:GridBoundColumn HeaderText="isDeclined" UniqueName="isCancelled" DataField="isCancelled" HeaderStyle-Width="100px" Visible="true">
<HeaderStyle Width="80px"></HeaderStyle>
                        </telerik:GridBoundColumn>
<telerik:GridButtonColumn  CommandName="Delete" UniqueName="ApprovalColumn" ButtonType="ImageButton" ImageUrl="~\Images\greentick.bmp" HeaderText ="Approval" Text="Approval" HeaderStyle-Width="20px" ConfirmText="Are you sure you want to approve?">
</telerik:GridButtonColumn>                      
<telerik:GridButtonColumn  CommandName="Edit" UniqueName="DeclineColumn" ButtonType="ImageButton" ImageUrl="~\Images\red-crossmark.png" HeaderText ="Decline" Text="Decline"  HeaderStyle-Width="20px" ConfirmText="Are you sure you want to Decline?" ></telerik:GridButtonColumn>
                                
                </Columns>
                

             <EditFormSettings InsertCaption="Add new item" CaptionFormatString="EmployeeID : {0}"
                CaptionDataField="EmployeeId" EditFormType="Template" PopUpSettings-Modal="True">
               
                <FormTemplate>
                    <table id="Table1" cellspacing="1" cellpadding="1" width="300" border="0">
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                          <tr>
                            <td>
                             
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind( "Cid" ) %>' Visible="false" >
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Employee Name:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind( "FirstName" ) %>'  ReadOnly="true"   >
                                </asp:TextBox>
                            </td>
                        </tr>

                         <tr>
                            <td>
                                From Date:
                            </td>
                            <td>
                               
                                <telerik:RadDatePicker ID="rdpStartDate" runat="server" SelectedDate='<%# Bind("FromDate") %>'>
                                </telerik:RadDatePicker>


                            </td>
                        </tr>
                         <tr>
                            <td>
                                To Date:
                            </td>
                            <td>
                                <telerik:RadDatePicker ID="rdpToDate" runat="server" SelectedDate='<%# Bind("ToDate") %>'>
                                </telerik:RadDatePicker>
                            </td>
                        </tr>
                                                                   
                       <tr>
                            <td>
                                Decline Reason:
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind( "DeclineReason") %>' TabIndex="1">
                                </asp:TextBox>
                            </td>
                        </tr>

                    </table>
                    <table style="width: 100%">
                        <tr>
                            <td align="right" colspan="2">
                                     <asp:Button ID="Button1" Text="Update"
                                    runat="server" CommandName="Update">
                                </asp:Button>&nbsp;
                                <asp:Button ID="Button2" Text="Cancel" runat="server" CausesValidation="False" CommandName="Cancel">
                               
                                </asp:Button>
                            </td>
                        </tr>
                       
                    </table>
                </FormTemplate>
            </EditFormSettings>
               <GroupByExpressions>
                        <telerik:GridGroupByExpression>
                            <SelectFields>
                                <telerik:GridGroupByField FieldAlias="BranchName" FieldName="BranchName" ></telerik:GridGroupByField>
                            </SelectFields>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="BranchName" SortOrder="Ascending"></telerik:GridGroupByField>
                        </GroupByFields>
                    </telerik:GridGroupByExpression>
                    </GroupByExpressions>
            </MasterTableView>
            <ClientSettings >
           
            <Selecting AllowRowSelect="true" />
            </ClientSettings>
        </telerik:RadGrid>


            </td>
            <td>
                &nbsp;</td>
        </tr>

        <tr>
        <td> 
        <span class="lineTitle"> Employee CheckOut Details   </span><br/> <br />
        <telerik:RadCodeBlock ID ="RadCodeBlock2" runat="server">
         <script type="text/javascript">
             var popUp;
             function PopUpShowing(sender, eventArgs) {
                 popUp = eventArgs.get_popUp();
                 var gridWidth = sender.get_element().offsetWidth;
                 var gridHeight = sender.get_element().offsetHeight;
                 var popUpWidth = popUp.style.width.substr(0, popUp.style.width.indexOf("px"));
                 var popUpHeight = popUp.style.height.substr(0, popUp.style.height.indexOf("px"));
                 popUp.style.left = ((gridWidth - popUpWidth) / 2 + sender.get_element().offsetLeft).toString() + "px";
                 popUp.style.top = ((gridHeight - popUpHeight) / 2 + sender.get_element().offsetTop).toString() + "px";
             }
  </script>
        </telerik:RadCodeBlock>  

          <telerik:RadGrid ID="gvEmployeecheckout" runat="server" Width="85%" GridLines="None"   OnPageIndexChanged="gvEmployeecheckout_PageIndexChanged"
            AutoGenerateColumns="False" AllowPaging="True"   PageSize="13" AllowCustomPaging="false"  
            ShowStatusBar="True" Skin="Office2007"  >
            <PagerStyle Mode="NextPrevAndNumeric"  />         

            <MasterTableView DataKeyNames="Cid" AllowMultiColumnSorting="false" Width="100%" EditMode="PopUp" 
                CommandItemDisplay="None" AlternatingItemStyle-BackColor="Cornsilk" GroupHeaderItemStyle-ForeColor="Red" >
                <Columns>
                  <telerik:GridBoundColumn UniqueName="Cid" SortExpression="Cid" HeaderText="Cid"
                        DataField="Cid" Visible="false" /> 
                <telerik:GridBoundColumn  HeaderText="EmployeeId" UniqueName="EmployeeId" DataField="EmployeeId"   HeaderStyle-Width="100px">  
                <HeaderStyle Width="150px" />  
                </telerik:GridBoundColumn> 
                  <telerik:GridBoundColumn  HeaderText="EmployeeName" UniqueName="FirstName" DataField="FirstName"   HeaderStyle-Width="100px">  
                <HeaderStyle Width="150px" />  
                </telerik:GridBoundColumn> 
                <telerik:GridBoundColumn HeaderText="CheckIn" UniqueName="CheckIn" DataField="CheckIn" DataFormatString="{0:d}" HeaderStyle-Width="100px">
                <HeaderStyle  Width="150px" />  
                </telerik:GridBoundColumn> 
            <telerik:GridButtonColumn  CommandName="Edit" UniqueName="DeclineColumn" ButtonType="LinkButton"   HeaderText ="CheckOut" Text="CheckOut"  HeaderStyle-Width="20px"></telerik:GridButtonColumn>
                </Columns> 

                <EditFormSettings InsertCaption="Addnewitem"  CaptionFormatString="EmployeeId : {0}"
                CaptionDataField="EmployeeId" EditFormType="Template" PopUpSettings-Modal="True">
                <FormTemplate>
                <div>
                    <table id="Table1" cellspacing="1" cellpadding="1" width="300" border="0">
                    <tr> 
                    <td> 
                    Employee Name:
                    </td>
                    <td>
                    <asp:TextBox ID="textbox1" runat="server" ReadOnly="true" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    </td>
                    </tr>
                    <tr>
                    <td>
                    To Date:
                    </td>
                    <td>
                    
                  <%--  <telerik:RadDateTimePicker ID="rdpToDate" runat="server" DateInput-EmptyMessage="To Date"  SelectedDate='<%#Bind("CheckIn") %>'  Calendar-RangeMinDate='<%# Bind("CheckIn") %>'  >
                     </telerik:RadDateTimePicker> --%>
                       <telerik:RadDateTimePicker ID="rdpToDate" runat="server" DateInput-EmptyMessage="To Date"  SelectedDate='<%#Bind("CheckIn") %>'  Calendar-RangeMinDate='<%# Bind("CheckIn") %>' Calendar-RangeMaxDate='<%# Bind("CheckIn") %>' >
                     </telerik:RadDateTimePicker> 
                    </td>
                    </tr>
                </table>
                </div>
                 <table style="width: 100%">
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="Button1" Text="CheckOut" runat="server" CommandName="Update" CommandArgument="Update">
                                </asp:Button>&nbsp;
                                <asp:Button ID="Button2" Text="Cancel" runat="server" CausesValidation="False" CommandName="Cancel">
                                </asp:Button>
                            </td>
                        </tr>
                    </table>
                </FormTemplate>
                </EditFormSettings> 

                  <GroupByExpressions>
                  <telerik:GridGroupByExpression>
                    <SelectFields>
                      <telerik:GridGroupByField FieldAlias="BranchName" FieldName="BranchName" ></telerik:GridGroupByField>
                    </SelectFields>
                  <GroupByFields>
                  <telerik:GridGroupByField FieldName="BranchName" SortOrder="Ascending"></telerik:GridGroupByField>
                    </GroupByFields>
                 </telerik:GridGroupByExpression>
              </GroupByExpressions>
                </MasterTableView>
               <ClientSettings >
                <Selecting AllowRowSelect="true" />
                <ClientEvents OnPopUpShowing="PopUpShowing" />
                </ClientSettings> 
                </telerik:RadGrid> 
        </td>
          <td>
                &nbsp;</td>
        </tr>
    </table>
<asp:Label runat="server" ID="Label1" />

</asp:Content>

