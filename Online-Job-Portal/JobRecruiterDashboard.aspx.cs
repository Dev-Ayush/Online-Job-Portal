using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobRecruiterDashboard : System.Web.UI.Page
{
    int idd;
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDashboard_Name.Text = Session["r_name"].ToString();
        lblDashboard_Company.Text = Session["r_comp"].ToString();

        string filename = Session["r_pic"].ToString();
        Dashboard_Recruiter_photo.ImageUrl = "~/Uploaded_Images/" + filename;
        idd = Convert.ToInt32(Session["r_idd"].ToString());
        
    }

    protected void Insert(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

    }

    protected void OnRowDataBound(object sender,GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
        {
            (e.Row.Cells[5].Controls[5] as Button).Attributes["onClick"] = "return confirm('Do You Want To Delete This ?');";
        }
    }
}