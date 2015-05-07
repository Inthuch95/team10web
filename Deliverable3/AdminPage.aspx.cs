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
    public class Request
    {
        public string request_id { get; set; }
        public string module { get; set; }
        public string room_code { get; set; }
        public string capacity { get; set; }
        public string wheelchair { get; set; }
        public string projector { get; set; }
        public string whiteboard { get; set; }
        public string visualiser { get; set; }
        public string computer { get; set; }
        public string lecture_capture { get; set; }
        public string pa_system { get; set; }
        public string video_dvd { get; set; }
        public string radio_microphone { get; set; }
        public string arrangement { get; set; }
        public string priority { get; set; }
        public string period { get; set; }
        public string duration { get; set; }
        public string special_req { get; set; }
        public string day { get; set; }
        public string status { get; set; }
        public string park { get; set; }
        public string semester { get; set; }
        public string year { get; set; }
        public string lecturer { get; set; }
        public string dept_code { get; set; }
        public string session { get; set; }
    }
    public class ROOM
    {
        public string room_code { get; set; }
        public string building_code { get; set; }
        public string capacity { get; set; }
        public string wheelchair { get; set; }
        public string projector { get; set; }
        public string visualiser { get; set; }
        public string whiteboard { get; set; }
        public string computer { get; set; }
        public string lecture_capture { get; set; }
        public string video_dvd { get; set; }
        public string pa_system { get; set; }
        public string radio_microphone { get; set; }
        public string tiered { get; set; }
        public string flat { get; set; }
        public string dept { get; set; }
    }
    public class ROUND
    {
        public int round { get; set; }
        public string from { get; set; }
        public string to { get; set; }
        public string from1 { get; set; }
        public string to1 { get; set; }
        public string from2 { get; set; }
        public string to2 { get; set; }
        public string from3 { get; set; }
        public string to3 { get; set; }
    }
    
    public partial class AdminPage : System.Web.UI.Page
    {
        //edit a pool room
        [WebMethod]
        [ScriptMethod]
        public static void updateRoom(ROOM room)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE [ROOMS] SET [capacity] = @capacity, [wheelchair] = @wheelchair, [projector] = @projector, [visualiser] = @visualiser, [whiteboard] = @whiteboard, [computer] = @computer, [video_dvd] = @video_dvd, [pa_system] = @pa_system, [radio_microphone] = @radio_microphone, [lecture_capture] = @lecture_capture WHERE [room_code] = @room_code"))
                {
                    cmd.CommandType = CommandType.Text;
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
                    cmd.Parameters.AddWithValue("@dept", room.dept);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        //delete a pool room
        [WebMethod]
        [ScriptMethod]
        public static void deleteRoom(ROOM room)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                //request_id received from ajax function allocateAjax(el)
                using (SqlCommand cmd = new SqlCommand("DELETE FROM [ROOMS] WHERE [room_code] = @room_code"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@room_code", room.room_code);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        //get round date from database
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<ROUND> getRound()
        {
            List<ROUND> round = new List<ROUND> { };
            string query = "SELECT * FROM [ROUND]";
            SqlCommand cmd = new SqlCommand(query);
            DataSet ds = GetData(cmd);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in ds.Tables[0].Rows)
            {
                ROUND rounds = new ROUND();
                rounds.round = Convert.ToInt32(item["round"]);
                rounds.from = item["from"].ToString();
                rounds.to = item["to"].ToString();
                round.Add(rounds);
            }
            return round;
        }
        //update round date
        [WebMethod]
        [ScriptMethod]
        public static void updateRound(ROUND round)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("UPDATE [ROUND] SET [from] = @from1, [to] = @to1 WHERE [round] = 1"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@from1", round.from1);
                    cmd.Parameters.AddWithValue("@to1", round.to1);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("UPDATE [ROUND] SET [from] = @from2, [to] = @to2 WHERE [round] = 2"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@from2", round.from2);
                    cmd.Parameters.AddWithValue("@to2", round.to2);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                using (SqlCommand cmd = new SqlCommand("UPDATE [ROUND] SET [from] = @from3, [to] = @to3 WHERE [round] = 3"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@from3", round.from3);
                    cmd.Parameters.AddWithValue("@to3", round.to3);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        //change the status of a request to 'booked'
        [WebMethod]
        [ScriptMethod]
        public static void allocateRequest(Request request)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                //request_id received from ajax function allocateAjax(el)
                using (SqlCommand cmd = new SqlCommand("UPDATE [REQUESTS] SET [status] = 'Booked' WHERE [request_id] = @request_id"))
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
        //change the status of a request to 'rejected'
        [WebMethod]
        [ScriptMethod]
        public static void rejectRequest(Request request)
        {
            string constr = WebConfigurationManager.ConnectionStrings["myConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                //request_id received from ajax function rejectAjax(el)
                using (SqlCommand cmd = new SqlCommand("UPDATE [REQUESTS] SET [status] = 'Rejected' WHERE [request_id] = @request_id"))
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

    }
}