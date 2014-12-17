<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="Styles/style-login.css" media="screen" type="text/css" />
</head>
<body>
    <span href="#" class="button" id="toggle-login">eHRIS</span>
    <div id="login">
        <div id="triangle">
        </div>
        <h1>
            Human Resource Info System</h1>
        <form id="Form1" runat="server">
        <asp:TextBox ID="txtUserId" CssClass="textbox" runat="server" placeholder="User Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserId"
            ErrorMessage="Enter the User Name" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:TextBox ID="txtPassword" TextMode="Password" class="textbox" runat="server" placeholder="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
            ErrorMessage="Enter the Password" ForeColor="Red">*</asp:RequiredFieldValidator>
        <asp:Button ID="btlLogin" runat="server" class="button" Text="Login" OnClick="btlLogin_Click" />
        </form>
    </div>
</body>
</html>
