using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class JobSeekerProfilePage : System.Web.UI.Page
{
    string id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Session["user_id"].ToString();
        lblProfileUpdateSuccess.Visible = false;
        if (!Page.IsPostBack)
        {
            LoadProfileData();
        }
    }

    protected void btnProfileUpdate_Click(object sender, EventArgs e)
    {
        string conStrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(conStrng))
        {
            using (SqlCommand cmd = new SqlCommand("[Update_JobSeeker_Profile_Procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@userid", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtProfileName.Text;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtProfileAddress.Text;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtProfileEmail.Text;
                cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = txtProfilePhone.Text;
                cmd.Parameters.Add("@dob", SqlDbType.VarChar).Value = txtProfileDob.Text;
                cmd.Parameters.Add("@Highquali", SqlDbType.VarChar).Value = txtProfileHighqualification.Text;
                cmd.Parameters.Add("@specialization", SqlDbType.VarChar).Value = txtProfileSpecialization.Text;
                cmd.Parameters.Add("@marks", SqlDbType.Int).Value = txtProfileMarks.Text;
                cmd.Parameters.Add("@university", SqlDbType.VarChar).Value = txtProfileUniversity.Text;
                cmd.Parameters.Add("@certificate", SqlDbType.VarChar).Value = txtProfileCertificate.Text;
                cmd.Parameters.Add("@job_status", SqlDbType.VarChar).Value = txtProfileJobStatus.Text;
                cmd.Parameters.Add("@domain", SqlDbType.VarChar).Value = txtProfileDomain.Text;

                con.Open();
                int a = cmd.ExecuteNonQuery();
                con.Close();

                if(a==0)
                {
                    lblProfileUpdateSuccess.Visible = true;
                    lblProfileUpdateSuccess.ForeColor = System.Drawing.Color.Red;
                    lblProfileUpdateSuccess.Text = "Failed";

                }
                else
                {
                    lblProfileUpdateSuccess.Visible = true;
                    lblProfileUpdateSuccess.ForeColor = System.Drawing.Color.Green;
                    lblProfileUpdateSuccess.Text = "Updated Successfully";
                    LoadProfileData();
                }
                
            }
        }
    }

    private void LoadProfileData()
    {
        string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constrng))
        {
            using (SqlCommand cmd = new SqlCommand("[Load_Profile_Data_Procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();

                cmd.Parameters.AddWithValue("@userid",id);

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtProfileName.Text = dr[1].ToString();
                    txtProfileAddress.Text = dr[2].ToString();
                    txtProfileEmail.Text = dr[3].ToString();
                    txtProfilePhone.Text = dr[4].ToString();
                    txtProfileDob.Text = dr[5].ToString();
                    txtProfileHighqualification.Text = dr[6].ToString();
                    txtProfileSpecialization.Text = dr[7].ToString();
                    txtProfileMarks.Text = dr[8].ToString();
                    txtProfileUniversity.Text = dr[9].ToString();
                    txtProfileCertificate.Text = dr[10].ToString();
                    txtProfileJobStatus.Text = dr[11].ToString();
                    txtProfileDomain.Text = dr[12].ToString();
                }
                dr.Close();

                //SqlDataAdapter da = new SqlDataAdapter();
                //DataSet ds = new DataSet();
                //da.Fill(ds);
                //txtProfileName.Text = ds.Tables[0].Rows[0][1].ToString();

                con.Close();
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

    protected void btnProfileEdit_Click(object sender, EventArgs e)
    {

    }
}