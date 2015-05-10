using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Team11
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            /* Connect to database*/
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
            conn.Open();
            /* SQL Statement */
            string checkuser = "select count(*) from [DEPT] where dept_name='" + DropDownListDept.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            Console.Write(temp);
            conn.Close();
            if (temp == 1)
            {
                
                conn.Open();
                string checkpassword = "Select password from [DEPT] where dept_name='" + DropDownListDept.Text + "'";
                SqlCommand passcom = new SqlCommand(checkpassword, conn);
                /* Gets rid of the space if there is one e.g. by habit putting a space at the end*/
                string password = passcom.ExecuteScalar().ToString().Replace(" ", "");
                conn.Close();

                if (password == TextBoxPassword.Text && DropDownListDept.Text != "Central Admin")
                {
                    conn.Open();
                    string Check_dept_code = "Select dept_code from [DEPT] where dept_name='" + DropDownListDept.Text + "'";
                    SqlCommand getCode = new SqlCommand(Check_dept_code, conn);
                    /* Gets rid of the space if there is one e.g. by habit putting a space at the end*/
                    string dept_code = getCode.ExecuteScalar().ToString().Replace(" ", "");
                    conn.Close();
                    Session["dept_name"] = DropDownListDept.Text;
                    Session["dept_code"] = dept_code;
                    
                    /*Code to check round dates*/
                    conn.Open();
                    string round1_start_date = "SELECT [from] FROM [ROUND] WHERE round='1'";
                    string round2_start_date = "SELECT [from] FROM [ROUND] WHERE round='2'";
                    string round3_start_date = "SELECT [from] FROM [ROUND] WHERE round='3'";
                    string round3_finish_date = "SELECT [to] FROM [ROUND] WHERE round='3'";
                    SqlCommand rnd1str = new SqlCommand(round1_start_date, conn);
                    SqlCommand rnd2str = new SqlCommand(round2_start_date, conn);
                    SqlCommand rnd3str = new SqlCommand(round3_start_date, conn);
                    SqlCommand rnd3fin = new SqlCommand(round3_finish_date, conn);
                    /* Gets rid of the space if there is one e.g. by habit putting a space at the end*/
                    string rnd1_start = rnd1str.ExecuteScalar().ToString().Replace(" ", "");
                    string rnd2_start = rnd2str.ExecuteScalar().ToString().Replace(" ", "");
                    string rnd3_start = rnd3str.ExecuteScalar().ToString().Replace(" ", "");
                    string rnd3_finish = rnd3fin.ExecuteScalar().ToString().Replace(" ", "");
                    conn.Close();

                    /*01/01/2015*/

                    DateTime round1_str = Convert.ToDateTime(rnd1_start);
                    DateTime round2_str = Convert.ToDateTime(rnd2_start);
                    DateTime round3_str = Convert.ToDateTime(rnd3_start);
                    DateTime round3_fin = Convert.ToDateTime(rnd3_finish);

                    DateTime dateToCheck = DateTime.Now;
                    if (dateToCheck >= round1_str && dateToCheck < round2_str)
                    {
                        Response.Redirect("CreateRequest.aspx");
                    }
                    else if (dateToCheck >= round2_str && dateToCheck < round3_str)
                    {
                        Response.Redirect("CreateRequest2.aspx");
                    }

                    else if (dateToCheck >= round3_str && dateToCheck <= round3_fin)
                    {
                        Response.Redirect("CreateRequest3.aspx");
                    }
                    else
                    {
                        Response.Redirect("Availibility.aspx");
                    }
                }
                else if (password == TextBoxPassword.Text && DropDownListDept.Text == "Central Admin")
                {
                    Response.Redirect("AdminPage.aspx");
                }
                else
                {
                    incorrect.Text=("Password is incorrect");
                }
            }
            else
            {
                incorrect.Text = ("Username is incorrect " + temp.ToString());
                
            }
            
        }
        public class user
        {
            public string deptCode;
            public string deptName;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        
        public static List<user> GetUser()
        {
            List<user> users = new List<user> { };
            string query = "SELECT  [dept_code] ,[dept_name] FROM [DEPT]";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                user pro = new user();
                pro.deptCode = item["dept_code"].ToString();
                pro.deptName = item["dept_name"].ToString();
                users.Add(pro);
            }

            return users;
        }
        private static DataSet GetData(SqlCommand cmd)
        {
            string connString = WebConfigurationManager.ConnectionStrings["parkConnectionString"].ToString();
            string str = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(str))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        return ds;
                    }
                }
            }
        }
    }
}
