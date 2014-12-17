<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Admin/AdminMaster.master"
    AutoEventWireup="false" CodeFile="Company-list.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
 
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    &nbsp; <a href="Company.aspx" target="_self">New Company (+)</a>
    <br />
    <table id="tblLeave0" class="rounded-q4" width="100%">
        <tr>
            <td style="height: 30px;">
                &nbsp;<strong>List of Company</strong>
            </td>
        </tr>
        <tr>
            <td style="height: 30px;">
                <telerik:RadGrid ID="RadGrid1" runat="server" Width="85%" GridLines="None" AutoGenerateColumns="False"
                    PageSize="13" AllowSorting="True" AllowPaging="True" ShowStatusBar="True" Skin="Office2007"
                    EnableAjaxSkinRendering="true" AllowFilteringByColumn="True">
                    <MasterTableView DataKeyNames="Cid" AllowMultiColumnSorting="True" Width="100%" CommandItemDisplay="None"
                        AlternatingItemStyle-BackColor="Cornsilk">
                        <Columns>
                            <telerik:GridBoundColumn UniqueName="Cid" SortExpression="Cid" HeaderText="Cid" DataField="Cid"
                                Visible="false" />
                            <telerik:GridBoundColumn HeaderText="Company Name" UniqueName="CompanyName" DataField="CompanyName"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Address" UniqueName="Address" DataField="Address"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="City" UniqueName="City" DataField="City" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Cont. Person" UniqueName="ContactPerson1" DataField="ContactPerson1"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridButtonColumn UniqueName="EditColumn" CommandName="Edit" ButtonType="ImageButton"
                                HeaderText="Action"  HeaderStyle-Width="20px">
                            </telerik:GridButtonColumn>
                            <telerik:GridButtonColumn UniqueName="DeleteColumn" CommandName="Delete" ButtonType="ImageButton"  ImageUrl="~\Images\red-crossmark.png"
                               HeaderStyle-Width="20px" />
                        </Columns>
                    </MasterTableView>
                    <ClientSettings>
                        <ClientEvents />
                    </ClientSettings>
                </telerik:RadGrid>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <p>
        &nbsp;</p>
</asp:Content>
