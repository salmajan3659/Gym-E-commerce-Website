using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace admin
{


    public partial class WebForm9 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                get_grid();
            }
        }
        public void get_grid()
        {
            string s = "select * from cat_table";
            DataSet ds = obj.Fn_Adapter(s);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }






        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string s = "delete from cat_table where cat_id = '" + getid + "'";
            int r = obj.Fn_Nonquery(s);
            get_grid();
        }

        protected void GridView1_RowEditing1(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            get_grid();
        }

        protected void GridView1_RowCancelingEdit1(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            get_grid();
        }

        protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
          
                int i = e.RowIndex;
                int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
                TextBox txtName = (TextBox)GridView1.Rows[i].Cells[1].Controls[0];
                string name = txtName.Text.Trim();
                TextBox txtDesc = (TextBox)GridView1.Rows[i].Cells[2].Controls[0];
                TextBox txtStatus = (TextBox)GridView1.Rows[i].Cells[4].Controls[0];
                string desc = txtDesc.Text.Trim();
                string status = txtStatus.Text.Trim();

               
                FileUpload fileUpload = (FileUpload)GridView1.Rows[i].FindControl("FileUpload1");
                HiddenField hiddenOld = (HiddenField)GridView1.Rows[i].FindControl("HiddenField1");

                string imagePath = hiddenOld.Value; 

                if (fileUpload.HasFile)
                {
                    string folderPath = Server.MapPath("~/images/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    string fileName = Path.GetFileName(fileUpload.FileName).Replace(" ", "_");
                    imagePath = "~/pho/" + fileName;
                    fileUpload.SaveAs(Server.MapPath(imagePath));
                }

                string up = "UPDATE cat_table SET cat_name='"+ name + "', cat_image='" + imagePath + "', cat_desc='" + desc + "', status='" + status + "' WHERE cat_id=" + getid;
                obj.Fn_Nonquery(up);

                GridView1.EditIndex = -1;
                get_grid();
            }

        }
    }


    


















