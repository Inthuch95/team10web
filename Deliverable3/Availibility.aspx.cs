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
    public partial class Availibility : System.Web.UI.Page
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
        [WebMethod]
        [ScriptMethod]
        public static void insertRequest(REQUEST_FORM request)
        {
            int id;
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [REQUESTS] ([module], [room_code], [capacity], [wheelchair], [projector], [visualiser], [whiteboard], [computer], [lecture_capture], [pa_system], [radio_microphone], [video_dvd], [arrangement], [special_req], [priority], [day], [period], [duration], [status], [park], [semester], [year], [lecturer], [dept_code], [session]) OUTPUT INSERTED.[request_id] VALUES (@module, @room_code, @capacity, @wheelchair, @projector, @visualiser, @whiteboard, @computer, @lecture_capture, @pa_system, @radio_microphone, @video_dvd, @arrangement, @special_req, @priority, @day, @period, @duration, @status, @park, @semester, @year, @lecturer, @dept, @session)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@module", request.module);
                    cmd.Parameters.AddWithValue("@room_code", request.room_code1);
                    cmd.Parameters.AddWithValue("@capacity", Convert.ToInt32(request.capacity1));
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
                    cmd.Parameters.AddWithValue("@special_req", request.special_req1);
                    cmd.Parameters.AddWithValue("@day", request.day);
                    cmd.Parameters.AddWithValue("@status", request.status);
                    cmd.Parameters.AddWithValue("@park", request.park);
                    cmd.Parameters.AddWithValue("@semester", Convert.ToInt32(request.semester));
                    cmd.Parameters.AddWithValue("@lecturer", request.lecturer);
                    cmd.Parameters.AddWithValue("@session", request.session);
                    cmd.Parameters.AddWithValue("@year", request.year);
                    cmd.Parameters.AddWithValue("@dept", HttpContext.Current.Session["dept_code"].ToString());
                    cmd.Connection = con;
                    con.Open();
                    id = (int)cmd.ExecuteScalar();
                    con.Close();
                }
            }
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [WEEKS] ([week], [request_id]) VALUES (@week, @request_id)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@request_id", id);
                    cmd.Parameters.AddWithValue("@week", Convert.ToInt32(request.week1));
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteScalar();
                    con.Close();
                }
            } 
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<REQUESTS> getBooking()
        {
            List<REQUESTS> requestData = new List<REQUESTS> { };
            string query = "SELECT  [WEEKS].[week],[REQUESTS].[request_id], [REQUESTS].[module], [REQUESTS].[room_code], [REQUESTS].[capacity], [REQUESTS].[wheelchair], [REQUESTS].[projector], [REQUESTS].[visualiser], [REQUESTS].[whiteboard], [REQUESTS].[computer], [REQUESTS].[lecture_capture], [REQUESTS].[pa_system], [REQUESTS].[radio_microphone], [REQUESTS].[video_dvd], [REQUESTS].[arrangement], [REQUESTS].[special_req], [REQUESTS].[priority], [REQUESTS].[day], [REQUESTS].[period], [REQUESTS].[duration], [REQUESTS].[status], [REQUESTS].[park], [REQUESTS].[semester], [REQUESTS].[year], [REQUESTS].[lecturer], [REQUESTS].[dept_code], [REQUESTS].[session] FROM [REQUESTS], [WEEKS]  WHERE [REQUESTS].[dept_code] ='" + HttpContext.Current.Session["dept_code"].ToString() + "' AND [REQUESTS].[status] = 'Booked' AND [REQUESTS].[request_id] = [WEEKS].[request_id] AND [REQUESTS].[year] = 2015 ";
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