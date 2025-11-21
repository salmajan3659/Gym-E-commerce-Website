using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections.Specialized;
using System.ComponentModel;

namespace admin
{

    public partial class Singlepage : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = "1";
                string sel = "select * from product where pro_id=" + Session["product_id"] + "";
                SqlDataReader dr = obj.Fn_Reader(sel);
                while (dr.Read())
                {
                    Label2.Text = dr["Name"].ToString();
                    Label3.Text = dr["brand"].ToString();
                    Label10.Text = dr["price"].ToString();
                    Label9.Text = dr["Description"].ToString();
                    Image1.ImageUrl = dr["image"].ToString();

                    Session["stockavail"] = Convert.ToInt32(dr["Stock"]);

                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int quanty = int.Parse(TextBox1.Text);
            quanty++;
            TextBox1.Text = quanty.ToString();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int quanty = int.Parse(TextBox1.Text);
            if (quanty > 1)
            {
                quanty--;
                TextBox1.Text = quanty.ToString();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            int stock = Convert.ToInt32(Session["stockavail"]);
            int quantity = Convert.ToInt32(TextBox1.Text);

            if (stock > quantity)
            {
                Label6.Visible = true;
                Label6.Text = "Out of stock";
            }
            else
            {
                Label6.Visible = false;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string subtotal = (Convert.ToInt32(Label10.Text) * Convert.ToInt32(TextBox1.Text)).ToString();

            string ins = "insert into cart_table values(" + Session["uid"] + "," + Session["product_id"] + ","+Label10.Text+ "," + TextBox1.Text + ",'" + Label2.Text + "'," + (Convert.ToInt32(Label10.Text) * Convert.ToInt32(TextBox1.Text)) +")";


            int i = obj.Fn_Nonquery(ins);
            if (i == 1)
            {
                Label6.Visible = true;
                Label6.Text = "Added";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "showPopup();", true);

            }
            else
            {
                Label6.Visible = false;
            }
        }
    }
    }
   