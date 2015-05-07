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
        public int video_dvd;
        public int radio_microphone;
        public string arrangement; 
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
        //edit request
        [WebMethod]
        [ScriptMethod]
        public static void updateRequest(Request request)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(""))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        //delete request
        [WebMethod]
        [ScriptMethod]
        public static void deleteRequest(Request request)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                //request_id received from ajax function allocateAjax(el)
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [REQUESTS] WHERE [request_id] = @request_id"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@request_id", Convert.ToInt32(request.request_id));
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
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
                //put database data into request object
                request.request_id = Convert.ToInt32(item["request_id"]);
                request.module = item["module"].ToString();
                request.room_code = item["room_code"].ToString();
                request.capacity = Convert.ToInt32(item["capacity"]);
                request.wheelchair = Convert.ToInt32(item["wheelchair"]);
                request.projector = Convert.ToInt32(item["projector"]);
                request.visualiser = Convert.ToInt32(item["visualiser"]);
                request.whiteboard = Convert.ToInt32(item["whiteboard"]);
                request.computer = Convert.ToInt32(item["computer"]);
                request.lecture_capture = Convert.ToInt32(item["lecture_capture"]);
                request.pa_system = Convert.ToInt32(item["pa_system"]);
                request.radio_microphone = Convert.ToInt32(item["radio_microphone"]);
                request.video_dvd = Convert.ToInt32(item["video_dvd"]);
                request.arrangement = item["arrangement"].ToString();
                request.special_req = item["special_req"].ToString();
                request.priority = Convert.ToInt32(item["priority"]);
                request.day = item["day"].ToString();
                request.period = Convert.ToInt32(item["period"]);
                request.duration = Convert.ToInt32(item["duration"]);
                request.park = item["park"].ToString();
                request.status = item["status"].ToString();
                request.semester = Convert.ToInt32(item["semester"]);
                request.year = Convert.ToInt32(item["year"]);
                request.lecturer = item["lecturer"].ToString();
                request.dept_code = item["dept_code"].ToString();
                request.session = item["session"].ToString();
                //add request object to list
                requestData.Add(request);
            }
            //return as array of record in javascript
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