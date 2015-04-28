<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Team11.AdminPage" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Admin page CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/AdminPage.css"/>  
    
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            
            $("#tabs").tabs();
            getRequestAjax();
            initFacilityDialog();
            getRoundAjax();
            getRoomAjax();
            getBuildingAjax();
            //start datepicker
            $("#from1").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#from1").datepicker("option", "dateFormat", "dd/mm/yy");
            $("#to1").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#from").datepicker("option", "maxDate", selectedDate);
                }
            });
            $("#to1").datepicker("option", "dateFormat", "dd/mm/yy");
            $("#from2").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#from2").datepicker("option", "dateFormat", "dd/mm/yy");
            $("#to2").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#from").datepicker("option", "maxDate", selectedDate);
                }
            });
            $("#to2").datepicker("option", "dateFormat", "dd/mm/yy");
            $("#from3").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#from3").datepicker("option", "dateFormat", "dd/mm/yy");
            $("#to3").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#from").datepicker("option", "maxDate", selectedDate);
                }
            });
            $("#to3").datepicker("option", "dateFormat", "dd/mm/yy");
            //end datepicker
        });
        var requestData;
        var currentRow;
        var roundData;
        var roomData;
        var buildingData;
        function filterChange() {
            var buildingOption = $("#building_filter").val();
            var building = buildingOption.substr((buildingOption.indexOf(":") + 2));
            var park = $("#park_filter").val();
            $("#accordion").remove();
            $("#room-tabs").append("<div id='accordion'>");
            for (var i = 0; i < roomData.length; i++) {
                if ((park == "Any" || roomData[i].park == park) && (buildingOption == "Any" || roomData[i].building_name == building)) {
                    $("#accordion").append("<h3>" + roomData[i].room_code + "</h3>");
                    $("#accordion").append("<div id='" + roomData[i].room_code + "'>Room: " + roomData[i].room_code + "<br />" + "Building: " + roomData[i].building_name + "<br />" + "Park: " + roomData[i].park + "<br />" + "Capacity: " + roomData[i].capacity + "<br /></div>");
                }
            }
            $("#accordion").accordion({
                collapsible: true,
                heightStyle: "content"
            });
            $("#room-tabs").append("</div>");
        }
        //start ajax
        //get building data
        function getBuildingAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getBuilding",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    buildingData = data.d;
                    for (var i = 0; i < buildingData.length; i++) {
                        $("#building_filter").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get room data and their location
        function getRoomAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getRooms",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    roomData = data.d;
                    console.log(roomData);
                    $("#accordion").empty();
                    for (var i = 0; i < roomData.length;i++){
                        $("#accordion").append("<h3>" + roomData[i].room_code + "</h3>");
                        $("#accordion").append("<div id='" + roomData[i].room_code + "'>Room: " + roomData[i].room_code + "<br />" + "Building: " + roomData[i].building_name + "<br />" + "Park: " + roomData[i].park + "<br />" + "Capacity: " + roomData[i].capacity + "<br /></div>");
                    }
                    $("#accordion").accordion({
                        collapsible: true,
                        heightStyle: "content"
                    });
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get all round dates into an array
        function getRoundAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "AdminPage.aspx/getRound",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    roundData = data.d;
                    console.log(roundData);
                    for (var i = 0; i < 3; i++) {
                        var from = "#from" + (i + 1);
                        var to = "#to" + (i + 1);
                        $(from).val(roundData[i].from);
                        $(to).val(roundData[i].to);
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //update round date
        function updateRoundAjax() {
            var round = {};
            //get all round date into 'round'
            round.from1 = $("#from1").val();
            round.to1 = $("#to1").val();
            round.from2 = $("#from2").val();
            round.to2 = $("#to2").val();
            round.from3 = $("#from3").val();
            round.to3 = $("#to3").val();
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "AdminPage.aspx/updateRound",
                data: "{round: " + JSON.stringify(round) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");
                    getRoundAjax();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get all request data into an array
        function getRequestAjax() {
            $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "ViewRequest.aspx/getRequest",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        requestData = data.d;
                        console.log(requestData);
                        //display all request data in a table
                        for (var i = 0; i < requestData.length; i++) {
                            var id = "#" + (i + 1);
                            $("#dataTable").append("<tr id='" + (i + 1) + "'>");
                           // $(id).append("<td>" + requestData[i].request_id + "</td>");
                            $(id).append("<td>" + requestData[i].dept_code + "<input type='hidden' id='row" + (i + 1) + "' value='" + requestData[i].request_id + "' />" + "</td>");
                            $(id).append("<td>" + requestData[i].module + "</td>");
                            $(id).append("<td>" + requestData[i].room_code + "</td>");
                            $(id).append("<td>" + requestData[i].capacity + "</td>");
                            $(id).append("<td><input id='facility-" + requestData[i].request_id + "' type='button' value='Show' onclick='showFacilityDialog(this)' /></td>");
                            $(id).append("<td>" + requestData[i].special_req + "</td>");
                            $(id).append("<td>" + requestData[i].priority + "</td>");
                            $(id).append("<td>" + requestData[i].day + "</td>");
                            $(id).append("<td>" + requestData[i].period + "</td>");
                            $(id).append("<td>" + requestData[i].duration + "</td>");
                            $(id).append("<td>" + "Weeks" + "</td>");
                            $(id).append("<td>" + requestData[i].semester + "</td>");
                            $(id).append("<td>" + requestData[i].session + "</td>");
                            $(id).append("<td><input id='allocate-" + requestData[i].request_id + "' type='button' value='Allocate' onclick='allocateAjax(this)' /><br/>" + "<input id='reject-" + requestData[i].request_id + "' type='button' value='Reject' onclick='rejectAjax(this)' /></td>");
                            $("#dataTable").append("</tr>");
                        }
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
        }
        //change the status of a request to 'booked'
        function allocateAjax(el) {
            var request = {};
            currentRow = el.parentNode.parentNode;
            //get id of current row
            var id = "#row" + $(currentRow).attr('id');
            //get value of request_id from hidden input form
            request.request_id = $(id).val();
            //assign var here
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "AdminPage.aspx/allocateRequest",
                //send request_id of current row to process in the codebehind environment
                data: "{request: " + JSON.stringify(request) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //change the status of a request to 'rejected'
        function rejectAjax(el) {
            var request = {};
            currentRow = el.parentNode.parentNode;
            //get id of current row
            var id = "#row" + $(currentRow).attr('id');
            //get value of request_id from hidden input form
            request.request_id = $(id).val();
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "AdminPage.aspx/rejectRequest",
                //send request_id of current row to process in the codebehind environment
                data: "{request: " + JSON.stringify(request) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }

        //end ajax
        //start dialog
        //initialise facility dialog. this will be used to display facilities requested by timetablers in the room allocation tab
        function initFacilityDialog() {
            $("#dialog-facility").dialog();
            $("#dialog-facility").dialog("close");
        }
        function showFacilityDialog(el) {
            $("#facility_list").empty();
            var row = el.parentNode.parentNode;
            //get id of current row
            var id = "#row" + $(row).attr('id');
            //get value of request_id from hidden input form
            var request_id = parseInt($(id).val());
            for (var i = 0; i < requestData.length;i++){
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
        //end dialog
    </script>
   
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Admin Page</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Tabs containing different admin functionality --%>
    <div id="tabs">
      <ul>
        <li><a href="#room-allocation-tabs">Room Allocation</a></li>
        <li><a href="#facility-tabs">Facility Management</a></li>
        <li><a href="#round-tabs">Round Dates</a></li>
        <li><a href="#room-tabs">Room Management</a></li>
      </ul>
      <div id="room-allocation-tabs">
        <h2>Room allocation</h2>
        <%-- These allow us to see table head and use filter when scrolling down the page --%>
        <div id="table_header">
            <table id="scrollTable">
	            <tr>
		            <h4>Click on the headers to sort the table</h4><br/><br/>
<%--			            <td id="request_id">
				            Request</br>Id
			            </td>--%>
                        <td id="dept_code">
			                Dept
		                </td>
			            <td id="module_code">
				            Module </br> Code
			            </td>
			            <td id="room_code">
				            Room Code
			            </td>
			            <td id="capacity">
				            Capacity
			            </td>
                        <td id="facility">
                            Facility
                        </td>
			            <td id="special_requirements" style="cursor:default; font-size:0.8em; font-weight:bold;">
				            Special </br>Req
			            </td>
			            <td id="priority">
				            Priority
			            </td>
			            <td id="day">
				            Day
			            </td>
			            <td id="period">
				            Period
				
			            <td id="duration">
				            Duration
			            </td>
			            <td id="week(s)" style="cursor:default;">
				            Week(s)
			            </td>
                        <td id="semester">
                            Semester
                        </td>
                        <td id="session">
                            Session Type
                        </td>
			            <td id="edit_cell" style="cursor:default;">
				            Action
			            </td>
                    </tr>
	            </table>
            </div>

            <div id="content_wrap">
                <table id="dataTable" class="entries_table">
	                <tr style="display:none;">
<%--		            <td id="request_id">
			                Request_id
		                </td>--%>
                        <td id="dept_code">
			                Dept
		                </td>
		                <td id="module_code">
			                Module_code
		                </td>
		                <td id="room_code">
			                Room_code
		                </td>
		                <td id="capacity">
			                Capacity
		                </td>
		                <td id="facility">
                            Facility
		                </td>
		                <td id="special_requirements">
			                Special </br>Req
		                </td>
		                <td id="priority">
			                Priority
		                </td>
		                <td id="day">
			                Day
		                </td>
		                <td id="period">
			                Period
		                </td>
				
		                <td id="duration">
			                Duration
		                </td>
		                <td id="week(s)" >
			                Week(s)
		                </td>
                        <td id="semester">
                            Semester
                        </td>
                        <td id="session">
                            Session Type
                        </td>
		                <td id="edit_cell" style="cursor:default;">
			                Action
		                </td>
				
	                </tr>
                </table>
            </div>
            <%--dialog displaying list of facilities specified by timetablers--%>
            <div id="dialog-facility" title="Facilities">
                <ul id="facility_list">

                </ul>
            </div>      
          </div>
          <div id="facility-tabs">
            <p>Facility management</p>
          </div>
          <div id="round-tabs">
            <h2>Round dates</h2>
            Round 1: <label for="from">From</label>
            <input type="text" id="from1" name="from1">
            <label for="to">to</label>
            <input type="text" id="to1" name="to1"><br />
            Round 2: <label for="from">From</label>
            <input type="text" id="from2" name="from2">
            <label for="to">to</label>
            <input type="text" id="to2" name="to2"><br />
            Round 3: <label for="from">From</label>
            <input type="text" id="from3" name="from3">
            <label for="to">to</label>
            <input type="text" id="to3" name="to3"><br />
            <input type="button" id="save_round" name="save_round" value="Submit" onclick="updateRoundAjax()" />
          </div>
          <div id="room-tabs">
              <div id="room_filter">
                  Park: <select id="park_filter" onchange="filterChange()">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>    
                            <option>West</option>                 
                        </select>&nbsp;
                  Building: <select id="building_filter" onchange="filterChange()">
                                <option>Any</option>
                            </select>&nbsp;
              </div>
              <div id="accordion">
                
              </div>
          </div>
    </div>  
</asp:Content>
