<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SerenaSouvenirSanctuary.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 style="text-align:center;">All Orders</h2>

    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" OnRowCommand="gvOrders_RowCommand" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
            <asp:BoundField DataField="Username" HeaderText="Customer" />
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="DeliveryAddress" HeaderText="Address" />
            <asp:BoundField DataField="PaymentMethod" HeaderText="Payment" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Total ($)" DataFormatString="{0:F2}" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:Button ID="btnMarkDelivered" runat="server" Text="Mark Delivered"
                        CommandName="MarkDelivered"
                        CommandArgument='<%# Eval("OrderID") %>'
                        Visible='<%# Eval("Status").ToString() == "Processing" %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
</asp:Content>
