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
    public partial class PROFILE : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grid_view();
          
            }
        }
        public void grid_view()
        {
            string f = "select User_id ,User_Fullname, User_Phone, Address,Status from USERS";
            DataSet ds = obj.Fn_Adapter(f);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            grid_view();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            RadioButtonList rad = (RadioButtonList)GridView1.Rows[i].FindControl("RadioButtonList1");
            string s = rad.SelectedItem.Text;

            string f = "update USERS set Status='" + s + "' where User_id=" + getid + "";
            int c = obj.Fn_Nonquery(f);
            GridView1.EditIndex = -1;
            grid_view();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();
        }
    }
}





  











       

