<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SerenaSouvenirSanctuary.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome, <asp:Label ID="lblUsername" runat="server" />!</h2>
    <p>You are logged in as: <asp:Label ID="lblRole" runat="server" />.</p>
    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
</asp:Content>
