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
using System.Collections.Specialized;

namespace Team11
{
    public partial class AddEditModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }



        public static string getSession()
        {
         
            string Session = HttpContext.Current.Session["dept_code"].ToString();

            return Session;
        }
        [WebMethod]
        [ScriptMethod]
        public static void deletemodule(Module module)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [MODULES] WHERE [module_code] = @mod_code"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@mod_code", module.mod_code);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }


        [WebMethod]
        [ScriptMethod]
        public static void insertModule(Module module)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [MODULES] ([dept_code], [module_code], [module_title], [Lecturer]) VALUES(@dept, @module_code,@module_title, @lecturer)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@dept", HttpContext.Current.Session["dept_code"].ToString());
                    cmd.Parameters.AddWithValue("@module_code", module.mod_code);
                    cmd.Parameters.AddWithValue("@module_title", module.mod_title);
                    cmd.Parameters.AddWithValue("@lecturer", module.lecturer);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

        }
    }
}