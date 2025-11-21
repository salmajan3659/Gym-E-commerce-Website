using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string dob = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            string sel = "select max(Reg_id) from log_table";
            string maxregid = obj.Fn_Scalar(sel);
            int reg_id = 0;
            if (maxregid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newid = Convert.ToInt32(maxregid);
                reg_id = newid + 1;
            }
            string ins = "insert into Admin values(" + reg_id + ",'" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + dob + "')";
            int i = obj.Fn_Nonquery(ins);
            if (i == 1)
            {
                string ins1 = "insert into log_table values(" + reg_id + ",'" + TextBox4.Text + "','" + TextBox5.Text + "','admin','active')";
                int j = obj.Fn_Nonquery(ins1);
                if (i == 1 && j == 1)
                {
                    Label1.Text = "Inserted";
                }
            }
        }
    }
}