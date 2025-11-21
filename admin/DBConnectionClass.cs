using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;


namespace admin
{
    public class DBConnectionClass
    {
        SqlConnection con;
        SqlCommand cmd;
        public DBConnectionClass()
        {
            con = new SqlConnection(@"server= DESKTOP-01VBGJ1\SQLEXPRESS;database = pro;Integrated Security = True ");
        }
        public int Fn_Nonquery(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
                int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        public string Fn_Scalar(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();

            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            string s = cmd.ExecuteScalar().ToString();
            con.Close();
            return s;
        }
        public SqlDataReader Fn_Reader(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();

            }
            cmd = new SqlCommand(sqlquery, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;

        }
        public DataSet Fn_Adapter(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();

            }
            SqlDataAdapter da = new SqlDataAdapter(sqlquery, con);
            DataSet ds = new DataSet();
          da.Fill(ds);
            return ds;

        }
        public DataTable Fn_Data_Adapter(string sqlquery)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();

            }
            SqlDataAdapter dt = new SqlDataAdapter(sqlquery, con);
            DataTable dr = new DataTable();
            dt.Fill(dr);
            return dr;

        }
    }
}