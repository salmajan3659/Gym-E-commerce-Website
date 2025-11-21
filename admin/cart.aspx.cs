using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                get_grid();
            }
        }

        public void get_grid()
        {
            int userId = Convert.ToInt32(Session["uid"]);
            string s = "select * from cart_table where uid = " + userId;
            DataSet ds = obj.Fn_Adapter(s);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("mainpage.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            string s = "delete from cart_table where cartid = " + getid;
            obj.Fn_Nonquery(s);
            get_grid();
        }

        protected void btnCheckout_Click1(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("login.aspx");
                return;
            }

            int userId = Convert.ToInt32(Session["uid"]);

            string insertQuery = "INSERT INTO orders (user_id, product_id, quantity, order_status, order_date, price, subtotal) " +
                                 "SELECT uid, productid, quantity, 'order', GETDATE(), price, subtotal " +
                                 "FROM cart_table WHERE uid = " + userId;

            int r = obj.Fn_Nonquery(insertQuery);

            if (r > 0)
            {
                // Delete cart items after successful order insertion 🚀
                string delCart = "DELETE FROM cart_table WHERE uid = " + userId;
                obj.Fn_Nonquery(delCart);

                Response.Redirect("billview.aspx");
            }
            else
            {
                Response.Write("<script>alert('No items found in cart.');</script>");
            }
        }
    }
}
