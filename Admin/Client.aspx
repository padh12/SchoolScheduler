<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Admin/AdminMaster.master" CodeFile="Client.aspx.vb" Inherits="Admin_Client" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
 
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </h2>
    <table id="tblLeave" class="rounded-q4" width="100%" >
        <tr>
            <td style="height:30px;" colspan="2"><strong>Client </strong>
            </td>
                </tr>
        <tr>
            <td class="style1">
                Client Name :</td>
            <td width="70%">
                <asp:TextBox ID="txtClientName" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtClientName" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Client Name</asp:RequiredFieldValidator>
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
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Address</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                City :</td>
            <td>
                <asp:TextBox ID="txtCity" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtCity" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the City</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                State:</td>
            <td>
                <asp:TextBox ID="txtState" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtState" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the State</asp:RequiredFieldValidator>
                </td>
        </tr>
         <tr>
            <td class="style1">
                Client Phone:</td>
            <td>
                <asp:TextBox ID="txtClientPhone" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtClientPhone" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Client Phone Number</asp:RequiredFieldValidator>
                </td>
        </tr>
         <tr>
            <td class="style1">
                Client Fax:</td>
            <td>
                <asp:TextBox ID="txtClientFax" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtClientFax" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Client Fax Number</asp:RequiredFieldValidator>
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
                Contact Phone :</td>
            <td>
                <asp:TextBox ID="txtContactPersonPhone" runat="server" onmouseout="tip.hide()"  
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                &nbsp;</td>
        </tr>
   <%--      <tr>
            <td class="style1">
                Contact Mail :</td>
            <td>
                <asp:TextBox ID="txtContactPersonMail" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                &nbsp;</td>
        </tr>--%>
                 <tr>
            <td class="style1">
                Mail:</td>
            <td>
                <asp:TextBox ID="txtMail" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtMail" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Client Mail</asp:RequiredFieldValidator>
                </td>
        </tr>
               <tr>
            <td class="style1">
                Website:</td>
            <td>
                <asp:TextBox ID="txtWebsite" runat="server" onmouseout="tip.hide()" 
                    onmouseover=" if(!false){tip.show('employee first name')}else{tip.hide()}" 
                    class="textBox" CssClass="txtBox" Width="200px" Rows="3"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtWebsite" ErrorMessage="RequiredFieldValidator" 
                    ForeColor="#FF3300">Enter the Client Website</asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="newbutton" 
                    Width="50px" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="newbutton" OnClientClick="btnCancel_Click"
                   CausesValidation="false"   Width="50px" />
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


