using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class WebForm7 : System.Web.UI.Page
    {

        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardCounts();
            }
        }

        private void LoadDashboardCounts()
        {
            lblProducts.Text = obj.Fn_Scalar("SELECT COUNT(*) FROM product").ToString();
            lblCategories.Text = obj.Fn_Scalar("SELECT COUNT(*) FROM cat_table").ToString();
            lblOrders.Text = obj.Fn_Scalar("SELECT COUNT(*) FROM orders").ToString();
        }


        protected void btnProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("PROFILE.aspx");
        }

        protected void btnLogout_Click1(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("loginpage.aspx");
        }
    }
}