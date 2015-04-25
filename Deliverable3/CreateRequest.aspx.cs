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
    }
    public class Module
    {
        public string mod_code { get; set; }
        public string mod_title { get; set; }
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
    }
    public class BUILDINGS
    { 
        public string park;
        public string building_name;
        public string building_code;
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
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {

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
            string query = "SELECT DISTINCT [BUILDINGS].park, [BUILDINGS].building_name, [ROOMS].room_code, [ROOMS].building_code, [ROOMS].capacity, [ROOMS].wheelchair, [ROOMS].projector, [ROOMS].visualiser, [ROOMS].whiteboard, [ROOMS].computer, [ROOMS].video_dvd, [ROOMS].pa_system, [ROOMS].radio_microphone, [ROOMS].lecture_capture, [ROOMS].tiered, [ROOMS].flat FROM [ROOMS],[BUILDINGS] WHERE [ROOMS].building_code = [BUILDINGS].building_code";
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