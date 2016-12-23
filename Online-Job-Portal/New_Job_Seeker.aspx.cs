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

public partial class New_Job_Seeker : System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)
        { 
            Image1.ImageUrl = "Uploaded_Images/dummy.jpg";
            qualificationLoader();
            Domain_Loader();
            
        }
        else if(txtPassword.Text != String.Empty)
        {
            Session["pwd"] = txtPassword.Text;
        }
    }

    private void qualificationLoader()
    {
        string constng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constng))
        {
            using (SqlCommand cmd = new SqlCommand("[highest_qualification_procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();

                    da.Fill(ds);
                    DropDownListQualification.DataSource = ds.Tables[0];
                    DropDownListQualification.DataTextField = "highest_qualification_menu";
                    DropDownListQualification.DataValueField = "id";
                    DropDownListQualification.DataBind();
                }

            }
        }
        DropDownListQualification.Items.Insert(0, new ListItem("---Select Qualification---","0"));
    }


    private void Domain_Loader()
    {
        string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constrng))
        {
            using (SqlCommand cmd = new SqlCommand("[domain_procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();

                    da.Fill(ds);
                    DropDownListDomain.DataSource = ds.Tables[0];
                    DropDownListDomain2.DataSource = ds.Tables[0];
                    DropDownListDomain.DataTextField = "domain_menu";
                    DropDownListDomain2.DataTextField = "domain_menu";
                    DropDownListDomain.DataValueField = "id";
                    DropDownListDomain2.DataValueField = "id";
                    DropDownListDomain.DataBind();
                    DropDownListDomain2.DataBind();
                }
            }
        }
        DropDownListDomain.Items.Insert(0, new ListItem("Select Domain","0"));
        DropDownListDomain2.Items.Insert(0, new ListItem("Select Domain", "0"));
    }

    protected void CheckBoxFresher_CheckedChanged(object sender, EventArgs e)
    {

    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Finish_Button_Data_Entry();
        FormSubmissionSuccessMessage();

        string photo_name = Path.GetFileName(this.FileUpload1.PostedFile.FileName);
        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploaded_Images/") + photo_name);

        string resume_name = Path.GetFileName(this.FileUpload2.PostedFile.FileName);
        FileUpload2.PostedFile.SaveAs(Server.MapPath("~/Uploaded_Resumes/") + resume_name);
    }

    
    private void Finish_Button_Data_Entry()
    {
        string cnstrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cnstrng))
        {
            using (SqlCommand cmd = new SqlCommand("[Insert_New_Job_Seeker_Procedure]", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = txtName.Text;
                cmd.Parameters.Add("@address", SqlDbType.VarChar).Value = txtAddress.Text;
                cmd.Parameters.Add("@gender", SqlDbType.VarChar).Value = RadioButtonList1.SelectedValue.ToString();
                cmd.Parameters.Add("@dob", SqlDbType.VarChar).Value = txtDateOfBirth.Text;
                cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = txtPhone.Text;
                cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = txtEmail.Text;
                cmd.Parameters.Add("@passwords", SqlDbType.VarChar).Value = Session["pwd"].ToString();
                cmd.Parameters.Add("@photo", SqlDbType.VarChar).Value = Path.GetFileName(this.FileUpload1.PostedFile.FileName).ToString();
                
                cmd.Parameters.Add("@Highquali", SqlDbType.VarChar).Value = DropDownListQualification.SelectedItem.Text;
                cmd.Parameters.Add("@specialization", SqlDbType.VarChar).Value = txtSpecilization.Text;
                cmd.Parameters.Add("@marks", SqlDbType.VarChar).Value = txtMarksObtained.Text;
                //yearOfPassing
                cmd.Parameters.Add("@university", SqlDbType.VarChar).Value = txtBoard.Text;
                cmd.Parameters.Add("@certificate", SqlDbType.VarChar).Value = txtCertification.Text;

                if(CheckBoxFresher.Checked==true)
                {
                    cmd.Parameters.Add("@job_status", SqlDbType.VarChar).Value = "Fresher";
                    cmd.Parameters.Add("@domain", SqlDbType.VarChar).Value = "NA";
                    cmd.Parameters.Add("@proficiency", SqlDbType.VarChar).Value = "NA";
                    cmd.Parameters.Add("@experience", SqlDbType.VarChar).Value = "NA";
                    cmd.Parameters.Add("@work_period", SqlDbType.VarChar).Value = "NA";
                    cmd.Parameters.Add("@currently_work", SqlDbType.VarChar).Value = "No";
                    cmd.Parameters.Add("@company_name", SqlDbType.VarChar).Value = "NA";
                }
                else
                {
                    cmd.Parameters.Add("@job_status", SqlDbType.VarChar).Value = "Expirienced";
                    cmd.Parameters.Add("@domain", SqlDbType.VarChar).Value = DropDownListDomain.SelectedItem.Text;
                    cmd.Parameters.Add("@proficiency", SqlDbType.VarChar).Value = txtProficiency.Text;
                    cmd.Parameters.Add("@experience", SqlDbType.VarChar).Value = txtExpirienced.Text;
                    cmd.Parameters.Add("@work_period", SqlDbType.VarChar).Value = txtWorkingPeriod.Text;

                    if(CheckBoxYes.Checked==true)
                    {
                        cmd.Parameters.Add("@currently_work", SqlDbType.VarChar).Value = "Yes";
                        cmd.Parameters.Add("@company_name", SqlDbType.VarChar).Value = txtEmployerName.Text;
                    }
                    else if(CheckBoxNo.Checked==true)
                    {
                        cmd.Parameters.Add("@currently_work", SqlDbType.VarChar).Value = "No";
                        cmd.Parameters.Add("@company_name", SqlDbType.VarChar).Value = "NA";
                    }
                    
                }

                cmd.Parameters.Add("@apply_domain", SqlDbType.VarChar).Value = DropDownListDomain2.SelectedItem.Text;
                cmd.Parameters.Add("@apply_proficency", SqlDbType.VarChar).Value = txtapplyingProficiency.Text;
                cmd.Parameters.Add("@resume", SqlDbType.VarChar).Value = Path.GetFileName(this.FileUpload2.PostedFile.FileName).ToString();
                
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                
            }
        }
    }

    private void FormSubmissionSuccessMessage()
    {
        string message = "Your Details were Submitted Successfully !! Redirecting to Login Page";
        //System.Text.StringBuilder sb = new System.Text.StringBuilder();
        //sb.Append("<script type='text/javascript'>");
        //sb.Append("window.onload=function(){");
        //sb.Append("alert('");
        //sb.Append(message);
        //sb.Append("')};");
        //sb.Append("</script>");
        //ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + message + "');window.location = 'Login.aspx';", true);

    }

    protected void FileUpload1_Load(object sender, EventArgs e)
    {
        
    }
}