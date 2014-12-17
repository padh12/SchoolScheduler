<%@ Page Language="VB" MasterPageFile="~/Admin/AdminMaster.master"  AutoEventWireup="false" CodeFile="ClientList.aspx.vb" Inherits="Admin_ClientList" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
     <h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
      &nbsp; <a href="Client.aspx" target="_self">New Client (+)</a>
    <br />
    <table id="tblLeave0" class="rounded-q4" width="100%">
        <tr>
            <td style="height: 30px;">
                &nbsp;<strong>List of Clients</strong>
            </td>
        </tr>
        <tr>
            <td style="height: 30px;">
                <telerik:RadGrid ID="gvClientList" runat="server" Width="85%" GridLines="None" AutoGenerateColumns="False"
                    PageSize="13" AllowSorting="True" AllowPaging="True" ShowStatusBar="True" Skin="Office2007"
                    EnableAjaxSkinRendering="true" AllowFilteringByColumn="True">
                    <MasterTableView DataKeyNames="Cid" AllowMultiColumnSorting="True" Width="100%" CommandItemDisplay="None"
                        AlternatingItemStyle-BackColor="Cornsilk">
                        <Columns>
                            <telerik:GridBoundColumn UniqueName="Cid" SortExpression="Cid" HeaderText="Cid" DataField="Cid"
                                Visible="false" />
                            <telerik:GridBoundColumn HeaderText="Client Name" UniqueName="ClientName" DataField="ClientName"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Address" UniqueName="Address" DataField="Address"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="City" UniqueName="City" DataField="City" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn HeaderText="State" UniqueName="State" DataField="State" HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ClientPhone" UniqueName="ClientPhone" DataField="ClientPhone" Visible="false"  HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderText="ClientFax" UniqueName="ClientFax" DataField="ClientFax" Visible="false"  HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn HeaderText="Cont. Person" UniqueName="ContactPerson" DataField="ContactPerson"
                                HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn HeaderText="Phone" UniqueName="Phone" DataField="Phone" Visible="false"  HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn HeaderText="Mail" UniqueName="Mail" DataField="Mail" Visible="false"  HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                                  <telerik:GridBoundColumn HeaderText="Website" UniqueName="Website" DataField="Website" Visible="false"  HeaderStyle-Width="100px">
                            </telerik:GridBoundColumn>
                        
                            <telerik:GridButtonColumn UniqueName="EditColumn" CommandName="Edit" ButtonType="ImageButton"
                                HeaderText="Action"  HeaderStyle-Width="20px">
                            </telerik:GridButtonColumn>
                            <telerik:GridButtonColumn UniqueName="DeleteColumn" CommandName="Delete" ButtonType="ImageButton" ImageUrl="~\Images\red-crossmark.png"
                                Text="Delete" HeaderStyle-Width="20px" />
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


