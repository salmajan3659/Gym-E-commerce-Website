using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class WebForm09 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sel = "SELECT * FROM cat_table WHERE status ='Available'";
                DataTable dt = obj.Fn_Data_Adapter(sel);
                Datalist1.DataSource = dt;
                Datalist1.DataBind();
            }
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int get_id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Productpage.aspx?cat_id=" + get_id);
        }
    }
}
