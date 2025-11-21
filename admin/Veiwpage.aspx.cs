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
    public partial class WebForm5 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            
                
                string sel = "select * from product where cat_id = " + Session["cat_id"] + " and Status = 'Available'";

                DataTable dt = obj.Fn_Data_Adapter(sel);
                DataList12.DataSource = dt;
                DataList12.DataBind();
            
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Productview.aspx");
        }
    }
}
