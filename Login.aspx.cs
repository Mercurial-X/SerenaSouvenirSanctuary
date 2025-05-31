using System;
using System.Configuration;    // For reading connection strings
using System.Data.SqlClient;   // For SQL DB access
using System.Web.Security;     // For Forms Authentication

namespace SerenaSouvenirSanctuary
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Get user input
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim(); // In production, compare hashed passwords

            // Get connection string from web.config
            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            // Create and open SQL connection
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                // Prepare SQL query to validate user
                SqlCommand cmd = new SqlCommand("SELECT Role FROM Users WHERE Username = @Username AND Password = @Password", conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password); // WARNING: Plaintext. Hash in real apps.

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    string role = result.ToString();

                    // Set session variables
                    Session["Username"] = username;
                    Session["Role"] = role;

                    // Redirect based on role
                    if (role == "admin")
                        Response.Redirect("AdminDashboard.aspx");
                    else
                        Response.Redirect("Home.aspx");
                }
                else
                {
                    // Invalid login
                    lblLoginMsg.Text = "Invalid username or password.";
                }
            }
        }
    }
}
