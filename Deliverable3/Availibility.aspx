<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Availibility.aspx.cs" Inherits="Team11.Availibility" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/Availability.css"/>    
    
    <script type="text/javascript" language="javascript">
         $(document).ready(function () {
             initRequestDialog();
             getRoomAjax();
             loadDuration();
             loadPeriod();
             getBuildingAjax();
             loadWeek();
             getBookingAjax();
             resetTable();
             getModuleAjax();
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
             $("#capacity2").val($("#slider-capacity2").slider("value"));
             //start selectable
             //option 
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
             $("#selectable-arrangement2").selectable({
                 stop: function () {
                     $(".ui-selected", this).each(function () {
                         var index = $("#selectable-arrangement2 li").index(this);
                         switch (index) {
                             case 0:
                                 $("#arrangement2").val("Any");
                                 break;
                             case 1:
                                 $("#arrangement2").val("Tired");
                                 break;
                             case 2:
                                 $("#arrangement2").val("Flat");
                                 break;
                         }
                         changeRoom2();
                     });
                 }
             });
             $("#selectable-wheelchair2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedWheelchair2 == false)
                     selectedWheelchair2 = true;
                 else
                     selectedWheelchair2 = false;
                 if (selectedWheelchair2)
                     $("#wheelchair2").val("1");
                 else
                     $("#wheelchair2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-whiteboard2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedWhiteboard2 == false)
                     selectedWhiteboard2 = true;
                 else
                     selectedWhiteboard2 = false;
                 if (selectedWhiteboard2)
                     $("#whiteboard2").val("1");
                 else
                     $("#whiteboard2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-projector2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedProjector2 == false)
                     selectedProjector2 = true;
                 else
                     selectedProjector2 = false;
                 if (selectedProjector2)
                     $("#projector2").val("1");
                 else
                     $("#projector2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-visualiser2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedVisualiser2 == false)
                     selectedVisualiser2 = true;
                 else
                     selectedVisualiser2 = false;
                 if (selectedVisualiser2)
                     $("#visualiser2").val("1");
                 else
                     $("#visualiser2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-computer2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedComputer2 == false)
                     selectedComputer2 = true;
                 else
                     selectedComputer2 = false;
                 if (selectedComputer2)
                     $("#computer2").val("1");
                 else
                     $("#computer2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-video2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedVideo2 == false)
                     selectedVideo2 = true;
                 else
                     selectedVideo2 = false;
                 if (selectedVideo2)
                     $("#video2").val("1");
                 else
                     $("#video2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-pa2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedPa2 == false)
                     selectedPa2 = true;
                 else
                     selectedPa2 = false;
                 if (selectedPa2)
                     $("#pa2").val("1");
                 else
                     $("#pa2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-mic2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedMic2 == false)
                     selectedMic2 = true;
                 else
                     selectedMic2 = false;
                 if (selectedMic2)
                     $("#mic2").val("1");
                 else
                     $("#mic2").val("0");
                 changeRoom2();
             }).selectable();
             $("#selectable-capture2").bind("mousedown", function (e) {
                 e.metaKey = true;
                 if (selectedCap2 == false)
                     selectedCap2 = true;
                 else
                     selectedCap2 = false;
                 if (selectedCap2)
                     $("#capture2").val("1");
                 else
                     $("#capture2").val("0");
                 changeRoom2();
             }).selectable();
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

         var bookingData;
         var roomData;
         var moduleData;
         //selectable 1
         var selectedWhiteboard = false;
         var selectedComputer = false;
         var selectedCap = false;
         var selectedPa = false;
         var selectedProjector = false;
         var selectedMic = false;
         var selectedVideo = false;
         var selectedVisualiser = false;
         var selectedWheelchair = false;
         //selectable 2
         var selectedWhiteboard2 = false;
         var selectedComputer2 = false;
         var selectedCap2 = false;
         var selectedPa2 = false;
         var selectedProjector2 = false;
         var selectedMic2 = false;
         var selectedVideo2 = false;
         var selectedVisualiser2 = false;
         var selectedWheelchair2 = false;
         var selectedPriority = false;
         function loadWeek() {
             for (var i = 1; i <= 16; i++) {
                 $("#week-select").append("<option>" + i + "</option>");
             }
         }
         function getBookingAjax() {
             $.ajax(
                 {
                     type: "POST",
                     async: true,
                     url: "Availibility.aspx/getBooking",
                     data: "{}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (data) {

                         bookingData = data.d;
                         console.log(bookingData);
                         resetTable();
                         for (var i = 0; i <= bookingData.length; i++) {
                             if ($("#room-select").val() == "Any") {
                                 resetTable();
                             }
                             if (bookingData[i].week == $("#week-select").val() && bookingData[i].room_code == $("#room-select").val()) {
                                 $("#p" + bookingData[i].period + "_" + bookingData[i].day.substr(0, 3).toLowerCase()).empty();
                             }
                         }
                     },
                     error: function (response) {
                         console.log(response);
                     }
                 });
         }
         function selectChange() {
             resetTable();
             for (var i = 0; i <= bookingData.length; i++) {
                 if ($("#room-select").val() == "Any") {
                     resetTable();
                 }
                 if (bookingData[i].week == $("#week-select").val() && bookingData[i].room_code == $("#room-select").val()) {
                     $("#p" + bookingData[i].period + "_" + bookingData[i].day.substr(0, 3).toLowerCase()).empty();
                 }
             }
         }
         function getModuleAjax() {
             $.ajax(
             {
                 type: "POST",
                 async: true,
                 url: "CreateRequest.aspx/getModule",
                 data: "{}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (data) {
                     var result = data.d;
                     moduleData = data.d;
                     $("#module").empty();
                     for (var i = 0; i < result.length; i++) {
                         //populate module drop down list
                         $("#module").append("<option value='" + result[i].module_code + "'>" + result[i].module_code + " : " + result[i].module_title + "</option>");
                     }
                     getLectureName();
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
                 height: 800,
                 width: 900,
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
             var isWheelchair = parseInt(document.getElementById("wheelchair2").value);
             var isVisualiser = parseInt(document.getElementById("visualiser2").value);
             var isProjector = parseInt(document.getElementById("projector2").value);
             var isWhiteboard = parseInt(document.getElementById("whiteboard2").value);
             var computer = parseInt(document.getElementById("computer2").value);
             var capture = parseInt(document.getElementById("capture2").value);
             var pa = parseInt(document.getElementById("pa2").value);
             var mic = parseInt(document.getElementById("mic2").value);
             var video = parseInt(document.getElementById("video2").value);
             var arrangement = document.getElementById("arrangement2").value;
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
         function resetForm() {
             $("#facility-text").empty();
         }
         function resetTable() {
             for (var i = 1; i <= 10; i++) {
                 $("#p" + i + "_mon").html("<input type='button' id='p" + i + "_mon_select' onclick='showBookDialog(this.id)' value='select'/>");
                 $("#p" + i + "_tue").html("<input type='button' id='p" + i + "_tue_select' onclick='showBookDialog(this.id)' value='select' />");
                 $("#p" + i + "_wed").html("<input type='button' id='p" + i + "_wed_select' onclick='showBookDialog(this.id)' value='select' />");
                 $("#p" + i + "_thu").html("<input type='button' id='p" + i + "_thu_select' onclick='showBookDialog(this.id)' value='select' />");
                 $("#p" + i + "_fri").html("<input type='button' id='p" + i + "_fri_select' onclick='showBookDialog(this.id)' value='select' />");
             }
         }
         function showBookDialog(el) {
             $("#arrangement-text").html($("#arrangement2").val());
             $("#capacity-text").html($("#capacity2").val());
             if ($("#wheelchair2").val() == 1)
                 $("#facility-text").append("<li>Wheelchair</li>");
             if ($("#projector2").val() == 1)
                 $("#facility-text").append("<li>Projector</li>");
             if ($("#whiteboard2").val() == 1)
                 $("#facility-text").append("<li>Whiteboard</li>");
             if ($("#visualiser2").val() == 1)
                 $("#facility-text").append("<li>Visualiser</li>");
             if ($("#computer2").val() == 1)
                 $("#facility-text").append("<li>Computer</li>");
             if ($("#capture2").val() == 1)
                 $("#facility-text").append("<li>Lecture Capture</li>");
             if ($("#pa2").val() == 1)
                 $("#facility-text").append("<li>PA System</li>");
             if ($("#video2").val() == 1)
                 $("#facility-text").append("<li>Video/DVD</li>");
             if ($("#mic2").val() == 1)
                 $("#facility-text").append("<li>Radio Microphone</li>");
             $("#park-text").html(document.getElementById("park-select").value);
             $("#room-text").html(document.getElementById("room-select").value);
             console.log(el.substr(3, 3));
             if (el.substr(3, 3) == "mon") {
                 $("#day-text").html("Monday");
                 $("#day").val("Monday");
             }
             if (el.substr(3, 3) == "tue") {
                 $("#day-text").html("Tuesday");
                 $("#day").val("Tuesday");
             }
             if (el.substr(3, 3) == "wed") {
                 $("#day-text").html("Wednesday");
                 $("#day").val("Wednesday");
             }
             if (el.substr(3, 3) == "thu") {
                 $("#day-text").html("Thursday");
                 $("#day").val("Thursday");
             }
             if (el.substr(3, 3) == "fri") {
                 $("#day-text").html("Friday");
                 $("#day").val("Friday");
             }
             $("#period-text").html(el.substr(1, 1));
             $("#period").val(el.substr(1, 1));
             $("#week-text").html($("#week-select").val());
             $("#dialog-request").dialog("open");
         }
         function insertRequestAjax() {
             var request = {};
             request.module = $("#module").val();
             request.room_code1 = $("#room-select").val();
             request.capacity1 = $("#capacity2").val();
             request.wheelchair = $("#wheelchair2").val();
             request.projector = $("#projector2").val();
             request.visualiser = $("#visualiser2").val();
             request.whiteboard = $("#whiteboard2").val();
             request.computer = $("#computer2").val();
             request.lecture_capture = $("#capture2").val();
             request.video_dvd = $("#video2").val();
             request.pa_system = $("#pa2").val();
             request.radio_microphone = $("#mic2").val();
             request.arrangement = $("#arrangement2").val();
             request.special_req1 = $("#extra_req").val();
             request.priority = $("#priority").val();
             request.day = $("#day").val();
             request.period = $("#period").val();
             request.duration = $("#duration").val();
             request.status = "Booked";
             request.year = "2015";
             request.semester = $("#semester").val();
             request.lecturer = $("#lecturer").val();
             request.session = $("#session").val();
             request.park = $("#park-select").val();
             request.week1 = $("#week-select").val();
             $.ajax(
                 {
                     type: "POST",
                     async: true,
                     url: "Availibility.aspx/insertRequest",
                     data: "{request: " + JSON.stringify(request) + "}",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (data) {
                         alert("Booking submitted");
                         getBookingAjax();
                         $('#dialog-request').dialog('close')
                     },
                     error: function (response) {
                         console.log(response);
                     }
                 });
         }
         function getLectureName() {
             for (var k = 0; k < moduleData.length; k++) {
                 if (document.getElementById("module").value == moduleData[k].module_code) {
                     document.getElementById("lecturer").value = moduleData[k].lecturer;
                 }
             }
         }
    </script>


</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Ad-Hoc</h1>
</asp:Content>

<%-- Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    Facility: <table>
                            <tr>
                                <%--Facility options 2--%>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-computer2">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer2" name="computer2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-capture2">
                                        <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                    </ol>
                                    <input type="hidden" id="capture2" name="capture2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-pa2">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa2" name="pa2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector2">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector2" name="projector2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-mic2">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic2" name="mic2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video2">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video2" name="video2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-visualiser2">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser2" name="visualiser2" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard2">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard2" name="whiteboard2" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <ol id="selectable-wheelchair2">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair2" name="wheelchair2" value="0" />
                                </td>
                            </tr>
                        </table><br />
    Arrangement:  <ol id="selectable-arrangement2">
                            <li class="ui-state-default ui-selected" style="width: 200px">Any</li>
                            <li class="ui-state-default" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                </ol><br /><br /><br /><br /><br /><br />
                        <input type="hidden" id="arrangement2" name="arrangement2" value="Any" />
    Park: <select id="park-select" onchange="changePark2()">
            <option>Any</option>
            <option>Central</option>
            <option>East</option>
            <option>West</option>
          </select>&nbsp;
    Building: <select id="building-select" onchange="changeRoom2()">

              </select>&nbsp;
    Room: <select id="room-select" onchange="selectChange()">

          </select><br />
    <table><tr><td align="left">
     Capacity:</td></tr>
        <tr><td style="padding-left:15px"><div id="slider-capacity2"></div></td><td><input type="text" id="capacity2" name="capacity2" readonly="readonly" style="border:0; color:#CA006A; background-color:white; font-weight:bold; text-align:center;"/></td></tr></table>
    <br />
    <table frame="box" style="width:100%;" align "center" class="testTable" id="Reject">
    Week: <select id="week-select" onchange="selectChange()">
                
          </select>
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
			        <td class="day" style="background-color:#f1f1f1;" >Monday</td>
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
        <table><tr><td align="left">
        Priority:</td></tr> 
            <tr><td><ol id="selectable-priority">
                        <li class="ui-state-default" style="width: 80px">Priority</li>
                  </ol><input type="hidden" id="priority" value="0"/></td></tr></table>
        Module: <select id="module" onchange="getLectureName()" onload="getLectureName()">
                    
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
        Lecturer: <input type="text" id="lecturer" name="lecturer" readonly/><br /><br />
        Arrangement:&nbsp;<b id="arrangement-text"></b> <br /><br />
        Capacity:&nbsp;<b id="capacity-text"></b><br /><br />
        
        Facility:&nbsp;<ol id="facility-text"></ol>
        <table>
            <tr>
                <td>Park:</td><td><b id="park-text"></b>
                </td>
            </tr>
            <tr>
                <td>
                    Room:</td><td><b id="room-text"></b>
                </td>
            </tr>
        </table><br />
        Additional Requiements: <textarea id="extra_req" style="width:835px;" cols="80" maxlength="1000">

                                </textarea><br />
        Day:&nbsp;<b id="day-text"></b>
            <input type="hidden" id="day" name="day" value=""/><br />
        <table>
            <tr>
                <td>
                    Semester:</td><td><select id="semester">
                                <option>1</option>
                                <option>2</option>
                              </select>
                </td>
                </tr><tr>
                <td>
                    Period:</td><td><b id="period-text"></b>
                    <input type="hidden" id="period" />
                </td>
                    </tr><tr>
                <td>
                    Duration:</td><td><select id="duration">

                              </select>
                </td>
            </tr>
        </table><br />
        Week:&nbsp;<b id="week-text"></b><br />
        <input type="button" id="request-submit" value="Submit" class="btns" onclick="insertRequestAjax()" />&nbsp
        <input type="button" id="cancel" class="btns" value="cancel" onclick="$('#dialog-request').dialog('close')" />
    </div>
</asp:Content>
