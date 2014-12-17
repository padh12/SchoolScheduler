<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Admin/AdminMaster.master" AutoEventWireup="false"
    CodeFile="Company.aspx.vb" Inherits="_Default" Trace="false" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 
 </asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <table id="tblLeave" class="rounded-q4" width="100%" >
        <tr>
            <td style="height:30px;" colspan="2"><strong>Company </strong>
            </td>
                </tr>
        <tr>
            <td class="style1">
                Company Name :</td>
            <td width="70%">
                <asp:TextBox ID="txtCompanyName" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtCompanyName" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Company Name</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                Address :</td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3" 
                    TextMode="MultiLine"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="style1">
                City :</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="style1">
                State:</td>
            <td>
                <asp:TextBox ID="txtState" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="style1">
                Contact Person :</td>
            <td>
                <asp:TextBox ID="txtContactPerson" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="newbutton" 
                    Width="50px" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="newbutton" 
                    Width="50px" CausesValidation="false"  />
                </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <p>
        &nbsp;</p>
</asp:Content>