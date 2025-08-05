<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SerenaSouvenirSanctuary.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="text-align:center;">Your Cart</h2>

    <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="false" OnRowCommand="gvCart_RowCommand">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
            <asp:BoundField DataField="Name" HeaderText="Product Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnRemove" runat="server" CommandName="Remove" CommandArgument='<%# Eval("ProductID") %>' Text="Remove" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div class="actions" style="text-align:center;">
        <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Font-Size="Larger"></asp:Label>
        <br /><br />
        <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" OnClick="btnCheckout_Click" />
    </div>
</asp:Content>
