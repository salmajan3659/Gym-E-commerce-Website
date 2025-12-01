using System;

namespace admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {

        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string ins = "select count(Reg_id) from log_table where Username ='" + TextBox1.Text + "' and Password ='" + TextBox2.Text + "'";
            string cid = obj.Fn_Scalar(ins);
            int cid1 = Convert.ToInt32(cid);
            if (cid1 == 1)
            {
                string ins1 = "select Reg_id from log_table where Username ='" + TextBox1.Text + "' and Password ='" + TextBox2.Text + "'";
                string regid1 = obj.Fn_Scalar(ins1);
                Session["uid"] = regid1;

                string ins2 = "select log_Type from log_table where Username ='" + TextBox1.Text + "' and Password ='" + TextBox2.Text + "'";
                string logtype = obj.Fn_Scalar(ins2);
                if (logtype == "admin")
                {
                    string adminQuery = "SELECT Admin_Id FROM Admin WHERE  Admin_Id= " + regid1;
                    string adminId = obj.Fn_Scalar(adminQuery);

                    Session["AdminId"] = adminId;
                    Response.Redirect("Admin.aspx");
                }
                else if (logtype == "user")
                {
                 
                    Response.Redirect("mainpage.aspx");
                    


                }
            }
            else
            {
                Label1.Text = "Invalid";


            }

        }

    }

}