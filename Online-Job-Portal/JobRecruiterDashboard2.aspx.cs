using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class JobRecruiterDashboard2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!this.IsPostBack)
        {
            lblDashboard_Name.Text = Session["r_name"].ToString();
            lblDashboard_Company.Text = Session["r_comp"].ToString();

            string filename = Session["r_pic"].ToString();
            Dashboard_Recruiter_photo.ImageUrl = "~/Uploaded_Images/" + filename;

            this.BindGrid();
        }
        
    }

    private void BindGrid()
    {
        string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constrng))
        {
            using (SqlCommand cmd = new SqlCommand("Jobrecruiter_Dashboard2"))
            {
                cmd.Parameters.AddWithValue("@Action","SELECT");
                cmd.Parameters.AddWithValue("@Recruiter_id", Convert.ToInt32(Session["r_idd"].ToString()));
                using (SqlDataAdapter da = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    da.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        da.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
    }

    protected void Insert(object sender, EventArgs e)
    {
        string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constrng))
        {
            using (SqlCommand cmd = new SqlCommand("Jobrecruiter_Dashboard2"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "INSERT");
                cmd.Parameters.AddWithValue("@Descrition" , txt_Dashboard2_Description.Text);
                cmd.Parameters.AddWithValue("@Posted_date", txt_Dashboard2_JobPostedDate.Text);
                cmd.Parameters.AddWithValue("@Status", txt_Dashboard2_JobPostedStatus.Text);
                cmd.Parameters.AddWithValue("@No_Of_Vacncies", txt_Dashboard2_JobPostedVacancies.Text);
                cmd.Parameters.AddWithValue("@Recruiter_id", Convert.ToInt32(Session["r_idd"].ToString()));
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindGrid();
    }
    

    protected void OnRowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        this.BindGrid();
    }

    protected void OnRowCancelingEdit(object sender, EventArgs e)
    {
        GridView1.EditIndex = -1;
        this.BindGrid();
    }

    
    protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int JobPostedID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        string desc = (row.FindControl("txt_Dashboard2_Description") as TextBox).Text;
        string date = (row.FindControl("txt_Dashboard2_JobPostedDate") as TextBox).Text;
        string status = (row.FindControl("txt_Dashboard2_JobPostedStatus") as TextBox).Text;
        int vacancy = Convert.ToInt32((row.FindControl("txt_Dashboard2_JobPostedVacancies") as TextBox).Text);
        string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constrng))
        {
            using (SqlCommand cmd = new SqlCommand("Jobrecruiter_Dashboard2"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "UPDATE");
                cmd.Parameters.AddWithValue("@Descrition", desc);
                cmd.Parameters.AddWithValue("@Posted_date", date);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@No_Of_Vacncies",vacancy);
                cmd.Parameters.AddWithValue("@Jobposted_id", JobPostedID);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        GridView1.EditIndex = -1;
        this.BindGrid();
    }


    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
        {
            (e.Row.Cells[5].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this ?');";
        }
    }


    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //int JobPostedID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        int JobPostedID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        string constrng = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constrng))
        {
            using (SqlCommand cmd = new SqlCommand("Jobrecruiter_Dashboard2"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@Jobposted_id", JobPostedID);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        this.BindGrid();
    }
}