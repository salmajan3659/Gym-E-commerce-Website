using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace admin
{
    public partial class Add_Product : System.Web.UI.Page
    {

        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string sel = "select cat_id,cat_name from cat_table";
                DataSet ds = obj.Fn_Adapter(sel);
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "cat_name";
                DropDownList1.DataValueField = "cat_id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, "-select-");

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string p = "~/pho/ " + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(p));

            string s = "insert into product values ("+ DropDownList1.SelectedItem.Value +",'" + TextBox1.Text + "' ,'" + TextBox3.Text + "','" + TextBox6.Text + "','" + TextBox5.Text + "','" +  p+ "','" + TextBox4.Text + "','Available ')";
            int i = obj.Fn_Nonquery(s);
            if (i == 1)
            {
                Label1.Visible = true;
                Label1.Text = "ADDED";
            }
            else
            {
                Label1.Visible = true;
                Label1.Text = "UNABLE TO ADDED";
            }

        }
    }
}