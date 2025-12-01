using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class PROFILE : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAdminDetails();
                grid_view();
            }
        }

        private void LoadAdminDetails()
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("login.aspx");
            }

            string query = "SELECT Admin_Fullname, Admin_Phone, Admin_Role FROM Admin WHERE Admin_Id=" + Session["uid"];
            SqlDataReader dr = obj.Fn_Reader(query);

            if (dr.Read())
            {
                LabelAdminName.Text = dr["Admin_Fullname"].ToString();
                LabelAdminPhone.Text =  dr["Admin_Phone"].ToString();
            }
        }

        public void grid_view()
        {
            string f = "SELECT User_id, User_Fullname, User_Phone, Address, Status FROM USERS";
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
            int index = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[index].Value);

            TextBox txtName = (TextBox)GridView1.Rows[index].Cells[1].Controls[0];
            TextBox txtAddress = (TextBox)GridView1.Rows[index].Cells[2].Controls[0];
            TextBox txtPhone = (TextBox)GridView1.Rows[index].Cells[3].Controls[0];

            RadioButtonList rad = (RadioButtonList)GridView1.Rows[index].FindControl("RadioButtonList1");
            string status = rad.SelectedValue;

            string f = "UPDATE USERS SET User_Fullname='" + txtName.Text +
                       "', Address='" + txtAddress.Text +
                       "', User_Phone='" + txtPhone.Text +
                       "', Status='" + status +
                       "' WHERE User_id=" + getid;

            obj.Fn_Nonquery(f);

            GridView1.EditIndex = -1;
            grid_view();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            grid_view();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                RadioButtonList rad = (RadioButtonList)e.Row.FindControl("RadioButtonList1");
                string status = DataBinder.Eval(e.Row.DataItem, "Status").ToString();
                rad.SelectedValue = status;
            }
        }
    }
}
