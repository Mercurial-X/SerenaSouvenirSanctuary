<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SerenaSouvenirSanctuary._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron text-center" style="padding: 60px; background-color: #ffe5cc; border-radius: 10px;">
        <h1 class="display-4">Welcome to Serena’s Souvenir Sanctuary</h1>
        <p class="lead">Your go-to destination for handcrafted mementos and timeless treasures.</p>
        <hr class="my-4" />
        <p>Browse our catalog and bring a piece of Serena’s magic into your life.</p>
        <asp:Button ID="btnBrowse" runat="server" Text="Start Shopping" CssClass="btn btn-warning btn-lg" PostBackUrl="~/ProductList.aspx" />
    </div>

    <div class="row text-center">
        <div class="col-md-4">
            <h3>Curated Collections</h3>
            <p>Explore unique souvenirs that tell a story. From local crafts to exclusive keepsakes.</p>
        </div>
        <div class="col-md-4">
            <h3>Easy Checkout</h3>
            <p>Secure payments with credit card or cash on delivery. Instant order tracking available.</p>
        </div>
        <div class="col-md-4">
            <h3>Customer Support</h3>
            <p>Need help or have questions? Our team is just one click away via the Feedback page.</p>
        </div>
    </div>
</asp:Content>
