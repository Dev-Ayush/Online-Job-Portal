using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblLoginUserFailedMessage.Visible = false;
    }

    protected void btnLoginSubmit_Click(object sender, EventArgs e)
    {
        string ErrorMessage = "";
        string id, FullName,email,phone = "";
        try
        { 
        string cnsstrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cnsstrng))
        {
            using (SqlCommand cmd = new SqlCommand("[login_check_procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@email",txtLoginEmail.Text);
                cmd.Parameters.AddWithValue("@password",txtLoginPassword.Text);
                SqlDataReader dr;
                dr = cmd.ExecuteReader();
                dr.Read();
                id = dr.GetValue(0).ToString();
                FullName = dr.GetValue(1).ToString();
                email = dr.GetValue(2).ToString();
                phone = dr.GetValue(3).ToString();
                dr.Close();
                con.Close();

                //HttpCookie c_id = new HttpCookie("user_id");
                //HttpCookie c_fullname = new HttpCookie("user_fullname");
                //c_id.Value = id;
                //c_fullname.Value = FullName;
                //Response.Cookies.Add(c_id);
                //Response.Cookies.Add(c_fullname);

                Session["user_id"] = id;
                Session["Fullname"] = FullName;
                Session["user_email"] = email;
                Session["user_phone"] = phone;

                if(id !="")
                {
                        string msg = "Success";
                        //ClientScript.RegisterStartupScript(Page.GetType(),"validation","<script>alert('"+msg+"')</script>");
                        Server.Transfer("JobSeekerPanelPage.aspx");
                }
            }
          }
        }
        catch (Exception ee)
        {
            ErrorMessage = ee.Message;
            ClientScript.RegisterStartupScript(Page.GetType(),"validation","<script>alert('"+ErrorMessage+"')</script>");
            lblLoginUserFailedMessage.Visible = true;
            lblLoginUserFailedMessage.ForeColor = Color.Red;
            lblLoginUserFailedMessage.Text = "Login Failed";
        }
    }
}