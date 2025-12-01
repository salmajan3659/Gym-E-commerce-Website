using System;
using System.Web.UI;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace admin
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        DBConnectionClass obj = new DBConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get admin email
                string s = "SELECT admin_email FROM Admin WHERE Admin_Id = " + Session["uid"];
                SqlDataReader dr = obj.Fn_Reader(s);
                if (dr.Read())
                {
                    txtFrom.Text = dr["admin_email"].ToString(); 
                }

                // Get user email for this review/feedback
                string z = @"SELECT u.user_email FROM USERS u INNER JOIN review r ON u.User_id = r.User_id WHERE r.review_id = " + Session["feedid"];
                SqlDataReader dr1 = obj.Fn_Reader(z);
                if (dr1.Read())
                {
                    txtTo.Text = dr1["user_email"].ToString();     // use TextBox
                }
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            // Admin name
            string s = "SELECT Admin_Fullname FROM Admin WHERE Admin_Id = " + Session["AdminId"];
            string cv = obj.Fn_Scalar(s);

            // User name
            string z = @"SELECT u.User_Fullname 
                         FROM USERS u 
                         INNER JOIN review r ON u.User_id = r.User_id 
                         WHERE r.review_id = " + Session["feedid"];
            string gh = obj.Fn_Scalar(z);

            try
            {
                // your Gmail app password in the 3rd parameter
                SendEmail2(cv, txtFrom.Text, "khmp ound rywn aept", gh, txtTo.Text,
                           txtSubject.Text, txtBody.Text);

                string updateQuery = "UPDATE review SET feedback_status = 0 WHERE review_id = " + Session["feedid"];
                obj.Fn_Nonquery(updateQuery);

                Label1.Text = "Email sent successfully. Reply status updated.";
            }
            catch (SmtpException ex)
            {
                Label1.Text = "Failed to send email: " + ex.Message;
            }
            catch (Exception ex)
            {
                Label1.Text = "Unexpected error: " + ex.Message;
            }
        }

        public static void SendEmail2(string yourname, string yourGmailUserName, string yourGmailPassword,
                                      string tonaame, string toEmail, string subject, string body)
        {
            string to = toEmail;
            string from = yourGmailUserName;
            MailMessage message = new MailMessage(from, to);

            message.Subject = subject;
            message.Body = body;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;

            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential(yourGmailUserName, yourGmailPassword);

            client.Send(message);
        }
    }
}
