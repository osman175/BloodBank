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
    public partial class PatientList : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                // List all Patients
                connection.Open();
                query = "SELECT * FROM Patient";
                adapter = new SqlDataAdapter(query, connection);
                dataTable = new DataTable();
                adapter.Fill(dataTable);
                connection.Close();

                PatientsGridView.DataSource = dataTable;
                PatientsGridView.DataBind();
            }
        }

        protected void PatientsGridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                string id = e.CommandArgument.ToString();
                Response.Redirect(string.Format("~/PatientEdit.aspx?id={0}", id));
            }
            if (e.CommandName == "DeleteRow")
            {
                string id = e.CommandArgument.ToString();
                Response.Write("Delete " + id);
                
                query = "DELETE FROM Patient WHERE id='" + id + "'";
                command = new SqlCommand(query, connection);
                connection.Open();
                if (command.ExecuteNonQuery() > 0)
                {
                    Response.Write("<script>alert('Deleted successfuly!')</script>");
                    Response.Redirect("PatientList.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Delete failed')</script>");
                }
                connection.Close();               
            }
        }
    }
}