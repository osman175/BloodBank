using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace BloodBank
{
    public partial class EmployeeLogin : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BloodBank"].ConnectionString;
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        private string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            connection = new SqlConnection(connectionString);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            // Checks
            if (EmployeeIdTextBox.Text == "" || PasswordTextBox.Text == "")
            {
                Response.Write("<script>alert('Please check all the fields')</script>");
                return;
            }

            // All fields ok
            connection.Open();
            query = "SELECT * FROM Employee WHERE id="+ EmployeeIdTextBox.Text +"AND password='" + PasswordTextBox.Text + "'";
            command = new SqlCommand(query, connection);
            reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Session["actor"] = "Employee";
                Session["id"] = reader["id"];
                Session["name"] = reader["name"];
                Response.Redirect("EmployeeDashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid request')</script>");
            }
            reader.Close();
            connection.Close();
        }
    }
}