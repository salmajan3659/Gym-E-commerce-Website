using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace admin
{
    public partial class feedback : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFeedback.Text))
            {
                lblMsg.Text = "⚠ Please enter your feedback!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                string userId = Session["uid"].ToString();
                string feedback = txtFeedback.Text.Replace("'", "''");

                string query = "INSERT INTO review (user_id, review, feedback_status) " +
                               "VALUES (" + userId + ", '" + feedback + "', 1)";

                obj.Fn_Nonquery(query);

                lblMsg.Text = "🎉 Feedback submitted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                txtFeedback.Text = "";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

    }
}








