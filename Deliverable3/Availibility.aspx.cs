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

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<REQUESTS> getBooking()
        {
            List<REQUESTS> requestData = new List<REQUESTS> { };
            string query = "SELECT  [WEEKS].[week],[REQUESTS].[request_id], [REQUESTS].[module], [REQUESTS].[room_code], [REQUESTS].[capacity], [REQUESTS].[wheelchair], [REQUESTS].[projector], [REQUESTS].[visualiser], [REQUESTS].[whiteboard], [REQUESTS].[computer], [REQUESTS].[lecture_capture], [REQUESTS].[pa_system], [REQUESTS].[radio_microphone], [REQUESTS].[video_dvd], [REQUESTS].[arrangement], [REQUESTS].[special_req], [REQUESTS].[priority], [REQUESTS].[day], [REQUESTS].[period], [REQUESTS].[duration], [REQUESTS].[status], [REQUESTS].[park], [REQUESTS].[semester], [REQUESTS].[year], [REQUESTS].[lecturer], [REQUESTS].[dept_code], [REQUESTS].[session] FROM [REQUESTS], [WEEKS]  WHERE [REQUESTS].[dept_code] ='" + HttpContext.Current.Session["dept_code"].ToString() + "' AND [REQUESTS].[status] = 'Booked' AND [REQUESTS].[request_id] = [WEEKS].[request_id] ";
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