using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace admin
{
    public partial class viewfeedback : System.Web.UI.Page
    {

        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            string f = "SELECT dbo.USERS.user_id,dbo.USERS.User_Fullname, dbo.review.review_id, dbo.review.review FROM dbo.USERS INNER JOIN dbo.review ON dbo.USERS.user_id = dbo.review.user_id where dbo.review.feedback_status=1";
            DataSet ds = obj.Fn_Adapter(f);
            gridview1.DataSource = ds;
            gridview1.DataBind();
        }


        protected void LinkButton1_Command1(object sender, CommandEventArgs e)
        {
            int getid = Convert.ToInt32(e.CommandArgument);
            Session["feedid"] = getid;
            Response.Redirect("WebForm11.aspx");
        }

        
    }
}