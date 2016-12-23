using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewRecruiters : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<ListItem> files = new List<ListItem>();
        if (!IsPostBack)
        {
            string[] filepaths = Directory.GetFiles(Server.MapPath("~/Uploaded_Images/"));
            
            foreach(string filepath in filepaths)
            {
                string fileName = Path.GetFileName(filepath);
                files.Add(new ListItem(fileName, "~/Uploaded_Images/" + fileName));
            }
            
        }

        DataTable dt = new DataTable();
        dt.Columns.Add("name");
        dt.Columns.Add("com_name");
        dt.Rows.Add(SqlDataSource1);

        DataTable dt2 = new DataTable();
        dt2.Columns.Add("pic");
        dt2.Rows.Add(files);
        
        dt.Merge(dt2,false, MissingSchemaAction.Add);
    }

    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}