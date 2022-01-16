using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace BloodBank
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BloodBank"].ConnectionString;
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataReader reader;
        private string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["actor"] == null || Session["id"] == null)
            {
                Response.Redirect("Index.aspx");
                return;
            }
            if (Session["actor"] != null && Session["actor"].ToString() != "Admin")
            {
                Response.Redirect("Index.aspx");
                return;
            }
            AdminNameLabel.Text = Session["name"] as string;

            connection = new SqlConnection(connectionString);

            connection.Open();
            // Count employees
            query = "SELECT COUNT(*) AS count FROM Employee";
            command = new SqlCommand(query, connection);
            reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                EmployeesLabel.Text = reader["count"].ToString();
            }
            reader.Close();

            // Count available donors
            query = "SELECT COUNT(*) AS count FROM Donor WHERE available='Yes'";
            command = new SqlCommand(query, connection);
            reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                AvailableDonorsLabel.Text = reader["count"].ToString();
            }
            reader.Close();

            // Count all patients
            query = "SELECT COUNT(*) AS count FROM Patient";
            command = new SqlCommand(query, connection);
            reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                PatientsLabel.Text = reader["count"].ToString();
            }
            reader.Close();

            connection.Close();
        }
    }
}