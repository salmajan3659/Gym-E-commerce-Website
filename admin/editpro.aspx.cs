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
    public partial class WebForm8 : System.Web.UI.Page
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
            string s = "select * from product";
            DataSet ds = obj.Fn_Adapter(s);
            GridView1.DataSource = ds;
            GridView1.DataBind();


            }

        

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string s = "delete from product where pro_id = '" + getid + "'";
            int r = obj.Fn_Nonquery(s);
            get_grid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            get_grid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            get_grid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);

            // Retrieve updated text values
            TextBox txtCatId = (TextBox)GridView1.Rows[i].Cells[1].Controls[0];
            TextBox txtName = (TextBox)GridView1.Rows[i].Cells[2].Controls[0];
            TextBox txtDesc = (TextBox)GridView1.Rows[i].Cells[3].Controls[0];
            TextBox txtBrand = (TextBox)GridView1.Rows[i].Cells[4].Controls[0];
            TextBox txtPrice = (TextBox)GridView1.Rows[i].Cells[5].Controls[0];
            TextBox txtStock = (TextBox)GridView1.Rows[i].Cells[7].Controls[0];
            TextBox txtStatus = (TextBox)GridView1.Rows[i].Cells[8].Controls[0];

            string cat_id = txtCatId.Text.Trim();
            string name = txtName.Text.Trim();
            string desc = txtDesc.Text.Trim();
            string brand = txtBrand.Text.Trim();
            string price = txtPrice.Text.Trim();
            string stock = txtStock.Text.Trim();
            string status = txtStatus.Text.Trim();

            // Handle image update
            FileUpload fileUpload = (FileUpload)GridView1.Rows[i].FindControl("FileUpload1");
            HiddenField hiddenOld = (HiddenField)GridView1.Rows[i].FindControl("HiddenField1");

            string imagePath = hiddenOld.Value; // Default old image path

            if (fileUpload.HasFile)
            {
                string folderPath = Server.MapPath("~/pho/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Path.GetFileName(fileUpload.FileName).Replace(" ", "_");
                imagePath = "~/pho/" + fileName;
                fileUpload.SaveAs(Server.MapPath(imagePath));
            }

            // Update query
            string up = "UPDATE product SET cat_id='" + cat_id + "', Name='" + name + "', Description='" + desc + "', brand='" + brand + "', price='" + price + "', image='" + imagePath + "', Stock='" + stock + "', Status='" + status + "' WHERE pro_id=" + getid;
            obj.Fn_Nonquery(up);

            GridView1.EditIndex = -1;
            get_grid();
        
    }

     
    }
}