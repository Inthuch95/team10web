<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportRequest.aspx.cs" Inherits="Team11.ImportRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ImportRequest.css"/>
    <script type="text/javascript">
        // JQuery that allows the tabs to change
        jQuery(document).ready(function () {
            jQuery('.tabs .tab-links a').on('click', function (e) {
                var currentAttrValue = jQuery(this).attr('href');

                // Show/Hide Tabs
                jQuery('.tabs ' + currentAttrValue).show().siblings().hide();

                // Change/remove current tab to active
                jQuery(this).parent('li').addClass('active').siblings().removeClass('active');

                e.preventDefault();
            });
            getRequestAjax();
            initFacilityDialog();
            initSpecialDialog();
            initWeekDialog();
        });
        function request_id(a, b) {
            return parseInt(a["request_id"]) - parseInt(b["request_id"]);
        }

        //sorting the module code in order a-z 1-9
        function module(a, b) {
            return a["module"] > b["module"];
        }

        function room_code(a, b) {
            return a["room_code"] > b["room_code"];

        }

        function capacity(a, b) {
            return parseInt(a["capacity"]) - parseInt(b["capacity"]);
        }
        function priority(a, b) {
            return parseInt(b["priority"]) - parseInt(a["priority"]);
        }

        function period(a, b) {
            return parseInt(a["period"]) - parseInt(b["period"]);
        }

        //will find the index of the day in the dayInt array and order interms of days of the week
        function day(a, b) {
            var dayInt = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
            return parseInt(dayInt.indexOf(a["day"])) - parseInt(dayInt.indexOf(b["day"]));
        }

        function duration(a, b) {
            return parseInt(a["duration"]) - parseInt(b["duration"]);
        }
        //sorts the data in the table according to which id has been passed (uses sort functions above)
        //Callan Swanson
        function sortHeader(id) {

            //chooses which to sort by the id passed to this function
            switch (id) {
                case "request_id_td":
                    requestData.sort(request_id);
                    break;
                case "module_td":
                    requestData.sort(module);
                    break;
                case "room_code_td":
                    requestData.sort(room_code);
                    break;
                case "capacity_td":
                    requestData.sort(capacity);
                    break;
                case "priority_td":
                    requestData.sort(priority);
                    break;
                case "period_td":
                    requestData.sort(period);
                    break;
                case "day_td":
                    requestData.sort(day);
                    break;
                case "duration_td":
                    requestData.sort(duration);
                    break;
                default:
                    break;
            }
            $("#Pending").empty();
            $("#Booked").empty();
            $("#Rejected").empty();
            for (var i = 0; i < requestData.length; i++) {
                $("#" + requestData[i].status).append("<tr id='" + requestData[i].request_id + "'>" + "<td>" + requestData[i].request_id + "</td>" + "<td>" + requestData[i].module + "</td>" + "<td>" + requestData[i].room_code
                    + "</td>" + "<td>" + requestData[i].capacity + "</td>" + "<td>" + " <button type='button' class='btns' onclick='showFacilityDialog(this)'>show</button> " + "</td>"
                    + "<td>" + "<button type='button' class='btns' onclick='showSpecialDialog(this)'>show</button>" + "</td>" + "<td>" + requestData[i].priority + "</td>"
                    + "<td>" + requestData[i].day + "</td>" + "<td>" + requestData[i].period + "</td>" + "<td>" + requestData[i].duration + "</td>"
                    + "<td>" + "<button type='button' class='btns'>show</button>" + "</td>");
                if (requestData[i].status == "Pending" || requestData[i].status == "Booked") {
                    $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='deleteRequestAjax(this)' class='btns'>Delete</button>"
                    + "</td>");
                    $("#" + requestData[i].status).append("</tr>");
                }
                else {
                    $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='resubmitRequestAjax(this)' class='btns'>Resubmit</button><br /><button type='button' onclick='showEditDialog(this)' class='btns'>Edit</button>"
                    + "</td>");
                    $("#" + requestData[i].status).append("</tr>");
                }
            }
        }
        function getRequestAjax() {
            $("#Pending").empty();
            $("#Booked").empty();
            $("#Rejected").empty();
            $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "ImportRequest.aspx/getRequest",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {

                        requestData = data.d;

                        console.log(requestData);
                        for (var i = 0; i < requestData.length; i++) {
                            $("#" + requestData[i].status).append("<tr id='" + requestData[i].request_id + "'>" + "<td>" + requestData[i].request_id + "</td>" + "<td>" + requestData[i].module + "</td>" + "<td>" + requestData[i].room_code
                                + "</td>" + "<td>" + requestData[i].capacity + "</td>" + "<td>" + " <button type='button' class='btns' onclick='showFacilityDialog(this)'>show</button> " + "</td>"
                                + "<td>" + "<button type='button' class='btns' onclick='showSpecialDialog(this)'>show</button>" + "</td>" + "<td>" + requestData[i].priority + "</td>"
                                + "<td>" + requestData[i].day + "</td>" + "<td>" + requestData[i].period + "</td>" + "<td>" + requestData[i].duration + "</td>"
                                + "<td>" + "<button type='button' onclick='showWeekDialog(this)' class='btns'>show</button>" + "</td>");
                                $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='updateRequestAjax(this)' class='btns'>Import</button>"
                                + "</td>");
                                $("#" + requestData[i].status).append("</tr>");
                        }
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
        }
        function updateRequestAjax(el) {
            var request = {};
            request.request_id = el.parentNode.parentNode.cells[0].textContent;
            request.status = "Pending";
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "ImportRequest.aspx/importRequest",
                data: "{request: " + JSON.stringify(request) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    alert("Request imported");
                    getRequestAjax();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        function showSpecialDialog(el) {
            $("#special_req").empty();
            var id = el.parentNode.parentNode.cells[0].textContent;
            var request_id = parseInt(id);
            for (var i = 0; i < requestData.length; i++) {
                if (requestData[i].request_id == request_id) {
                    $("#special_req").append(requestData[i].special_req);
                }
            }

            $("#dialog-special").dialog("open");
        }
        function showWeekDialog(el) {
            var id = el.parentNode.parentNode.cells[0].textContent;
            var request_id = parseInt(id);
            $("#dialog-week").empty();
            for (var i = 0; i < requestData.length; i++) {
                if (requestData[i].request_id == request_id) {
                    $("#dialog-week").append(requestData[i].week);
                    console.log(requestData[i].week);
                }
            }

            $("#dialog-week").dialog("open");
        }
        function showFacilityDialog(el) {
            $("#facility_list").empty();
            var id = el.parentNode.parentNode.cells[0].textContent;
            var request_id = parseInt(id);
            for (var i = 0; i < requestData.length; i++) {
                if (requestData[i].request_id == request_id) {
                    if (requestData[i].wheelchair == 1)
                        $("#facility_list").append("<li>Wheelchair</li>");
                    if (requestData[i].projector == 1)
                        $("#facility_list").append("<li>Projector</li>");
                    if (requestData[i].whiteboard == 1)
                        $("#facility_list").append("<li>Whiteboard</li>");
                    if (requestData[i].visualiser == 1)
                        $("#facility_list").append("<li>Visualiser</li>");
                    if (requestData[i].computer == 1)
                        $("#facility_list").append("<li>Computer</li>");
                    if (requestData[i].lecture_capture == 1)
                        $("#facility_list").append("<li>Lecture Capture</li>");
                    if (requestData[i].pa_system == 1)
                        $("#facility_list").append("<li>PA System</li>");
                    if (requestData[i].video_dvd == 1)
                        $("#facility_list").append("<li>Video/DVD</li>");
                    if (requestData[i].radio_microphone == 1)
                        $("#facility_list").append("<li>Radio Microphone</li>");
                }
            }

            $("#dialog-facility").dialog("open");
        }
        function initFacilityDialog() {
            $("#dialog-facility").dialog({
                position: {
                    my: "center",
                    at: "center",
                    of: window
                }
            });
            $("#dialog-facility").dialog("close");
        }
        function initSpecialDialog() {
            $("#dialog-special").dialog({
                position: {
                    my: "center",
                    at: "center",
                    of: window
                }
            });
            $("#dialog-special").dialog("close");
        }
        function initWeekDialog() {
            $("#dialog-week").dialog({
                position: {
                    my: "center",
                    at: "center",
                    of: window
                }
            });
            $("#dialog-week").dialog("close");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    <h2>Import Request</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <%-- These allow us to see table head and use filter when scrolling down the page --%>
 <div class="tabs">
    <ul class="tab-links">
        <li class="active"><a href="#booked">Booked</a></li>
        <li ><a href="#rejected">Rejected</a></li>
        
    </ul>
    <div class="tab-content">
                <div id="booked" class="tab active">
          <div class="table_header"> 
            <table class="scrollTable">
	          <tr>
			        <td id="request_id_td" onclick="sortHeader(this.id)">Request<br/>Id</td>
			        <td id="module_td" onclick="sortHeader(this.id)">Module <br/> Code</td>
			        <td id="room_code_td" onclick="sortHeader(this.id)">Room Code</td>
			        <td id="capacity_td" onclick="sortHeader(this.id)">Capacity</td>
			        <td style="cursor:default;">Facility</td>
			        <td style="cursor:default; font-size:0.8em; font-weight:bold;">Special <br/>Requirements</td>
			        <td id="priority_td" onclick="sortHeader(this.id)">Priority</td>
			        <td id="day_td" onclick="sortHeader(this.id)">Day</td>
			        <td id="period_td" onclick="sortHeader(this.id)">Period</td>
			        <td id="duration_td" onclick="sortHeader(this.id)">Duration</td>
			        <td style="cursor:default;">Week(s)</td>
			        <td style="cursor:default;">Action</td>
	           </tr>
            </table>
         </div>
           <table id="Booked" class="dataTable">
            </table>
          </div>
        <div id="rejected" class="tab">
          <div id="table_header"> 
            <table class="scrollTable">
	         <tr>
			        <td id="request_id_td" onclick="sortHeader(this.id)">Request<br/>Id</td>
			        <td id="module_td" onclick="sortHeader(this.id)">Module <br/> Code</td>
			        <td id="room_code_td" onclick="sortHeader(this.id)">Room Code</td>
			        <td id="capacity_td" onclick="sortHeader(this.id)">Capacity</td>
			        <td style="cursor:default;">Facility</td>
			        <td style="cursor:default; font-size:0.8em; font-weight:bold;">Special <br/>Requirements</td>
			        <td id="priority_td" onclick="sortHeader(this.id)">Priority</td>
			        <td id="day_td" onclick="sortHeader(this.id)">Day</td>
			        <td id="period_td" onclick="sortHeader(this.id)">Period</td>
			        <td id="duration_td" onclick="sortHeader(this.id)">Duration</td>
			        <td style="cursor:default;">Week(s)</td>
			        <td style="cursor:default;">Action</td>
                </tr>
	          </table>
            </div> 
            <table id="Rejected" class="dataTable">
            </table>

       </div>
 


  </div>
 </div>
    <div id="dialog-facility" >
        <ul id="facility_list" >
        </ul>
    </div>
    <div id="dialog-special" >
        <p id="special_req"></p>
    </div>
    <div id="dialog-week">
    </div>
</asp:Content>
