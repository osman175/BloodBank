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
    public partial class EmployeeRegister : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["BloodBank"].ConnectionString;
        private SqlConnection connection;
        private SqlDataReader reader;
        private SqlCommand command;
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

            connection = new SqlConnection(connectionString);

            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                connection.Open();
                query = "SELECT * FROM Employee WHERE id='" + id + "'";
                command = new SqlCommand(query, connection);
                reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    reader.Read();
                    NameTextBox.Text = reader["name"].ToString();
                    BloodGroupDropDownList.SelectedItem.Value = reader["blood_group"].ToString();
                    GenderDropDownList.SelectedItem.Value = reader["gender"].ToString();
                    DoBTextBox.Text = reader["date_of_birth"].ToString();
                    AddressTextBox.Text = reader["address"].ToString();
                    PhoneTextBox.Text = reader["phone"].ToString();
                }
                reader.Close();
                connection.Close();

                // Delete row
                connection.Open();
                query = "DELETE FROM Employee WHERE id='" + id + "'";
                command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // Checks
            if (NameTextBox.Text == "" || BloodGroupDropDownList.SelectedIndex == 0 || GenderDropDownList.SelectedIndex == 0 || DoBTextBox.Text == "" || PhoneTextBox.Text == "" || AddressTextBox.Text == "" || PasswordTextBox.Text.Length < 6 || ConfirmPasswordTextBox.Text.Length < 6)
            {
                Response.Write("<script>alert('Please check all the fields')</script>");
                return;
            }
            if (PasswordTextBox.Text != ConfirmPasswordTextBox.Text)
            {
                Response.Write("<script>alert('Passwords does not match')</script>");
                return;
            }

            // All fields are ok
            connection.Open();
            query = "INSERT INTO Employee (name, phone, address, password, gender, date_of_birth, blood_group) VALUES('" + NameTextBox.Text.Trim() + "', '" + PhoneTextBox.Text.Trim() + "', '" + AddressTextBox.Text + "', '" + PasswordTextBox.Text + "', '" + GenderDropDownList.SelectedItem.Text + "', '" + DoBTextBox.Text + "', '" + BloodGroupDropDownList.SelectedItem.Text + "')";
            command = new SqlCommand(query, connection);
            if (command.ExecuteNonQuery() > 0)
            {
                Response.Write("<script>alert('Registration Successful!')</script>");
                // Redirect
                Response.Redirect("EmployeeList.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sorry! Unable to register')</script>");
            }

            connection.Close();   
        }
    }
}