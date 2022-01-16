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
    public partial class AvailableDonorList : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BloodBank"].ConnectionString;
        private SqlConnection connection;
        private SqlCommand command;
        private SqlDataAdapter adapter;
        private DataTable dataTable;
        private string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["actor"] == null || Session["id"] == null)
            {
                Response.Redirect("Index.aspx");
                return;
            }

            connection = new SqlConnection(connectionString);
            
            // List all available donors
            connection.Open();
            query = "SELECT * FROM Donor WHERE available='Yes'";
            adapter = new SqlDataAdapter(query, connection);
            dataTable = new DataTable();
            adapter.Fill(dataTable);
            connection.Close();

            DonorsGridView.DataSource = dataTable;
            DonorsGridView.DataBind();
        }
    }
}