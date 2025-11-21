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
    public partial class WebForm6 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

           if (!IsPostBack)
            {
                BindProducts();
            }
        }

         private void BindProducts()
        {
            string sel = "select * from product where cat_id = " + Session["cat_id"] + " and Status = 'Available'";
             DataTable dt = obj.Fn_Data_Adapter(sel);

            DataList1.DataSource = dt;
             DataList1.DataBind();
         }
        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int get_id = Convert.ToInt32(e.CommandArgument);
            Session["product_id"] = get_id;
            Response.Redirect("Singlepage.aspx");
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
                Button btn = (Button)sender;
                int productId = Convert.ToInt32(btn.CommandArgument);
                Session["product_id"] = productId;
                Response.Redirect("Singlepage.aspx"); 
        }
    }
}