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
    public partial class BloodTransferAdd : System.Web.UI.Page
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

            connection = new SqlConnection(connectionString);
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            // Checks
            if (PatientTextBox.Text == "" || DonorTextBox.Text == "" || DateTextBox.Text == "")
            {
                Response.Write("<script>alert('Please check all the fields')</script>");
                return;
            }

            connection.Open();
            query = "INSERT INTO BloodTransfer (patient_id, donor_id, date) VALUES(" + PatientTextBox.Text.Trim() + ", " + DonorTextBox.Text.Trim() + ", '" + DateTextBox.Text + "')";
            command = new SqlCommand(query, connection);
            if (command.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('Successfully added!')</script>");
                // Redirect
                Response.Redirect("BloodTransferList.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sorry! Unable to add')</script>");
            }
            connection.Close(); 
        }
    }
}