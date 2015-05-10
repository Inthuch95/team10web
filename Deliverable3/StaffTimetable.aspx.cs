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

namespace Team11{

    public class StaffLecturer
    {
        public string name { get; set; }
    }
    public partial class StaffTimetable : System.Web.UI.Page
    {
       public static string mod_title, mod_code;
        protected void Page_Init(object sender, EventArgs e)
        {
            //go back to log in page if the users haven't logged in
            if (Session["dept_name"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<StaffLecturer> getLecturer()
        {
            //can only return list as json
            List<StaffLecturer> lecturers = new List<StaffLecturer> { };

            string query = "SELECT Lecturer FROM [MODULES] WHERE [dept_code] = '" + HttpContext.Current.Session["dept_code"].ToString() + "' ORDER BY Lecturer ASC";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                StaffLecturer Lecture = new StaffLecturer();
                Lecture.name = item["Lecturer"].ToString();
                lecturers.Add(Lecture);
            }

            return lecturers;
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