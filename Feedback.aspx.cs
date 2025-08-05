using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SerenaSouvenirSanctuary
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();

            string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Feedback (Name, Email, Message, SubmittedOn) VALUES (@Name, @Email, @Message, GETDATE())", conn);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Message", message);

                conn.Open();
                cmd.ExecuteNonQuery();

                lblStatus.Text = "Thank you for your feedback!";
                txtName.Text = "";
                txtEmail.Text = "";
                txtMessage.Text = "";
            }
        }
    }
}