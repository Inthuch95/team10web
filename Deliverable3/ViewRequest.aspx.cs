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
    public class REQUESTS
    {
        public int request_id;
        public string module;
        public string room_code;
        public int capacity;
        public int wheelchair;
        public int projector;
        public int whiteboard;
        public int visualiser;
        public int computer;
        public int lecture_capture;
        public int pa_system;
        public int dvd_video;
        public int radio_microphone;
        public int tiered;
        public int flat;
        public int priority;
        public int period;
        public int duration;
        public string special_req;
        public string day;
        public string status;
        public string park;
        public int semester;
        public int year;
        public string lecturer;
        public string dept_code;
        public string session;
    }
    public partial class ViewRequest : System.Web.UI.Page
    {
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
        //retrieve request data from database
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<REQUESTS> getRequest() 
        {
            List<REQUESTS> requestData = new List<REQUESTS> { };
             string query = "SELECT * FROM REQUESTS";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                REQUESTS request = new REQUESTS();
                request.request_id = Convert.ToInt32(item["request_id"]);
                request.module = item["module"].ToString();
                requestData.Add(request);
            }
            return requestData;
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