using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["cat_id"] != null)
                {
                    string catid = Request.QueryString["cat_id"];
                    Session["cat_id"] = catid;
                    SetSelectedCategory(catid);
                }

                BindProducts();
            }
        }

        private void SetSelectedCategory(string cat_id)
        {
            chkSupp.Checked = (cat_id == "1007");
            chkEquip.Checked = (cat_id == "1008");
            chkAcc.Checked = (cat_id == "1010");
            chkCloth.Checked = (cat_id == "1013");
        }

        private void BindProducts()
        {
            string sel;

            if (Session["cat_id"] != null)
            {
                sel = "SELECT * FROM product WHERE cat_id = '" + Session["cat_id"] +
                      "' AND Status = 'Available'";
            }
            else
            {
                sel = "SELECT * FROM product WHERE Status = 'Available'";
            }

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
