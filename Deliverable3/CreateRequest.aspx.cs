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
    public class module
    {
        public string module_code;
        public string module_title;
        public string dept;
        public string lecturer;
    }
    public class Module
    {
        public string mod_code { get; set; }
        public string mod_title { get; set; }
        public string lecturer { get; set; }
    }
    public class ROOMS 
    {
        public string park;
        public string building_name;
        public string room_code;
        public string building_code;
        public int capacity;
        public int wheelchair;
        public int projector;
        public int visualiser;
        public int whiteboard;
        public int computer;
        public int video_dvd;
        public int pa_system;
        public int radio_microphone; 
        public int lecture_capture;
        public int tiered;
        public int flat;
        public string dept;
    }
    public class BUILDINGS
    { 
        public string park;
        public string building_name;
        public string building_code;
    }
    public class REQUEST_FORM
    {
        public string request_id { get; set; }
        public string module { get; set; }
        public string room_code1 { get; set; }
        public string room_code2 { get; set; }
        public string room_code3 { get; set; }
        public string room_code4 { get; set; }
        public string room_code5 { get; set; }
        public string noRooms { get; set; }
        public string capacity1 { get; set; }
        public string capacity2 { get; set; }
        public string capacity3 { get; set; }
        public string capacity4 { get; set; }
        public string capacity5 { get; set; }
        public string wheelchair { get; set; }
        public string projector { get; set; }
        public string whiteboard { get; set; }
        public string visualiser { get; set; }
        public string computer { get; set; }
        public string lecture_capture { get; set; }
        public string pa_system { get; set; }
        public string video_dvd { get; set; }
        public string radio_microphone { get; set; }
        public string wheelchair2 { get; set; }
        public string projector2 { get; set; }
        public string whiteboard2 { get; set; }
        public string visualiser2 { get; set; }
        public string computer2 { get; set; }
        public string lecture_capture2 { get; set; }
        public string pa_system2 { get; set; }
        public string video_dvd2 { get; set; }
        public string radio_microphone2 { get; set; }
        public string wheelchair3 { get; set; }
        public string projector3 { get; set; }
        public string whiteboard3 { get; set; }
        public string visualiser3 { get; set; }
        public string computer3 { get; set; }
        public string lecture_capture3 { get; set; }
        public string pa_system3 { get; set; }
        public string video_dvd3 { get; set; }
        public string radio_microphone3 { get; set; }
        public string wheelchair4 { get; set; }
        public string projector4 { get; set; }
        public string whiteboard4 { get; set; }
        public string visualiser4 { get; set; }
        public string computer4 { get; set; }
        public string lecture_capture4 { get; set; }
        public string pa_system4 { get; set; }
        public string video_dvd4 { get; set; }
        public string radio_microphone4 { get; set; }
        public string wheelchair5 { get; set; }
        public string projector5 { get; set; }
        public string whiteboard5 { get; set; }
        public string visualiser5 { get; set; }
        public string computer5 { get; set; }
        public string lecture_capture5 { get; set; }
        public string pa_system5 { get; set; }
        public string video_dvd5 { get; set; }
        public string radio_microphone5 { get; set; }
        public string arrangement { get; set; }
        public string priority { get; set; }
        public string period { get; set; }
        public string duration { get; set; }
        public string special_req1 { get; set; }
        public string special_req2 { get; set; }
        public string special_req3 { get; set; }
        public string special_req4 { get; set; }
        public string special_req5 { get; set; }
        public string day { get; set; }
        public string status { get; set; }
        public string park { get; set; }
        public string semester { get; set; }
        public string year { get; set; }
        public string lecturer { get; set; }
        public string dept_code { get; set; }
        public string session { get; set; }
        public string week1 { get; set; }
        public string week2 { get; set; }
        public string week3 { get; set; }
        public string week4 { get; set; }
        public string week5 { get; set; }
        public string week6 { get; set; }
        public string week7 { get; set; }
        public string week8 { get; set; }
        public string week9 { get; set; }
        public string week10 { get; set; }
        public string week11 { get; set; }
        public string week12 { get; set; }
        public string week13 { get; set; }
        public string week14 { get; set; }
        public string week15 { get; set; }
        public string week16 { get; set; }
    }
    public partial class CreateRequest : System.Web.UI.Page
    {
        public static string mod_title, mod_code;
        protected void Page_Init(object sender, EventArgs e)
        {
            //go back to log in page if the users haven't logged in
            if (Session["dept_name"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
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
            if (dateToCheck >= round2_str && dateToCheck < round3_str)
            {
                Response.Redirect("CreateRequest2.aspx");
            }

            else if (dateToCheck >= round3_str && dateToCheck <= round3_fin)
            {
                Response.Redirect("CreateRequest3.aspx");
            }
            else if (dateToCheck < round1_str || dateToCheck > round3_fin)
            {
                Response.Redirect("Availibility.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //submit request
        [WebMethod]
        [ScriptMethod]
        public static void insertRequest(REQUEST_FORM request)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [REQUESTS] ([module], [room_code], [capacity], [wheelchair], [projector], [visualiser], [whiteboard], [computer], [lecture_capture], [pa_system], [radio_microphone], [video_dvd], [arrangement], [special_req], [priority], [day], [period], [duration], [status], [park], [semester], [year], [lecturer], [dept_code], [session]) VALUES (@module, @room_code, @capacity, @wheelchair, @projector, @visualiser, @whiteboard, @computer, @lecture_capture, @pa_system, @radio_microphone, @video_dvd, @arrangement, @special_req, @priority, @day, @period, @duration, @status, @park, @semester, @year, @lecturer, @dept, @session)"))
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
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            int id;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT SCOPE_IDENTITY()"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    id = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [test] ([Id]) VALUES (@id)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Connection = con;
                    con.Open();
                    id = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        //get modules from database
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]

        public static List<module> getModule()
        {
            //can only return list as json
            List<module> modules = new List<module> { };

            string query = "SELECT  * FROM [MODULES] WHERE [dept_code] = '" + HttpContext.Current.Session["dept_code"].ToString() + "'";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                module Module = new module();
                Module.module_code = item["module_code"].ToString();
                Module.module_title = item["module_title"].ToString();
                Module.lecturer = item["Lecturer"].ToString();
                modules.Add(Module);
            }

            return modules;
        }
        //get all room data along with park and building they are in
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<ROOMS> getRooms() 
        {
            List<ROOMS> roomData = new List<ROOMS> { };
            string query = "SELECT DISTINCT [BUILDINGS].park, [BUILDINGS].building_name, [ROOMS].room_code, [ROOMS].building_code, [ROOMS].capacity, [ROOMS].wheelchair, [ROOMS].projector, [ROOMS].visualiser, [ROOMS].whiteboard, [ROOMS].computer, [ROOMS].video_dvd, [ROOMS].pa_system, [ROOMS].radio_microphone, [ROOMS].lecture_capture, [ROOMS].tiered, [ROOMS].flat, [ROOMS].dept FROM [ROOMS],[BUILDINGS] WHERE [ROOMS].building_code = [BUILDINGS].building_code";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            { 
                ROOMS room = new ROOMS();
                room.park = item["park"].ToString();
                room.building_name = item["building_name"].ToString();
                room.room_code = item["room_code"].ToString();
                room.building_code = item["building_code"].ToString();
                room.capacity = Convert.ToInt32(item["capacity"]);
                room.wheelchair = Convert.ToInt32(item["wheelchair"]);
                room.projector = Convert.ToInt32(item["projector"]);
                room.visualiser = Convert.ToInt32(item["visualiser"]);
                room.whiteboard = Convert.ToInt32(item["whiteboard"]);
                room.computer = Convert.ToInt32(item["computer"]);
                room.video_dvd = Convert.ToInt32(item["video_dvd"]);
                room.pa_system = Convert.ToInt32(item["pa_system"]);
                room.radio_microphone = Convert.ToInt32(item["radio_microphone"]);
                room.lecture_capture = Convert.ToInt32(item["lecture_capture"]);
                room.tiered = Convert.ToInt32(item["tiered"]);
                room.flat = Convert.ToInt32(item["flat"]);
                room.dept = item["dept"].ToString();
                roomData.Add(room);
            }
            return roomData;
        }
        //get all building data and the park that they are in
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<BUILDINGS> getBuilding()
        {
            List<BUILDINGS> buildingData = new List<BUILDINGS> { };
            string query = "SELECT * FROM [BUILDINGS]";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                BUILDINGS building = new BUILDINGS();
                building.park = item["park"].ToString();
                building.building_code = item["building_code"].ToString();
                building.building_name = item["building_name"].ToString();
                buildingData.Add(building);
            }
            return buildingData;
        }
        //get current username from database
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<string> getDept()
        {
            List<string> dept = new List<string> { };
            dept.Add(HttpContext.Current.Session["dept_name"].ToString());
            dept.Add(HttpContext.Current.Session["dept_code"].ToString());
            return dept;
        }
        [WebMethod]
        [ScriptMethod]
        public static void insertModule(Module module)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [MODULES] ([dept_code], [module_code], [module_title]) VALUES(@dept, @module_code,@module_title)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@dept", HttpContext.Current.Session["dept_code"].ToString());
                    cmd.Parameters.AddWithValue("@module_code", module.mod_code);
                    cmd.Parameters.AddWithValue("@module_title", module.mod_title);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            
        }
        //add a pool room
        [WebMethod]
        [ScriptMethod]
        public static void insertRoom(ROOM room)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [ROOMS] ([building_code], [room_code], [capacity], [wheelchair], [projector], [visualiser], [whiteboard], [computer], [video_dvd], [pa_system], [radio_microphone], [lecture_capture], [tiered], [flat], [dept]) VALUES (@building_code, @room_code, @capacity, @wheelchair, @projector, @visualiser, @whiteboard, @computer, @video_dvd, @pa_system, @radio_microphone, @lecture_capture, @tiered, @flat, @dept)"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@building_code", room.building_code);
                    cmd.Parameters.AddWithValue("@room_code", room.room_code);
                    cmd.Parameters.AddWithValue("@capacity", Convert.ToInt32(room.capacity));
                    cmd.Parameters.AddWithValue("@wheelchair", Convert.ToInt32(room.wheelchair));
                    cmd.Parameters.AddWithValue("@projector", Convert.ToInt32(room.projector));
                    cmd.Parameters.AddWithValue("@visualiser", Convert.ToInt32(room.visualiser));
                    cmd.Parameters.AddWithValue("@whiteboard", Convert.ToInt32(room.whiteboard));
                    cmd.Parameters.AddWithValue("@computer", Convert.ToInt32(room.computer));
                    cmd.Parameters.AddWithValue("@video_dvd", Convert.ToInt32(room.video_dvd));
                    cmd.Parameters.AddWithValue("@pa_system", Convert.ToInt32(room.pa_system));
                    cmd.Parameters.AddWithValue("@radio_microphone", Convert.ToInt32(room.radio_microphone));
                    cmd.Parameters.AddWithValue("@lecture_capture", Convert.ToInt32(room.lecture_capture));
                    cmd.Parameters.AddWithValue("@tiered", Convert.ToInt32(room.tiered));
                    cmd.Parameters.AddWithValue("@flat", Convert.ToInt32(room.flat));
                    cmd.Parameters.AddWithValue("@dept", HttpContext.Current.Session["dept_code"].ToString());
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
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