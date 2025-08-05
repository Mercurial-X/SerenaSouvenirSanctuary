using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SerenaSouvenirSanctuary
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    SELECT o.OrderID, u.Username, o.OrderDate, o.DeliveryAddress, o.PaymentMethod, o.TotalAmount, o.Status
                    FROM Orders o
                    JOIN Users u ON o.UserID = u.UserID
                    ORDER BY o.OrderDate DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvOrders.DataSource = dt;
                gvOrders.DataBind();
            }
        }

        protected void gvOrders_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MarkDelivered")
            {
                int orderId = Convert.ToInt32(e.CommandArgument);

                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("UPDATE Orders SET Status = 'Delivered' WHERE OrderID = @OrderID", conn);
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = $"Order #{orderId} marked as delivered.";
                LoadOrders();
            }
        }
    }
}
