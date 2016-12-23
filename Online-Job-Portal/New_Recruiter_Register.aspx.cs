using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;
using System.Drawing;

public partial class New_Recruiter_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblRecruiterRegister_SuccessMessage.Visible = false;
    }

    protected void btnRecruiterRegister_Submit_Click(object sender, EventArgs e)
    {
        string ConStrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(ConStrng))
        {
            using (SqlCommand cmd = new SqlCommand("[Insert_NewRecruiter_Procedure]",con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@RecruiterName",txtRecruiterRegister_RecruiterName.Text);
                cmd.Parameters.AddWithValue("@Company_password", txtRecruiterRegister_Password.Text);
                cmd.Parameters.AddWithValue("@designation", txtRecruiterRegister_Designation.Text);
                cmd.Parameters.AddWithValue("@Company_Name", txtRecruiterRegister_CompanyName.Text);
                cmd.Parameters.AddWithValue("@Company_Address", txtRecruiterRegister_CompanyAddress.Text);
                cmd.Parameters.AddWithValue("@Company_Email", txtRecruiterRegister_CompanyEmail.Text);
                cmd.Parameters.AddWithValue("@Company_Phone", txtRecruiterRegister_CompanyPhone.Text);
                cmd.Parameters.AddWithValue("@Company_Photo", Path.GetFileName(FileUpload1.PostedFile.FileName));

                con.Open();
                int a = cmd.ExecuteNonQuery();
                con.Close();

                if(a>0)
                {
                    lblRecruiterRegister_SuccessMessage.Visible = true;
                    lblRecruiterRegister_SuccessMessage.ForeColor = Color.Green;
                    lblRecruiterRegister_SuccessMessage.Text = "Data Recorded Successfully ! ";

                    string photo_name = Path.GetFileName(this.FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploaded_Images/") + photo_name);
                }
                else
                {
                    lblRecruiterRegister_SuccessMessage.Visible = true;
                    lblRecruiterRegister_SuccessMessage.ForeColor = Color.DarkRed;
                    lblRecruiterRegister_SuccessMessage.Text = "Data NOT Recorded ";
                }
            }
        }
    }
}