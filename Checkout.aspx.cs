using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SerenaSouvenirSanctuary
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] == null)
            {
                lblMessage.Text = "Your cart is empty.";
                return;
            }

            DataTable cart = (DataTable)Session["Cart"];
            string address = txtAddress.Text.Trim();
            string payment = ddlPaymentMethod.SelectedValue;

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // Insert into Orders
                    SqlCommand cmdOrder = new SqlCommand("INSERT INTO Orders (UserID, OrderDate, DeliveryAddress, PaymentMethod, TotalAmount, Status) OUTPUT INSERTED.OrderID VALUES (@UserID, GETDATE(), @Address, @Payment, @Total, 'Processing')", conn, transaction);

                    // Dummy UserID (replace with real one from session in future)
                    cmdOrder.Parameters.AddWithValue("@UserID", 1);
                    cmdOrder.Parameters.AddWithValue("@Address", address);
                    cmdOrder.Parameters.AddWithValue("@Payment", payment);

                    decimal total = 0;
                    foreach (DataRow row in cart.Rows)
                    {
                        int qty = Convert.ToInt32(row["Quantity"]);

                        SqlCommand getPriceCmd = new SqlCommand("SELECT Price FROM Products WHERE ProductID = @ID", conn, transaction);
                        getPriceCmd.Parameters.AddWithValue("@ID", row["ProductID"]);
                        decimal price = (decimal)getPriceCmd.ExecuteScalar();

                        total += price * qty;
                    }
                    cmdOrder.Parameters.AddWithValue("@Total", total);
                    int orderId = (int)cmdOrder.ExecuteScalar();

                    // Insert into OrderItems
                    foreach (DataRow row in cart.Rows)
                    {
                        SqlCommand cmdItem = new SqlCommand("INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES (@OrderID, @ProductID, @Quantity, @Price)", conn, transaction);
                        cmdItem.Parameters.AddWithValue("@OrderID", orderId);
                        cmdItem.Parameters.AddWithValue("@ProductID", row["ProductID"]);
                        cmdItem.Parameters.AddWithValue("@Quantity", row["Quantity"]);

                        SqlCommand getPriceCmd = new SqlCommand("SELECT Price FROM Products WHERE ProductID = @ID", conn, transaction);
                        getPriceCmd.Parameters.AddWithValue("@ID", row["ProductID"]);
                        decimal price = (decimal)getPriceCmd.ExecuteScalar();
                        cmdItem.Parameters.AddWithValue("@Price", price);

                        cmdItem.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    lblMessage.Text = "Order placed successfully!";
                    Session.Remove("Cart");
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    lblMessage.Text = "Error placing order: " + ex.Message;
                }
            }
        }
    }
}