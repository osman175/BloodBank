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
    public partial class BloodTransferList : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BloodBank"].ConnectionString;
        private SqlConnection connection;
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

            // List all Patients
            connection.Open();
            query = "SELECT * FROM BloodTransfer";
            adapter = new SqlDataAdapter(query, connection);
            dataTable = new DataTable();
            adapter.Fill(dataTable);
            connection.Close();

            BloodTransfersGridView.DataSource = dataTable;
            BloodTransfersGridView.DataBind();
        }
    }
}