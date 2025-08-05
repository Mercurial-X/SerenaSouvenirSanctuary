<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="SerenaSouvenirSanctuary.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Checkout</h2>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Green" /><br />

    <label>Delivery Address:</label><br />
    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" /><br />
    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required." ForeColor="Red" Display="Dynamic" /><br />

    <label>Payment Method:</label><br />
    <asp:DropDownList ID="ddlPaymentMethod" runat="server">
        <asp:ListItem Text="-- Select --" Value="" />
        <asp:ListItem Text="Credit Card" Value="Credit Card" />
        <asp:ListItem Text="Cash on Delivery" Value="Cash on Delivery" />
    </asp:DropDownList><br />
    <asp:RequiredFieldValidator ID="rfvPayment" runat="server" ControlToValidate="ddlPaymentMethod" InitialValue="" ErrorMessage="Select a payment method." ForeColor="Red" Display="Dynamic" /><br /><br />

    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" OnClick="btnPlaceOrder_Click" />

</asp:Content>
