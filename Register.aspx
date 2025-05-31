<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SerenaSouvenirSanctuary.Register" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Register</h2>
    
    <!-- Message label -->
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label><br />

    <!-- Username input -->
    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-control" /><br />
    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
        ControlToValidate="txtUsername"
        ErrorMessage="Username is required."
        ForeColor="Red" Display="Dynamic" /><br />
    <asp:RegularExpressionValidator ID="revUsername" runat="server"
        ControlToValidate="txtUsername"
        ValidationExpression="^[a-zA-Z][a-zA-Z0-9_]{3,19}$"
        ErrorMessage="4–20 characters. Start with letter. Letters, digits, underscore only."
        ForeColor="Red" Display="Dynamic" /><br />

    <!-- Email input -->
    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control" /><br />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="Email is required."
        ForeColor="Red" Display="Dynamic" /><br />
    <asp:RegularExpressionValidator ID="revEmail" runat="server"
        ControlToValidate="txtEmail"
        ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,}$"
        ErrorMessage="Invalid email format."
        ForeColor="Red" Display="Dynamic" /><br />

    <!-- Password input -->
    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control" /><br />
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
        ControlToValidate="txtPassword"
        ErrorMessage="Password is required."
        ForeColor="Red" Display="Dynamic" /><br />
    <asp:RegularExpressionValidator ID="revPassword" runat="server"
        ControlToValidate="txtPassword"
        ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*]{6,20}$"
        ErrorMessage="6–20 chars, must include letters and numbers."
        ForeColor="Red" Display="Dynamic" /><br />

    <!-- Register button -->
    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnRegister_Click" />
</asp:Content>
