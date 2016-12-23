using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

public partial class JobSeekerPasswordChange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblpasswordresult.Visible = false;

    }

    protected void ChangePassword1_ContinueButtonClick(object sender, EventArgs e)
    {
       
    }

    protected void ChangePassword1_ChangedPassword(object sender, EventArgs e)
    {
        
    }

    protected void brnUpdatePassword_Click(object sender, EventArgs e)
    {
        if (!CurrentPassword.Text.Equals(NewPassword.Text, StringComparison.CurrentCultureIgnoreCase))
        {
            int rows_affected = 0;
            string error_msg = "";
            int tem_id = Convert.ToInt32(Session["user_id"]);
            string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constrng))
            {
                using (SqlCommand cmd = new SqlCommand("[UpdatePassword_JobSeeker_Procedure]", con))
                {
                        cmd.CommandType = CommandType.StoredProcedure;
                        //using (SqlDataAdapter da = new SqlDataAdapter())
                        //{
                        con.Open();
                        cmd.Parameters.AddWithValue("@user_id", tem_id);
                        cmd.Parameters.AddWithValue("@new_password", NewPassword.Text);
                        cmd.Parameters.AddWithValue("@old_password", CurrentPassword.Text);
                        cmd.Parameters.Add("@error", SqlDbType.VarChar,100);
                        cmd.Parameters["@error"].Direction = ParameterDirection.Output;
                        //SqlDataReader dr = cmd.ExecuteReader();
                        //while (dr.Read())
                        //{
                        //    string ss = dr.GetString(0);
                        //    con.Close();
                        //    if (ss == CurrentPassword.Text)
                        //{
                        //    con.Open();
                        //    rows_affected = cmd.ExecuteNonQuery();
                        //    con.Close();
                        //    break;
                        //}
                        //else
                        //{
                        //    lblpasswordresult.Visible = true;
                        //    lblpasswordresult.ForeColor = Color.Red;
                        //    lblpasswordresult.Text = "Password didn't matched with Records ";
                        //    break;
                        //}
                        //}
                        //con.Close();
                        
                        rows_affected = cmd.ExecuteNonQuery();
                        error_msg = (string)cmd.Parameters["@error"].Value;
                        con.Close();
                    //}
                }

                if (rows_affected > 0)
                {
                    lblpasswordresult.Visible = true;
                    lblpasswordresult.ForeColor = Color.Green;
                    lblpasswordresult.Text = "Password Updated Successfully ! ";
                }
                else if( error_msg != String.Empty)
                {
                    lblpasswordresult.Visible = true;
                    lblpasswordresult.ForeColor = Color.Red;
                    lblpasswordresult.Text = error_msg;
                }
                
            }
        }
        else
        {
            lblpasswordresult.Visible = true;
            lblpasswordresult.ForeColor = Color.Red;
            lblpasswordresult.Text = "Old & New Password must be Diffrent";
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
}