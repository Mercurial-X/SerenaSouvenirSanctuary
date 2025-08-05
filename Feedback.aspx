<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="SerenaSouvenirSanctuary.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Feedback</h2>

    <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label><br />

    <label>Name:</label><br />
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required." ForeColor="Red" Display="Dynamic" /><br />

    <label>Email:</label><br />
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" /><br />
    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="Invalid email format." ForeColor="Red" Display="Dynamic" /><br />

    <label>Message:</label><br />
    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox><br />
    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" ErrorMessage="Message is required." ForeColor="Red" Display="Dynamic" /><br /><br />

    <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" OnClick="btnSubmit_Click" />

</asp:Content>
