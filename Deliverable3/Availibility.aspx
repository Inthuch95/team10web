<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Availibility.aspx.cs" Inherits="Team11.Availibility" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/Availability.css"/>    
    
    <script type="text/javascript" language="javascript">
         $(document).ready(function () {
             initRequestDialog();
             getRequestAjax();
             getRoomAjax();
             loadDuration();
             loadPeriod();
             getBuildingAjax();

             //capacity slider
             $("#slider-capacity").slider({
                 range: "max",
                 min: 1,
                 max: 500,
                 value: 1,
                 step: 1,
                 slide: function (event, ui) {
                     $("#capacity1").val(ui.value);
                 }
             });
             //put the slider value into text box with id 'capacity'
             $("#capacity1").val($("#slider-capacity").slider("value"));
             //capacity slider
             $("#slider-capacity2").slider({
                 range: "max",
                 min: 1,
                 max: 500,
                 value: 1,
                 step: 1,
                 slide: function (event, ui) {
                     $("#capacity2").val(ui.value);
                     changeRoom2();
                 }
             });
             //put the slider value into text box with id 'capacity'
             $("#capacity2").val($("#slider-capacity").slider("value"));
             //start selectable
             //room preference 1
             $("#selectable-session").selectable({
                 stop: function () {
                     $(".ui-selected", this).each(function () {
                         var index = $("#selectable-session li").index(this);
                         switch (index) {
                             case 0:
                                 $("#session").val("Lecture");
                                 break;
                             case 1:
                                 $("#session").val("Practical");
                                 break;
                             case 2:
                                 $("#session").val("Seminar");
                                 break;
                             case 3:
                                 $("#session").val("Tutorial");
                                 break;
                         }
                     });
                 }
             });
             $("#selectable-arrangement").selectable({
                 stop: function () {
                     $(".ui-selected", this).each(function () {
                         var index = $("#selectable-arrangement li").index(this);
                         switch (index) {
                             case 0:
                                 $("#arrangement").val("Any");
                                 break;
                             case 1:
                                 $("#arrangement").val("Tired");
                                 break;
                             case 2:
                                 $("#arrangement").val("Flat");
                                 break;
                         }
                         changeRoom();
                     });
                 }
             });
             $("#selectable-priority").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedPriority == false)
                     selectedPriority = true;
                 else
                     selectedPriority = false;
                 if (selectedPriority)
                     $("#priority").val("1");
                 else
                     $("#priority").val("0");
             }).selectable();
             $("#selectable-wheelchair").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedWheelchair == false)
                     selectedWheelchair = true;
                 else
                     selectedWheelchair = false;
                 if (selectedWheelchair)
                     $("#wheelchair").val("1");
                 else
                     $("#wheelchair").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-whiteboard").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedWhiteboard == false)
                     selectedWhiteboard = true;
                 else
                     selectedWhiteboard = false;
                 if (selectedWhiteboard)
                     $("#whiteboard").val("1");
                 else
                     $("#whiteboard").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-projector").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedProjector == false)
                     selectedProjector = true;
                 else
                     selectedProjector = false;
                 if (selectedProjector)
                     $("#projector").val("1");
                 else
                     $("#projector").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-visualiser").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedVisualiser == false)
                     selectedVisualiser = true;
                 else
                     selectedVisualiser = false;
                 if (selectedVisualiser)
                     $("#visualiser").val("1");
                 else
                     $("#visualiser").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-computer").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedComputer == false)
                     selectedComputer = true;
                 else
                     selectedComputer = false;
                 if (selectedComputer)
                     $("#computer").val("1");
                 else
                     $("#computer").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-video").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedVideo == false)
                     selectedVideo = true;
                 else
                     selectedVideo = false;
                 if (selectedVideo)
                     $("#video").val("1");
                 else
                     $("#video").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-pa").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedPa == false)
                     selectedPa = true;
                 else
                     selectedPa = false;
                 if (selectedPa)
                     $("#pa").val("1");
                 else
                     $("#pa").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-mic").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedMic == false)
                     selectedMic = true;
                 else
                     selectedMic = false;
                 if (selectedMic)
                     $("#mic").val("1");
                 else
                     $("#mic").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-capture").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedCap == false)
                     selectedCap = true;
                 else
                     selectedCap = false;
                 if (selectedCap)
                     $("#capture").val("1");
                 else
                     $("#capture").val("0");
                 changeRoom();
             }).selectable();
             $("#selectable-day").selectable({
                 stop: function () {
                     $(".ui-selected", this).each(function () {
                         var index = $("#selectable-day li").index(this);
                         switch (index) {
                             case 0:
                                 $("#day").val("Monday");
                                 break;
                             case 1:
                                 $("#day").val("Tuesday");
                                 break;
                             case 2:
                                 $("#day").val("Wednesday");
                                 break;
                             case 3:
                                 $("#day").val("Thursday");
                                 break;
                             case 4:
                                 $("#day").val("Friday");
                                 break;
                         }
                     });
                 }
             });
         });
         var requestData;
         var roomData;
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
                         for (var i = 0; i <= requestData.length; i++) {
                             if (requestData[i].status == "Booked") {
                                 $("#p" + requestData[i].period + "_" + requestData[i].day.substr(0, 3).toLowerCase()).empty();
                             }
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
                     $("#room-select").append("<option>Any</option>");
                     for (var i = 0; i < roomData.length; i++) {
                         $("#room-select").append("<option>" + roomData[i].room_code + "</option>");
                     }
                 },
                 error: function (response) {
                     console.log(response);
                 }
             });
         }
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
                     $("#building-select").append("<option value='Any'>Any</option>");
                     for (var i = 0; i < buildingData.length; i++) {
                         $("#building-select").append("<option value='" + buildingData[i].building_code + "'>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                     }
                 },
                 error: function (response) {
                     console.log(response);
                 }
             });
         }
         function initRequestDialog() {
             $("#dialog-request").dialog({
                 height: 500,
                 width: 700,
                 position: {
                     my: "center",
                     at: "center",
                     of: window
                 }
             });
             $("#dialog-request").dialog("close");
         }
         //fill duration drop down list
         function loadDuration() {
             for (var i = 1; i <= 9; i++) {
                 $("#duration").append("<option>" + i + "</option>");
             }
         }
         //fill period drop down list
         function loadPeriod() {
             for (var i = 1; i <= 9; i++) {
                 var time = i + 8;
                 $("#period").append("<option value='" + i + "'>" + i + " - " + time + ":00</option>");
             }
         }
         //change uration based on period
         function refillDuration() {
             $("#duration").empty();
             var period = $("#period").val();
             for (var i = 1; i <= 10 - period; i++) {
                 $("#duration").append("<option value='" + i + "'>" + i + "</option>");
             }
         }
         function changeRoom() {
             //get values of user's selection
             var park = document.getElementById("park").value;
             var building = document.getElementById("building").value;
             var capacity = parseInt(document.getElementById("capacity1").value);
             var isWheelchair = parseInt(document.getElementById("wheelchair").value);
             var isVisualiser = parseInt(document.getElementById("visualiser").value);
             var isProjector = parseInt(document.getElementById("projector").value);
             var isWhiteboard = parseInt(document.getElementById("whiteboard").value);
             var computer = parseInt(document.getElementById("computer").value);
             var capture = parseInt(document.getElementById("capture").value);
             var pa = parseInt(document.getElementById("pa").value);
             var mic = parseInt(document.getElementById("mic").value);
             var video = parseInt(document.getElementById("video").value);
             var arrangement = document.getElementById("arrangement").value;
             var room_arr1;

             //empty the room code list
             $("#room").empty();
             $("#room").append("<option>" + "Any" + "</option>");

             for (var i = 0; i < roomData.length; i++) {
                 //room preference 1
                 //check room arrangement selection
                 if (arrangement == "Tiered")
                     room_arr1 = roomData[i].tiered;
                 else if (arrangement == "Any")
                     room_arr1 = arrangement;
                 else
                     room_arr1 = roomData[i].flat;

                 //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                 //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                 if ((park == "Any" || park == roomData[i].park) &&
                 (isWheelchair == 0 || roomData[i].wheelchair == 1) &&
                 (isVisualiser == 0 || roomData[i].visualiser == 1) &&
                 (isProjector == 0 || roomData[i].projector == 1) &&
                 (isWhiteboard == 0 || roomData[i].whiteboard == 1) &&
                 (computer == 0 || roomData[i].computer == 1) &&
                 (capture == 0 || roomData[i].lecture_capture == 1) &&
                 (pa == 0 || roomData[i].pa_system == 1) &&
                 (mic == 0 || roomData[i].radio_microphone == 1) &&
                 (video == 0 || roomData[i].video_dvd == 1) &&
                 (roomData[i].capacity >= capacity) &&
                 (room_arr1 == "Any" || room_arr1 == 1) &&
                 (building == "Any" || building == roomData[i].building_code)) {
                     $("#room").append("<option>" + roomData[i].room_code + "</option>");
                 }
             }
         }
         function changeRoom2() {
             //get values of user's selection
             var park = document.getElementById("park-select").value;
             var building = document.getElementById("building-select").value;
             var capacity = parseInt(document.getElementById("capacity2").value);
             var isWheelchair = parseInt(document.getElementById("wheelchair-select").value);
             var isVisualiser = parseInt(document.getElementById("visualiser-select").value);
             var isProjector = parseInt(document.getElementById("projector-select").value);
             var isWhiteboard = parseInt(document.getElementById("whiteboard-select").value);
             var computer = parseInt(document.getElementById("computer-select").value);
             var capture = parseInt(document.getElementById("capture-select").value);
             var pa = parseInt(document.getElementById("pa-select").value);
             var mic = parseInt(document.getElementById("mic-select").value);
             var video = parseInt(document.getElementById("video-select").value);
             var arrangement = document.getElementById("arrangement-select").value;
             var room_arr1;

             //empty the room code list
             $("#room-select").empty();
             $("#room-select").append("<option>" + "Any" + "</option>");

             for (var i = 0; i < roomData.length; i++) {
                 //room preference 1
                 //check room arrangement selection
                 if (arrangement == "Tiered")
                     room_arr1 = roomData[i].tiered;
                 else if (arrangement == "Any")
                     room_arr1 = arrangement;
                 else
                     room_arr1 = roomData[i].flat;

                 //if the room has enough capacity, and has the options the users asked for - or they didn't ask for the option, then add it to the list
                 //e.g. if the user didn't ask for wheelchair access then add the room with wheelchair access to the room preference anyway
                 if ((park == "Any" || park == roomData[i].park) &&
                 (isWheelchair == 0 || roomData[i].wheelchair == 1) &&
                 (isVisualiser == 0 || roomData[i].visualiser == 1) &&
                 (isProjector == 0 || roomData[i].projector == 1) &&
                 (isWhiteboard == 0 || roomData[i].whiteboard == 1) &&
                 (computer == 0 || roomData[i].computer == 1) &&
                 (capture == 0 || roomData[i].lecture_capture == 1) &&
                 (pa == 0 || roomData[i].pa_system == 1) &&
                 (mic == 0 || roomData[i].radio_microphone == 1) &&
                 (video == 0 || roomData[i].video_dvd == 1) &&
                 (roomData[i].capacity >= capacity) &&
                 (room_arr1 == "Any" || room_arr1 == 1) &&
                 (building == "Any" || building == roomData[i].building_code)) {
                     $("#room-select").append("<option>" + roomData[i].room_code + "</option>");
                 }
             }
         }
         function changePark2() {
             var park = document.getElementById("park-select").value;
             //empty building list
             $("#building-select").empty();
             //add "Any" option to building list
             $("#building-select").append("<option value='Any'>Any</option>");
             for (var i = 0; i < buildingData.length; i++) {
                 //if building is in selected park then add to building list
                 if (park == "Any" || park == buildingData[i].park) {
                     $("#building-select").append("<option value='" + buildingData[i].building_code + "'>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                 }
             }
             changeRoom2();
         }
         function changePark() {
             var park = document.getElementById("park").value;
             //empty building list
             $("#building").empty();
             //add "Any" option to building list
             $("#building").append("<option value='Any'>Any</option>");
             for (var i = 0; i < buildingData.length; i++) {
                 //if building is in selected park then add to building list
                 if (park == "Any" || park == buildingData[i].park) {
                     $("#building").append("<option value='" + buildingData[i].building_code + "'>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                 }
             }
             changeRoom();
         }
    </script>


</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Ad-Hoc</h1>
</asp:Content>

<%-- Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Facility: 
    Park: <select id="park-select" onchange="changePark2()">
            <option>Any</option>
            <option>Central</option>
            <option>East</option>
            <option>West</option>
          </select>&nbsp;
    Building: <select id="building-select" onchange="changeRoom2()">

              </select>&nbsp;
    Room: <select id="room-select">

          </select><br />
     Capacity: <div id="slider-capacity2"></div> &nbsp; <input type="text" id="capacity2" name="capacity2" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/><br />
    <table frame="box" style="width:100%;" align "center" class="testTable" id="Reject">
                <br/>
                <div id="hours">
                
                <tr id="headers">
			        <th>Timetable</th>
			        <th>09.00</th>
			        <th>10.00</th>
			        <th>11.00</th>
			        <th>12.00</th>
			        <th>13.00</th>
			        <th>14.00</th>
			        <th>15.00</th>
			        <th>16.00</th>
			        <th>17.00</th>
			        <th>18.00</th>
		        </tr>
            </div>
	        <div id="Days">
		        <tr id="Monday_td">	
			        <td class="day" style="background-color:#f1f1f1;">Monday</td>
			        <td id="p1_mon"><input type="button" id="p1_mon_select" value="select" /></td>
			        <td id="p2_mon"><input type="button" id="p2_mon_select" value="select" /></td>
			        <td id="p3_mon"><input type="button" id="p3_mon_select" value="select" /></td>
			        <td id="p4_mon"><input type="button" id="p4_mon_select" value="select" /></td>
			        <td id="p5_mon"><input type="button" id="p5_mon_select" value="select" /></td>
			        <td id="p6_mon"><input type="button" id="p6_mon_select" value="select" /></td>
			        <td id="p7_mon"><input type="button" id="p7_mon_select" value="select" /></td>
			        <td id="p8_mon"><input type="button" id="p8_mon_select" value="select" /></td>
			        <td id="p9_mon"><input type="button" id="p9_mon_select" value="select" /></td>	
			        <td id="p10_mon"><input type="button" id="p10_mon_select" value="select" /></td>
		        </tr>
		        <tr id="Tuesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="p1_tue"><input type="button" id="p1_tue_select" value="select" /></td>
			        <td id="p2_tue"><input type="button" id="p2_tue_select" value="select" /></td>
			        <td id="p3_tue"><input type="button" id="p3_tue_select" value="select" /></td>
			        <td id="p4_tue"><input type="button" id="p4_tue_select" value="select" /></td>
			        <td id="p5_tue"><input type="button" id="p5_tue_select" value="select" /></td>
			        <td id="p6_tue"><input type="button" id="p6_tue_select" value="select" /></td>
			        <td id="p7_tue"><input type="button" id="p7_tue_select" value="select" /></td>
			        <td id="p8_tue"><input type="button" id="p8_tue_select" value="select" /></td>
			        <td id="p9_tue"><input type="button" id="p9_tue_select" value="select" /></td>
			        <td id="p10_tue"><input type="button" id="p10_tue_select" value="select" /></td>			
		        </tr>
		        <tr id="Wednesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="p1_wed"><input type="button" id="p1_wed_select" value="select" /></td>
			        <td id="p2_wed"><input type="button" id="p2_wed_select" value="select" /></td>
			        <td id="p3_wed"><input type="button" id="p3_wed_select" value="select" /></td>
			        <td id="p4_wed"><input type="button" id="p4_wed_select" value="select" /></td>
			        <td id="p5_wed"><input type="button" id="p5_wed_select" value="select" /></td>
			        <td id="p6_wed"><input type="button" id="p6_wed_select" value="select" /></td>
			        <td id="p7_wed"><input type="button" id="p7_wed_select" value="select" /></td>
			        <td id="p8_wed"><input type="button" id="p8_wed_select" value="select" /></td>
			        <td id="p9_wed"><input type="button" id="p9_wed_select" value="select" /></td>
			        <td id="p10_wed"><input type="button" id="p10_wed_select" value="select" /></td>
		        </tr>
		        <tr id="Thursday_td">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="p1_thu"><input type="button" id="p1_thu_select" value="select" /></td>
			        <td id="p2_thu"><input type="button" id="p2_thu_select" value="select" /></td>
			        <td id="p3_thu"><input type="button" id="p3_thu_select" value="select" /></td>
			        <td id="p4_thu"><input type="button" id="p4_thu_select" value="select" /></td>
			        <td id="p5_thu"><input type="button" id="p5_thu_select" value="select" /></td>
			        <td id="p6_thu"><input type="button" id="p6_thu_select" value="select" /></td>
			        <td id="p7_thu"><input type="button" id="p7_thu_select" value="select" /></td>
			        <td id="p8_thu"><input type="button" id="p8_thu_select" value="select" /></td>
			        <td id="p9_thu"><input type="button" id="p9_thu_select" value="select" /></td>
			        <td id="p10_thu"><input type="button" id="p10_thu_select" value="select" /></td>		
		        </tr>
		        <tr id="Friday_td">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="p1_fri"><input type="button" id="p1_fri_select" value="select" /></td>
			        <td id="p2_fri"><input type="button" id="p2_fri_select" value="select" /></td>
			        <td id="p3_fri"><input type="button" id="p3_fri_select" value="select" /></td>
			        <td id="p4_fri"><input type="button" id="p4_fri_select" value="select" /></td>
			        <td id="p5_fri"><input type="button" id="p5_fri_select" value="select" /></td>
			        <td id="p6_fri"><input type="button" id="p6_fri_select" value="select" /></td>
			        <td id="p7_fri"><input type="button" id="p7_fri_select" value="select" /></td>
			        <td id="p8_fri"><input type="button" id="p8_fri_select" value="select" /></td>
			        <td id="p9_fri"><input type="button" id="p9_fri_select" value="select" /></td>
			        <td id="p10_fri"><input type="button" id="p10_fri_select" value="select" /></td>				
		        </tr>
		        </div>
            </table>
       <%--edit request form - become visible when clicking edit--%>
    <div id="dialog-request" title="Edit Request">
        <input type="hidden" id="request_id" />
        Priority: <ol id="selectable-priority">
                        <li class="ui-state-default" style="width: 80px">Priority</li>
                  </ol><input type="hidden" id="priority" value="0"/>
        
        <br /><br /><br /><br />
        Module: <select id="module">
                    
                </select><br />
        Session Type: <table>
                        <tr>
                            <td>
                                <ol id="selectable-session">
                                    <li class="ui-state-default ui-selected" style="width: 80px" id="lecter">Lecture</li>
                                    <li class="ui-state-default" style="width: 80px" id="practical">Practical</li>
                                    <li class="ui-state-default" style="width: 80px" id="seminar">Seminar</li>
                                    <li class="ui-state-default" style="width: 80px" id="tutorial">Tutorial</li>
                                </ol>
                                <input type="hidden" id="session" value="Lecture" />
                            </td>
                        </tr>
                    </table><br />
        Lecturer: <input type="text" id="lecturer" name="lecturer" /><br />
        Arrangement: <table>
                        <tr>
                            <td>
                                <ol id="selectable-arrangement">
                                    <li class="ui-state-default ui-selected" style="width: 200px" id="arr-any">Any</li>
                                    <li class="ui-state-default" style="width: 200px" id="arr-tiered">Tiered</li>
                                    <li class="ui-state-default" style="width: 200px" id="arr-flat">Flat</li>
                                </ol>
                                <input type="hidden" id="arrangement" name="arrangement" value="Any" />
                            </td>
                        </tr>
                    </table><br />
        Capacity: <div id="slider-capacity"></div> &nbsp; <input type="text" id="capacity1" name="capacity1" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/><br />
        
        Facility: <table>
            <tr>
                <td>
                    <ol id="selectable-computer">
                        <li class="ui-state-default" style="width: 200px">Computer</li>
                    </ol>
                    <input type="hidden" id="computer" name="computer" value="0"/>
                </td>
                <td>
                        <ol id="selectable-capture">
                            <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                        </ol>
                        <input type="hidden" id="capture" name="capture" value="0" />
                </td>
                </tr>
                <tr>
                <td>
                    <ol id="selectable-pa">
                        <li class="ui-state-default" style="width: 200px">PA System</li>
                    </ol>
                    <input type="hidden" id="pa" name="pa" value="0" />
                </td>
                <td>
                    <ol id="selectable-projector">
                        <li class="ui-state-default" style="width: 200px">Projector</li>
                    </ol>
                    <input type="hidden" id="projector" name="projector" value="0" />
                </td>
                </tr>
                <tr>
                <td>
                    <ol id="selectable-mic">
                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                    </ol>
                    <input type="hidden" id="mic" name="mic" value="0" />
                </td>
                <td>
                    <ol id="selectable-video">
                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                    </ol>
                    <input type="hidden" id="video" name="video" value="0" />
                </td>
            </tr>
            <tr>
                <td>
                    <ol id="selectable-visualiser">
                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                    </ol>
                    <input type="hidden" id="visualiser" name="visualiser" value="0" />
                </td>
                <td>
                    <ol id="selectable-whiteboard">
                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                    </ol>
                    <input type="hidden" id="whiteboard" name="whiteboard" value="0" />
                </td>
            </tr>
            <tr>
                <td>
                    <ol id="selectable-wheelchair">
                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                    </ol>
                    <input type="hidden" id="wheelchair" name="wheelchair" value="0" />
                </td>
            </tr>
        </table><br />
        <table>
            <tr>
                <td>
                    Park: <select id="park" onchange="changePark()">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>
                            <option>West</option>
                          </select>
                </td>
                <td>
                    Building: <select id="building" onchange="changeRoom()">
                                
                              </select>   
                </td>
                <td>
                    Room: <select id="room">

                          </select>
                </td>
            </tr>
        </table><br />
        Additional Requiements: <textarea id="extra_req" style="width:835px;" cols="80" maxlength="1000">

                                </textarea><br />
        Day: <table>
                <tr>
                    <td>
                        <ol id="selectable-day">
                            <li class="ui-state-default" style="width: 100px" id="monday">Monday</li>
                            <li class="ui-state-default" style="width: 100px" id="tuesday">Tuesday</li>
                            <li class="ui-state-default" style="width: 100px" id="wednesday">Wednesday</li>
                            <li class="ui-state-default" style="width: 100px" id="thursday">Thursday</li>
                            <li class="ui-state-default" style="width: 100px" id="friday">Friday</li>
                        </ol>
                    </td>
               </tr>
            </table>
            <input type="hidden" id="day" name="day" value=""/><br />
        <table>
            <tr>
                <td>
                    Semester: <select id="semester">
                                <option>1</option>
                                <option>2</option>
                              </select>
                </td>
                <td>
                    Period: <select id="period" onchange="refillDuration()">

                            </select>
                </td>
                <td>
                    Duration: <select id="duration">

                              </select>
                </td>
            </tr>
        </table><br />
        Week: <table>
                <tr>
                    <td>
                        <input type="checkbox" name="weeks" id="week1" value="1"  class="vis-hidden new-post-tags"/>
						<label style="margin-left: 100px;" id="week" for="week1" class="week_label">  1  </label>
						<input type="checkbox" name="weeks" id="week2" value="2"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week2" class="week_label">  2  </label>
						<input type="checkbox" name="weeks" id="week3" value="3"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week3" class="week_label">  3  </label>
						<input type="checkbox" name="weeks" id="week4" value="4"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week4" class="week_label">  4  </label>
						<input type="checkbox" name="weeks" id="week5" value="5"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week5" class="week_label">  5  </label>
						<input type="checkbox" name="weeks" id="week6" value="6"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week6" class="week_label">  6  </label>
						<input type="checkbox" name="weeks" id="week7" value="7"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week7" class="week_label">  7  </label>
						<input type="checkbox" name="weeks" id="week8" value="8"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week8" class="week_label">  8  </label>
						<input type="checkbox" name="weeks" id="week9" value="9"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week9" class="week_label">  9  </label>
						<input type="checkbox" name="weeks" id="week10" value="10"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week10" class="week_label"> 10 </label>
						<input type="checkbox" name="weeks" id="week11" value="11"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week11" class="week_label"> 11 </label>
						<input type="checkbox" name="weeks" id="week12" value="12"  class="vis-hidden new-post-tags"/>
						<label id="week" for="week12" class="week_label"> 12 </label>
						<input type="checkbox" name="weeks" id="week13" value="13" class="vis-hidden new-post-tags"/>
						<label id="week" for="week13" class="week_label"> 13 </label>
						<input type="checkbox" name="weeks" id="week14" value="14" class="vis-hidden new-post-tags"/>
						<label id="week" for="week14" class="week_label"> 14 </label>
						<input type="checkbox" name="weeks" id="week15" value="15" class="vis-hidden new-post-tags"/>
						<label id="week" for="week15" class="week_label"> 15 </label>
						<input type="checkbox" name="weeks" id="week16" value="16" class="vis-hidden new-post-tags"/>
						<label id="week" for="week16" class="week_label"> 16 </label>
                    </td>
                </tr>
              </table>
        <input type="button" id="request-submit" value="Submit" class="btns" onclick="insertRequestAjax()" />&nbsp
        <input type="button" id="cancel" class="btns" value="cancel" onclick="$('#dialog-request').dialog('close')" />
    </div>
</asp:Content>
