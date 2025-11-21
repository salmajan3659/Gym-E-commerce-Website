using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace admin
{
    public partial class account : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            grandtotal();
        }

        public void grandtotal()
        {
            string total = "select sum(subtotal) from orders where user_id=" + Session["uid"] + " and order_status='order'";
            string totalsum = obj.Fn_Scalar(total);
            txtPayAmount.Text = totalsum;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string kl = "insert into accounts (user_id, acc_type, acc_number, balance) values(" + Session["uid"] + ",'" + ddlAccType.SelectedItem.Text + "','" + txtAccNumber.Text + "','" + txtBalance.Text + "')";
            int i = obj.Fn_Nonquery(kl);
            if (i == 1)
            {
                pnlPayment.Visible = true;
                pnlAccount.Visible = false;
            }
            else
            {
                pnlAccount.Visible = true;
                pnlPayment.Visible = false;
            }
        }

        protected void txtAccNumber_TextChanged1(object sender, EventArgs e)
        {
            string p = "select count(acc_number) from accounts where user_id=" + Session["uid"] + " and acc_number='" + txtAccNumber.Text + "'";
            string f = obj.Fn_Scalar(p);
            int r = Convert.ToInt32(f);
            if (r == 1)
            {
                pnlPayment.Visible = true;
                pnlAccount.Visible = false;
            }
            else
            {
                pnlAccount.Visible = true;
                pnlPayment.Visible = false;
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            bal.ServiceClient obj3 = new bal.ServiceClient();
            string o = obj3.balancheck(txtAccNumber.Text);
            int r = Convert.ToInt32(txtPayAmount.Text);
            int n = Convert.ToInt32(o);
            if (n < r)
            {
                lblPayStatus.Text = "insufficent balance";
            }
            else
            {
                string f = "select product_id from orders where user_id=" + Session["uid"] + "and order_status='order'";
                SqlDataReader dr = obj.Fn_Reader(f);
                List<string> pdlist = new List<string>();
                while (dr.Read())
                {
                    pdlist.Add((dr["product_id"].ToString()));
                }
                foreach (string productid in pdlist)
                {
                    string d = "select * from orders where product_id=" + productid + "and user_id=" + Session["uid"] + "";
                    SqlDataReader dv = obj.Fn_Reader(d);
                    string qty = "";
                    while (dv.Read())
                    {

                        qty = (dv["quantity"].ToString());
                    }
                    string vb = "update orders set order_status='payed' where user_id=" + Session["uid"] + "and product_id=" + productid + "";
                    int i = obj.Fn_Nonquery(vb);


                    string b = "select Stock from product where pro_id=" + productid + "";
                    string ni = obj.Fn_Scalar(b);
                    int oldStock = Convert.ToInt32(ni);

                    int orderedQty = Convert.ToInt32(qty);

                    int updatedStock = oldStock - orderedQty;

                    string up = "update product set Stock=" + updatedStock + " where pro_id=" + productid;
                    int aw = obj.Fn_Nonquery(up);

                }
                string df = "select balance from accounts where user_id=" + Session["uid"] + "and acc_number='" + txtAccNumber.Text + "'";
                string gh = obj.Fn_Scalar(df);
                int jk = Convert.ToInt32(gh);
                int kl = Convert.ToInt32(txtPayAmount.Text);
                int ds = jk - kl;



                int uid = Convert.ToInt32(Session["uid"]);
                int j = obj3.amountreduce(txtAccNumber.Text, uid, ds);
                lblPayStatus.Text = "payed";
                Response.Redirect("feedback.aspx");

            }
        }
    }
}