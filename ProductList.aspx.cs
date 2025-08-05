using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace SerenaSouvenirSanctuary
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }

            // Hook the item command event
            rptProducts.ItemCommand += rptProducts_ItemCommand;
        }

        private void LoadProducts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        protected void rptProducts_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                int productId = Convert.ToInt32(e.CommandArgument);

                // Load cart from session or create a new one
                DataTable cart;
                if (Session["Cart"] == null)
                {
                    cart = new DataTable();
                    cart.Columns.Add("ProductID", typeof(int));
                    cart.Columns.Add("Quantity", typeof(int));
                }
                else
                {
                    cart = (DataTable)Session["Cart"];
                }

                // Check if product is already in cart
                DataRow existing = cart.Select("ProductID = " + productId).FirstOrDefault();
                if (existing != null)
                {
                    existing["Quantity"] = Convert.ToInt32(existing["Quantity"]) + 1;
                }
                else
                {
                    DataRow newRow = cart.NewRow();
                    newRow["ProductID"] = productId;
                    newRow["Quantity"] = 1;
                    cart.Rows.Add(newRow);
                }

                // Save back to session
                Session["Cart"] = cart;
            }
        }
    }
}
