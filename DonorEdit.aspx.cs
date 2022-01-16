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
    public partial class DonorEdit : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                connection.Open();
                query = "SELECT * FROM Donor WHERE id='" + id + "'";
                command = new SqlCommand(query, connection);
                reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    NameTextBox.Text = reader["name"].ToString();
                    BloodGroupDropDownList.SelectedItem.Value = reader["blood_group"].ToString();
                    GenderDropDownList.SelectedItem.Value = reader["gender"].ToString();
                    DoBTextBox.Text = reader["date_of_birth"].ToString();
                    LastDonatedTextBox.Text = reader["last_donated"].ToString();
                    AddressTextBox.Text = reader["address"].ToString();
                    PhoneTextBox.Text = reader["phone"].ToString();
                    AvailableDropDownList.SelectedItem.Value = reader["available"].ToString();
                }
                reader.Close();
                connection.Close();

                // Delete row
                connection.Open();
                query = "DELETE FROM Donor WHERE id='" + id + "'";
                command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {   // Checks
            if (NameTextBox.Text == "" || BloodGroupDropDownList.SelectedIndex == 0 || GenderDropDownList.SelectedIndex == 0 || AvailableDropDownList.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Please check all the fields')</script>");
                return;
            }

            connection.Open();
            query = "INSERT INTO Donor (name, phone, address, last_donated, gender, date_of_birth, available, blood_group) VALUES('" + NameTextBox.Text.Trim() + "', '" + PhoneTextBox.Text.Trim() + "', '" + AddressTextBox.Text + "', '" + LastDonatedTextBox.Text + "', '" + GenderDropDownList.SelectedItem.Text + "', '" + DoBTextBox.Text + "', '" + AvailableDropDownList.SelectedItem.Text + "', '" + BloodGroupDropDownList.SelectedItem.Text + "')";
            command = new SqlCommand(query, connection);
            if (command.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('Successfully modified!')</script>");
                // Redirect
                Response.Redirect("DonorList.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sorry! Unable to modify')</script>");
            }
            connection.Close(); 
        }
    }
}