<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="Team11.ViewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ViewRequest.css"/>  
   
    <script type="text/javascript">
     $(document).ready(function () {
         getRequestAjax();
         initFacilityDialog();
         initSpecialDialog();
         initRequestDialog();
         loadDuration();
         loadPeriod();
         getModuleAjax();
         getRoomAjax();
         getBuildingAjax();
         initWeekDialog();
         
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
         //end selectable
     });
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
     var selectedPriority = false;
     var requestData;
     var buildingData;
     var weekData;
     var roomData;
     //start sort function
     //requestData.sort(function (a, b) {
     //    return a.room_code > b.room_code;
     //});
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
                 + "</td>" + "<td>" + requestData[i].capacity + "</td>" + "<td>" + " <button type='button' class='btnsTa' onclick='showFacilityDialog(this)'>show</button> " + "</td>"
                 + "<td>" + "<button type='button' class='btnsTa' onclick='showSpecialDialog(this)'>show</button>" + "</td>" + "<td>" + requestData[i].priority + "</td>"
                 + "<td>" + requestData[i].day + "</td>" + "<td>" + requestData[i].period + "</td>" + "<td>" + requestData[i].duration + "</td>"
                 + "<td>" + "<button type='button' class='btnsTa'>show</button>" + "</td>");
             if (requestData[i].status == "Pending" || requestData[i].status == "Booked") {
                 $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='showEditDialog(this)' class='btns'>Edit</button><br /><button type='button' onclick='deleteRequestAjax(this)' class='btns'>Delete</button>"
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
    //end sort function
        //start ajax
     function getWeekAjax() {
         var request = {};
         request.request_id = $("#request_id").val();
         $.ajax(
            {
                type: "POST",
                async: true,
                url: "ViewRequest.aspx/getWeek",
                data: "{request: " + JSON.stringify(request) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    weekData = data.d;

                    console.log(weekData);
                    for (var i = 0; i < weekData.length; i++) {
                        $("#week" + weekData[i].week2).prop("checked", "true");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
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
                 $("#module").empty();
                 for (var i = 0; i < result.length; i++) {
                     //populate module drop down list
                     $("#module").append("<option value='" + result[i].module_code + "'>" + result[i].module_code + " : " + result[i].module_title + "</option>");
                 }
                 console.log($("#module").val());
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
                 changeRoom();
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
                 $("#building").append("<option value='Any'>Any</option>");
                 for (var i = 0; i < buildingData.length; i++) {
                     $("#building").append("<option value='" + buildingData[i].building_code + "'>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                 }
             },
             error: function (response) {
                 console.log(response);
             }
         });
     }
     function deleteRequestAjax(el) {
         var request = {};
         var id = el.parentNode.parentNode.cells[0].textContent;
         var request_id = parseInt(id);
         request.request_id = request_id;
         $.ajax(
             {
                 type: "POST",
                 async: true,
                 url: "ViewRequest.aspx/deleteRequest",
                 data: "{request: " + JSON.stringify(request) + "}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (data) {
                     alert("Request deleted");
                     getRequestAjax();
                 },
                 error: function (response) {
                     console.log(response);
                 }
             });
     }
     //edit request data in database
     function updateRequestAjax() {
         var request = {};
         for (var i = 1; i <= 16; i++) {
             if ($("#week" + i).prop("checked")) {
                 $("#week" + i + "-check").val(1);
                 console.log($("#week" + i + "-check").val());
             }
             else {
                 $("#week" + i + "-check").val(0);
                 console.log($("#week" + i + "-check").val());
             }
         }
         request.request_id = $("#request_id").val();
         request.module = $("#module").val();
         request.room_code = $("#room").val();
         request.capacity = $("#capacity1").val();
         request.wheelchair = $("#wheelchair").val();
         request.projector = $("#projector").val();
         request.visualiser = $("#visualiser").val();
         request.whiteboard = $("#whiteboard").val();
         request.computer = $("#computer").val();
         request.lecture_capture = $("#capture").val();
         request.video_dvd = $("#video").val();
         request.pa_system = $("#pa").val();
         request.radio_microphone = $("#mic").val();
         request.arrangement = $("#arrangement").val();
         request.special_req = $("#extra_req").val();
         request.priority = $("#priority").val();
         request.day = $("#day").val();
         request.period = $("#period").val();
         request.duration = $("#duration").val();
         request.status = "Pending";
         request.semester = $("#semester").val();
         request.lecturer = $("#lecturer").val();
         request.session = $("#session").val();
         request.park = $("#park").val();
         request.week1 = $("#week1-check").val();
         request.week2 = $("#week2-check").val();
         request.week3 = $("#week3-check").val();
         request.week4 = $("#week4-check").val();
         request.week5 = $("#week5-check").val();
         request.week6 = $("#week6-check").val();
         request.week7 = $("#week7-check").val();
         request.week8 = $("#week8-check").val();
         request.week9 = $("#week9-check").val();
         request.week10 = $("#week10-check").val();
         request.week11 = $("#week11-check").val();
         request.week12 = $("#week12-check").val();
         request.week13 = $("#week13-check").val();
         request.week14 = $("#week14-check").val();
         request.week15 = $("#week15-check").val();
         request.week16 = $("#week16-check").val();
         $.ajax(
             {
                 type: "POST",
                 async: true,
                 url: "ViewRequest.aspx/updateRequest",
                 data: "{request: " + JSON.stringify(request) + "}",
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function (data) {
                     alert("Request updated");
                     getRequestAjax();
                     $('#dialog-request').dialog('close')
                 },
                 error: function (response) {
                     console.log(response);
                 }
             });
     }
     //get all request data into an array
     function getRequestAjax() {
         $("#Pending").empty();
         $("#Booked").empty();
         $("#Rejected").empty();
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
                    for (var i = 0; i < requestData.length; i++) {
                        $("#" + requestData[i].status).append("<tr id='" + requestData[i].request_id + "'>" + "<td>" + requestData[i].request_id + "</td>" + "<td>" + requestData[i].module + "</td>" + "<td>" + requestData[i].room_code
                            + "</td>" + "<td>" + requestData[i].capacity + "</td>" + "<td>" + " <button type='button' class='btnsTa' onclick='showFacilityDialog(this)'>show</button> " + "</td>"
                            + "<td>" + "<button type='button' class='btnsTa' onclick='showSpecialDialog(this)'>show</button>" + "</td>" + "<td>" + requestData[i].priority + "</td>"
                            + "<td>" + requestData[i].day + "</td>" + "<td>" + requestData[i].period + "</td>" + "<td>" + requestData[i].duration + "</td>"
                            + "<td>" + "<button type='button' onclick='showWeekDialog(this)' class='btnsTa'>show</button>" + "</td>");
                        if (requestData[i].status == "Pending" || requestData[i].status == "Booked") {
                            $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='showEditDialog(this)' class='btns'>Edit</button><br /><button type='button' onclick='deleteRequestAjax(this)' class='btns'>Delete</button>"
                            + "</td>");
                            $("#" + requestData[i].status).append("</tr>");
                        }
                        else {
                            $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='resubmitRequestAjax(this)' class='btns'>Resubmit</button><br /><button type='button' onclick='showEditDialog(this)' class='btns'>Edit</button>"
                            + "</td>");
                            $("#" + requestData[i].status).append("</tr>");
                        }
                    }
                 },
                 error: function (response) {
                     console.log(response);
                 }
             });
     }

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
     });
    //end ajax
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
     function showEditDialog(el) {
         var currentRow = el.parentNode.parentNode;
         var currentId = parseInt(el.parentNode.parentNode.cells[0].textContent);
         $("#request_id").val(currentId);
         $("#priority").val(parseInt(currentRow.cells[6].textContent));
         resetForm();
         if (parseInt(currentRow.cells[6].textContent) == 1) {
             $("#selectable-priority").children("li").attr("class", "ui-state-default ui-selected");
         }
         else {
             $("#selectable-priority").children("li").attr("class", "ui-state-default");
         }
         $("#module").val(currentRow.cells[1].textContent);
         for (var i = 0; i < requestData.length; i++) {
             if (requestData[i].request_id == currentId) {
                 switch (requestData[i].session) {
                     case "Lecture":
                         $("#session").val("Lecture");
                         $("#lecture").attr("class", "ui-state-default ui-selected");
                         $("#practical").attr("class", "ui-state-default");
                         $("#tutorial").attr("class", "ui-state-default");
                         $("#seminar").attr("class", "ui-state-default");
                         break;
                     case "Practical":
                         $("#session").val("Practical");
                         $("#practical").attr("class", "ui-state-default ui-selected");
                         $("#tutorial").attr("class", "ui-state-default");
                         $("#seminar").attr("class", "ui-state-default");
                         $("#lecture").attr("class", "ui-state-default");
                         break;
                     case "Tutorial":
                         $("#session").val("Tutorial");
                         $("#tutorial").attr("class", "ui-state-default ui-selected");
                         $("#seminar").attr("class", "ui-state-default");
                         $("#lecture").attr("class", "ui-state-default");
                         $("#practical").attr("class", "ui-state-default");
                         break;
                     case "Seminar":
                         $("#session").val("Seminar");
                         $("#seminar").attr("class", "ui-state-default ui-selected");
                         $("#lecture").attr("class", "ui-state-default");
                         $("#practical").attr("class", "ui-state-default");
                         $("#tutorial").attr("class", "ui-state-default");
                         break;
                 }
                 $("#lecturer").val(requestData[i].lecturer);
                 var capacity = requestData[i].capacity;
                 $("#slider-capacity").slider({
                     range: "max",
                     min: 1,
                     max: 500,
                     value: capacity,
                     step: 1,
                     slide: function (event, ui) {
                         $("#capacity1").val(ui.value);
                     }
                 });
                 //put the slider value into text box with id 'capacity'
                 $("#capacity1").val($("#slider-capacity").slider("value"));
                 if (requestData[i].wheelchair == 1) {
                     $("#wheelchair").val("1");
                     $("#selectable-wheelchair").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].projector == 1) {
                     $("#projector").val("1");
                     $("#selectable-projector").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].whiteboard == 1) {
                     $("#whiteboard").val("1");
                     $("#selectable-whiteboard").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].visualiser == 1) {
                     $("#visualiser").val("1");
                     $("#selectable-visualiser").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].computer == 1) {
                     $("#computer").val("1");
                     $("#selectable-computer").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].lecture_capture == 1) {
                     $("#capture").val("1");
                     $("#selectable-capture").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].pa_system == 1) {
                     $("#pa").val("1");
                     $("#selectable-pa").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].radio_microphone == 1) {
                     $("#mic").val("1");
                     $("#selectable-mic").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 if (requestData[i].video_dvd == 1) {
                     $("#video").val("1");
                     $("#selectable-video").children("li").attr("class", "ui-state-default ui-selected");
                 }
                 $("#park").val(requestData[i].park);
                 changePark();
                 $("#room").val(requestData[i].room_code);
                 $("#extra_req").val(requestData[i].special_req);
                 switch (requestData[i].day) {
                     case "Monday":
                         $("#day").val("Monday");
                         $("#monday").attr("class", "ui-state-default ui-selected");
                         break;
                     case "Tuesday":
                         $("#day").val("Tuesday");
                         $("#tuesday").attr("class", "ui-state-default ui-selected");
                         break;
                     case "Wednesday":
                         $("#day").val("Wednesday");
                         $("#wednesday").attr("class", "ui-state-default ui-selected");
                         break;
                     case "Thursday":
                         $("#day").val("Thursday");
                         $("#thursday").attr("class", "ui-state-default ui-selected");
                         break;
                     case "Friday":
                         $("#day").val("Friday");
                         $("#friday").attr("class", "ui-state-default ui-selected");
                         break;
                 }
                 switch (requestData[i].arrangement) {
                     case "Any":
                         $("#arrangement").val("Any");
                         $("#arr-any").attr("class", "ui-state-default ui-selected");
                         break;
                     case "Tiered":
                         $("#arrangement").val("Tiered");
                         $("#arr-tiered").attr("class", "ui-state-default ui-selected");
                         break;
                     case "Flat":
                         $("#arrangement").val("Flat");
                         $("#arr-flat").attr("class", "ui-state-default ui-selected");
                         break;
                 }
                 $("#day").val(requestData[i].day);
                 $("#period").val(requestData[i].period);
                 $("#semester").val(requestData[i].semester);
                 $("#duration").val(requestData[i].duration);
                 //week
                 getWeekAjax();

             }
         }
         
         $("#dialog-request").dialog("open");
     }
     function resetForm() {
         $("#selectable-priority").children("li").attr("class", "ui-state-default");
         $("#selectable-computer").children("li").attr("class", "ui-state-default");
         $("#selectable-capture").children("li").attr("class", "ui-state-default");
         $("#selectable-pa").children("li").attr("class", "ui-state-default");
         $("#selectable-wheelchair").children("li").attr("class", "ui-state-default");
         $("#selectable-projector").children("li").attr("class", "ui-state-default");
         $("#selectable-visualiser").children("li").attr("class", "ui-state-default");
         $("#selectable-whiteboard").children("li").attr("class", "ui-state-default");
         $("#selectable-mic").children("li").attr("class", "ui-state-default");
         $("#selectable-video").children("li").attr("class", "ui-state-default");
         $("#wheelchair").val("0");
         $("#projector").val("0");
         $("#visualiser").val("0");
         $("#whiteboard").val("0");
         $("#computer").val("0");
         $("#capture").val("0");
         $("#pa").val("0");
         $("#mic").val("0");
         $("#video").val("0");
         $("#arrangement").val("Any");
         $("#monday").attr("class", "ui-state-default");
         $("#tuesday").attr("class", "ui-state-default");
         $("#wednesday").attr("class", "ui-state-default");
         $("#thursday").attr("class", "ui-state-default");
         $("#friday").attr("class", "ui-state-default");
         $("#arr-any").attr("class", "ui-state-default");
         $("#arr-tiered").attr("class", "ui-state-default");
         $("#arr-flat").attr("class", "ui-state-default");
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
    <h1>View Requests</h1>
</asp:Content>

<%-- Page Body Content --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- These allow us to see table head and use filter when scrolling down the page --%>
 <div class="tabs">
    <ul class="tab-links">
        <li class="active"><a href="#rejected">Rejected</a></li>
        <li><a href="#booked">Booked</a></li>
        <li><a href="#pending">Pending</a></li>
    </ul>
    <a href="ViewRequestGrid.aspx"><img border="0" class="grid" alt="gridview" src="Resources/grid.jpg" /></a>
    <div class="tab-content">
        <div id="rejected" class="tab active">
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
			        <td style="cursor:default;">Edit/Delete</td>
                </tr>
	          </table>
            </div> 
            <table id="Rejected" class="dataTable">
            </table>

       </div>
 
        <div id="booked" class="tab">
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
			        <td style="cursor:default;">Edit/Delete</td>
	           </tr>
            </table>
         </div>
           <table id="Booked" class="dataTable">
            </table>
          </div>
 

        <div id="pending" class="tab">
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
			        <td style="cursor:default;">Edit/Delete</td>
	           </tr>
            </table>
          </div>
            <table id="Pending" class="dataTable">
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
                         <input type="hidden" id="week1-check" value="1" />
                        <input type="hidden" id="week2-check" value="1" />
                        <input type="hidden" id="week3-check" value="1" />
                        <input type="hidden" id="week4-check" value="1" />
                        <input type="hidden" id="week5-check" value="1" />
                        <input type="hidden" id="week6-check" value="1" />
                        <input type="hidden" id="week7-check" value="1" />
                        <input type="hidden" id="week8-check" value="1" />
                        <input type="hidden" id="week9-check" value="1" />
                        <input type="hidden" id="week10-check" value="1" />
                        <input type="hidden" id="week11-check" value="1" />
                        <input type="hidden" id="week12-check" value="1" />
                        <input type="hidden" id="week13-check" value="0" />
                        <input type="hidden" id="week14-check" value="0" />
                        <input type="hidden" id="week15-check" value="0" />
                        <input type="hidden" id="week16-check" value="0" />
                    </td>
                </tr>
              </table>
        <input type="button" id="request-submit" value="Submit" class="btns" onclick="updateRequestAjax()" />&nbsp
        <input type="button" id="cancel" class="btns" value="cancel" onclick="$('#dialog-request').dialog('close')" />
    </div>
</asp:Content>