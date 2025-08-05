using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SerenaSouvenirSanctuary
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            if (Session["Cart"] != null)
            {
                DataTable cart = (DataTable)Session["Cart"];

                // Create a new DataTable with product details
                DataTable displayTable = new DataTable();
                displayTable.Columns.Add("ProductID", typeof(int));
                displayTable.Columns.Add("Name", typeof(string));
                displayTable.Columns.Add("Price", typeof(decimal));
                displayTable.Columns.Add("Quantity", typeof(int));

                string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    foreach (DataRow row in cart.Rows)
                    {
                        int productId = (int)row["ProductID"];
                        int qty = (int)row["Quantity"];

                        SqlCommand cmd = new SqlCommand("SELECT Name, Price FROM Products WHERE ProductID = @ProductID", conn);
                        cmd.Parameters.AddWithValue("@ProductID", productId);

                        conn.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            DataRow displayRow = displayTable.NewRow();
                            displayRow["ProductID"] = productId;
                            displayRow["Name"] = reader["Name"].ToString();
                            displayRow["Price"] = Convert.ToDecimal(reader["Price"]);
                            displayRow["Quantity"] = qty;
                            displayTable.Rows.Add(displayRow);
                        }
                        conn.Close();
                    }
                }

                gvCart.DataSource = displayTable;
                gvCart.DataBind();

                decimal total = 0;
                foreach (DataRow row in displayTable.Rows)
                {
                    total += (decimal)row["Price"] * (int)row["Quantity"];
                }
                lblTotal.Text = "Total: $" + total.ToString("0.00");
            }
            else
            {
                gvCart.DataSource = null;
                gvCart.DataBind();
                lblTotal.Text = "Your cart is empty.";
            }
        }

        protected void gvCart_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                DataTable cart = (DataTable)Session["Cart"];

                DataRow[] rows = cart.Select("ProductID = " + productId);
                if (rows.Length > 0)
                {
                    cart.Rows.Remove(rows[0]);
                    Session["Cart"] = cart;
                }
                LoadCart();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}