using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;

namespace admin
{
    public partial class billview : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        { 
                if (!IsPostBack)
            {
                    
                    string f = "SELECT U.User_Fullname, U.User_Phone, U.Address, O.order_date " +
                               "FROM dbo.USERS U " +
                               "INNER JOIN dbo.orders O ON U.User_id = O.user_id " +
                               "WHERE O.user_id = " + Session["uid"];

                    SqlDataReader dr = obj.Fn_Reader(f);
                    if (dr.Read())
                    {
                        Label2.Text = dr["User_Fullname"].ToString();
                        Label4.Text = dr["Address"].ToString();
                        Label5.Text = dr["User_Phone"].ToString();
                        Label1.Text = dr["order_date"].ToString();
                    }

                    // ✅ Fetch only this user’s orders
                    string j = "SELECT o.quantity, o.subtotal, p.Name , p.price, p.brand " +
                               "FROM dbo.orders o " +
                               "INNER JOIN dbo.product p ON o.product_id = p.pro_id " +
                               "WHERE o.user_id = " + Session["uid"] + " AND o.order_status = 'order'";
                     grandtotal();
                    DataSet ds = obj.Fn_Adapter(j);
                    gridview2.DataSource = ds;
                    gridview2.DataBind();

            
          
                }

            }
            public void grandtotal()
            {
                string sum = "select sum(subtotal) from orders where user_id=" + Session["uid"] + "and order_status='order'";
                string total = obj.Fn_Scalar(sum);
                Label6.Text = total;
            }

            protected void btnPrint_Click(object sender, EventArgs e)
            {
                Response.Redirect("account.aspx");
            }
        }
    }

