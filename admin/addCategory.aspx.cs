using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string p = "~/Phs/ " + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(p));

            string s = "insert into cat_table values ('" + TextBox1.Text + "' ,'" + p + "','" + TextBox2.Text + "','Available ')";
            int i = obj.Fn_Nonquery(s);
            if (i == 1)
            {
                Label1.Text = "ADDED";
                TextBox1.Text ="";
                TextBox2.Text= "";
            }
            else
            {
                Label1.Text = "UNABLE TO ADDED";
            }


        }
    }
}
