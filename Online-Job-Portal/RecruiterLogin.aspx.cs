using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

public partial class RecruiterLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLoginUserFailedMessage.Text = "";
    }

    protected void btnLoginSubmit_Click(object sender, EventArgs e)
    {
        string error_msg = String.Empty;
        string nameee = string.Empty;

        string conStrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrng))
        {
            using (SqlCommand cmd = new SqlCommand("[Recruiter_Login_Check_Procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@email",txtRecruiterLoginUsername.Text);
                cmd.Parameters.AddWithValue("@password",txtRecruiterLoginPassword.Text);
                cmd.Parameters.Add("@error", SqlDbType.VarChar,100);
                cmd.Parameters["@error"].Direction = ParameterDirection.Output;
                SqlDataReader dr;
                dr = cmd.ExecuteReader(); // On Success, error_msg is returning Null
                dr.Read();
                error_msg = (string)cmd.Parameters["@error"].Value;
                if (string.IsNullOrEmpty(error_msg))
                {
                    //nameee = dr.GetValue(1).ToString();
                    //lblLoginUserFailedMessage.ForeColor = Color.Green;
                    //lblLoginUserFailedMessage.Text = "Hello " + nameee;

                    Session["r_name"] = dr.GetValue(1).ToString();
                    Session["r_idd"] = dr.GetValue(0).ToString();
                    Session["r_comp"] = dr.GetValue(2).ToString();
                    Session["r_pic"] = dr.GetValue(3).ToString();

                    Response.Redirect("JobRecruiterDashboard2.aspx");
                }
                else
                {
                    lblLoginUserFailedMessage.ForeColor = Color.Red;
                    lblLoginUserFailedMessage.Text = error_msg;
                }
                dr.Close();
                con.Close();
            }
        }
        
    }
}