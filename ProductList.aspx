<%@ Page Title="Product Catalog" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="SerenaSouvenirSanctuary.ProductList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="text-align:center;">Product Catalog</h2>

    <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
        <ItemTemplate>
            <div class="product" style="border:1px solid #ccc; padding:10px; margin:10px; float:left; width:200px; text-align:center;">
                <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' style="width:180px; height:180px;" /><br />
                <strong><%# Eval("Name") %></strong><br />
                <span>Price: $<%# Eval("Price", "{0:F2}") %></span><br />
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart"
                    CommandName="AddToCart"
                    CommandArgument='<%# Eval("ProductID") %>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
