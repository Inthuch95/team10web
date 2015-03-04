using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Configuration;
using System.Collections;

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
            string checkuser = "select count(*) from [User] where deptCode='" + DropDownListDept.Text + "'";
            SqlCommand com = new SqlCommand(checkuser, conn);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            Console.Write(temp);
            conn.Close();
            if (temp == 1)
            {
                
                conn.Open();
                string checkpassword = "Select password from [User] where deptCode='" + DropDownListDept.Text + "'";
                SqlCommand passcom = new SqlCommand(checkpassword, conn);
                /* Gets rid of the space if there is one e.g. by habit putting a space at the end*/
                string password = passcom.ExecuteScalar().ToString().Replace(" ", "");
                conn.Close();
                if (password == TextBoxPassword.Text)
                {
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
    }
}
