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
        public string week;
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
                using (SqlCommand cmd = new SqlCommand("UPDATE [REQUESTS] SET [module] = @module, [room_code] = @room_code, [capacity] = @capacity, [wheelchair] = @wheelchair, [projector] = @projector, [visualiser] = @visualiser, [whiteboard] = @whiteboard, [computer] = @computer, [lecture_capture] = @lecture_capture, [pa_system] = @pa_system, [video_dvd] = @video_dvd, [radio_microphone] = @radio_microphone, [arrangement] = @arrangement, [priority] = @priority, [period] = @period, [duration] = @duration, [special_req] = @special_req, [day] = @day, [status] = @status, [park] = @park, [semester] = @semester, [lecturer] = @lecturer, [session] = @session WHERE [request_id] = @request_id"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@request_id", Convert.ToInt32(request.request_id));
                    cmd.Parameters.AddWithValue("@module", request.module);
                    cmd.Parameters.AddWithValue("@room_code", request.room_code);
                    cmd.Parameters.AddWithValue("@capacity", Convert.ToInt32(request.capacity));
                    cmd.Parameters.AddWithValue("@wheelchair", Convert.ToInt32(request.wheelchair));
                    cmd.Parameters.AddWithValue("@projector", Convert.ToInt32(request.projector));
                    cmd.Parameters.AddWithValue("@whiteboard", Convert.ToInt32(request.whiteboard));
                    cmd.Parameters.AddWithValue("@visualiser", Convert.ToInt32(request.visualiser));
                    cmd.Parameters.AddWithValue("@computer", Convert.ToInt32(request.computer));
                    cmd.Parameters.AddWithValue("@lecture_capture", Convert.ToInt32(request.lecture_capture));
                    cmd.Parameters.AddWithValue("@pa_system", Convert.ToInt32(request.pa_system));
                    cmd.Parameters.AddWithValue("@video_dvd", Convert.ToInt32(request.video_dvd));
                    cmd.Parameters.AddWithValue("@radio_microphone", Convert.ToInt32(request.radio_microphone));
                    cmd.Parameters.AddWithValue("@arrangement", request.arrangement);
                    cmd.Parameters.AddWithValue("@priority", Convert.ToInt32(request.priority));
                    cmd.Parameters.AddWithValue("@period", Convert.ToInt32(request.period));
                    cmd.Parameters.AddWithValue("@duration", Convert.ToInt32(request.duration));
                    cmd.Parameters.AddWithValue("@special_req", request.special_req);
                    cmd.Parameters.AddWithValue("@day", request.day);
                    cmd.Parameters.AddWithValue("@status", request.status);
                    cmd.Parameters.AddWithValue("@park", request.park);
                    cmd.Parameters.AddWithValue("@semester", Convert.ToInt32(request.semester));
                    cmd.Parameters.AddWithValue("@lecturer", request.lecturer);
                    cmd.Parameters.AddWithValue("@session", request.session);
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
            string query = "SELECT DISTINCT [week] = replace((SELECT DISTINCT week AS [data()] FROM [WEEKS] FOR xml path('')), ' ', ', '), [REQUESTS].[request_id], [REQUESTS].[module], [REQUESTS].[room_code], [REQUESTS].[capacity], [REQUESTS].[wheelchair], [REQUESTS].[projector], [REQUESTS].[visualiser], [REQUESTS].[whiteboard], [REQUESTS].[computer], [REQUESTS].[lecture_capture], [REQUESTS].[pa_system], [REQUESTS].[radio_microphone], [REQUESTS].[video_dvd], [REQUESTS].[arrangement], [REQUESTS].[special_req], [REQUESTS].[priority], [REQUESTS].[day], [REQUESTS].[period], [REQUESTS].[duration], [REQUESTS].[status], [REQUESTS].[park], [REQUESTS].[semester], [REQUESTS].[year], [REQUESTS].[lecturer], [REQUESTS].[dept_code], [REQUESTS].[session] FROM [REQUESTS], [WEEKS] WHERE [REQUESTS].[dept_code] = '" + HttpContext.Current.Session["dept_code"].ToString() + "' AND [REQUESTS].[request_id] = [WEEKS].[request_id]";
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
                request.week = item["week"].ToString();
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