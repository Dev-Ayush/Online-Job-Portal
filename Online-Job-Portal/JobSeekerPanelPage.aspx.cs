using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobSeekerPanelPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        txtPanelName.Text = Session["Fullname"].ToString();
        txtPanelPhone.Text = Session["user_email"].ToString();
        txtPanelEmail.Text = Session["user_phone"].ToString();
        
    }

    //[WebMethod(EnableSession =true)]
    //public static string LogOutUser(string name)
    //{

    //    Session.Clear();
    //    Session.Abandon();
    //    Session.RemoveAll();



    //}


    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }
}