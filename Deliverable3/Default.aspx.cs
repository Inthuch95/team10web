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
                if (password == TextBoxPassword.Text)
                {
                    Session["Username"] = DropDownListDept.Text;
                    Response.Redirect("CreateRequest.aspx");
                    
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
