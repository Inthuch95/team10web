<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffTimetable.aspx.cs" Inherits="Team11.StaffTimetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ViewRequestGrid.css"/>  
    <script type="text/javascript">
        $(document).ready(function () {
            getRequestAjax();
            getLecturerAjax();
            $("#current_week").val(1);
            $('.tabs .tab-links a').on('click', function (e) {
                var currentAttrValue = $(this).attr('href');

                // Show/Hide Tabs
                $('.tabs ' + currentAttrValue).show().siblings().hide();

                // Change/remove current tab to active
                $(this).parent('li').addClass('active').siblings().removeClass('active');

                e.preventDefault();
            });
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
        var roomData;
        var request_id;
        function increaseWeek() {
            var currentWeek = parseInt(document.getElementById('current_week').value);
            if (currentWeek != 16) {
                document.getElementById('current_week').value = (currentWeek + 1);
            }
            else {
                $("#current_week").val(1);
            }
        }

        function decreaseWeek() {
            var currentWeek = parseInt(document.getElementById('current_week').value);
            if (currentWeek != 1) {
                document.getElementById('current_week').value = (currentWeek - 1);
            }
            else {
                $("#current_week").val(16);
            }
        }
        //start ajax
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
                        clearTable();
                        for (var i = 0; i < requestData.length; i++) {
                            if ((requestData[i].lecturer == document.getElementById("lecturer").value) && (requestData[i].status == "Booked")) {
                                console.log(requestData[i].lecturer);
                                console.log(document.getElementById("lecturer").value);
                                var id = "p" + requestData[i].period + "_" + requestData[i].day.substr(0, 3).toLowerCase();
                                var id2 = "#p" + requestData[i].period + "_" + requestData[i].day.substr(0, 3).toLowerCase();
                                $(id2).append("<p onclick='showEditDialog(this.id)' " + "id='" + requestData[i].request_id + "'>" + "Module:" + requestData[i].module + "<br />" + "Room: " + requestData[i].room_code + "<input type='hidden' id='" + id + "_id' />"
                                    + "<input type='hidden' id='" + id + "_module' />" + "<input type='hidden' id='" + id + "_priority' />" + "<input type='hidden' id='" + id + "_room' />" + "<input type='hidden' id='" + id + "_capacity' />"
                                    + "<input type='hidden' id='" + id + "_wheelchair' />" + "<input type='hidden' id='" + id + "_projector' />" + "<input type='hidden' id='" + id + "_visualiser' />" + "<input type='hidden' id='" + id
                                    + "_whiteboard' />" + "<input type='hidden' id='" + id + "_computer' />" + "<input type='hidden' id='" + id + "_capture' />" + "<input type='hidden' id='" + id + "_pa' />" + "<input type='hidden' id='" + id
                                    + "_mic' />" + "<input type='hidden' id='" + id + "_video' />" + "<input type='hidden' id='" + id + "_arrangement' />" + "<input type='hidden' id='" + id + "_req' />" + "<input type='hidden' id='" + id
                                    + "_day' />" + "<input type='hidden' id='" + id + "_period' />" + "<input type='hidden' id='" + id + "_duration' />" + "<input type='hidden' id='" + id + "_park' />" + "<input type='hidden' id='" + id
                                    + "_semester' />" + "<input type='hidden' id='" + id + "_lecturer' />" + "<input type='hidden' id='" + id + "_session' />" + "</p>");
                                $(id2 + "_id").val(requestData[i].request_id);
                                $(id2 + "_module").val(requestData[i].module);
                                $(id2 + "_priority").val(requestData[i].priority);
                                $(id2 + "_capacity").val(requestData[i].capacity);
                                $(id2 + "_room").val(requestData[i].room_code);
                                $(id2 + "_wheelchair").val(requestData[i].wheelchair);
                                $(id2 + "_projector").val(requestData[i].projector);
                                $(id2 + "_visualiser").val(requestData[i].visualiser);
                                $(id2 + "_whiteboard").val(requestData[i].whiteboard);
                                $(id2 + "_computer").val(requestData[i].computer);
                                $(id2 + "_capture").val(requestData[i].lecture_capture);
                                $(id2 + "_mic").val(requestData[i].radio_microphone);
                                $(id2 + "_video").val(requestData[i].video_dvd);
                                $(id2 + "_arrangement").val(requestData[i].arrangement);
                                $(id2 + "_day").val(requestData[i].day);
                                $(id2 + "_period").val(requestData[i].period);
                                $(id2 + "_duration").val(requestData[i].duration);
                                $(id2 + "_park").val(requestData[i].park);
                                $(id2 + "_semester").val(requestData[i].semester);
                                $(id2 + "_lecturer").val(requestData[i].lecturer);
                                $(id2 + "_session").val(requestData[i].session);
                            }
                        }
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
        }
        //end ajax
        function clearTable() {
            for (var i = 1; i <= 10; i++) {
                $("#p" + i + "_mon").empty();
                $("#p" + i + "_tue").empty();
                $("#p" + i + "_wed").empty();
                $("#p" + i + "_thu").empty();
                $("#p" + i + "_fri").empty();

            }
        }
        function getLecturerAjax() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "Timetable.aspx/getLecturer",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = data.d;
                    $("#lecturer").empty();
                    for (var i = 0; i < result.length; i++) {
                        //populate Lecturer drop down list
                        if (result[i].name != "") {
                            if (i > 0 && (result[i].name != result[i - 1].name)) {
                                $("#lecturer").append("<option value='" + result[i].name + "'>" + result[i].name + "</option>");
                            } else if (i == 0) {
                                $("#lecturer").append("<option value='" + result[i].name + "'>" + result[i].name + "</option>");
                            }
                        }
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    <h1>Timetable</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="tabs">
    <a href="Timetable.aspx">Change View</a>

    <br />

    <select id="lecturer" name="lecturer" onchange="getRequestAjax();"></select>

    <br />

    <button type="button" onclick="decreaseWeek()">-</button><input id="current_week" type="text" name="current_week" disabled /><button type="button" onclick="increaseWeek()">+</button>

    <div class="tab-content">
        <div id="rejected" class="tab active">
            <table frame="box" style="width:100%;" align="center" class="testTable" id="Table3">
                <br/>
                <div id="Div5">
                
                <tr id="Tr13">
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
	        <div id="Div6">
		        <tr id="Tr14">	
			        <td class="day" style="background-color:#f1f1f1;">Monday</td>
			        <td id="p1_mon"></td>
			        <td id="p2_mon"></td>
			        <td id="p3_mon"></td>
			        <td id="p4_mon"></td>
			        <td id="p5_mon"></td>
			        <td id="p6_mon"></td>
			        <td id="p7_mon"></td>
			        <td id="p8_mon"></td>
			        <td id="p9_mon"></td>	
			        <td id="p10_mon"></td>
		        </tr>
		        <tr id="Tr15">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="p1_tue"></td>
			        <td id="p2_tue"></td>
			        <td id="p3_tue"></td>
			        <td id="p4_tue"></td>
			        <td id="p5_tue"></td>
			        <td id="p6_tue"></td>
			        <td id="p7_tue"></td>
			        <td id="p8_tue"></td>
			        <td id="p9_tue"></td>	
			        <td id="p10_tue"></td>		
		        </tr>
		        <tr id="Tr16">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="p1_wed"></td>
			        <td id="p2_wed"></td>
			        <td id="p3_wed"></td>
			        <td id="p4_wed"></td>
			        <td id="p5_wed"></td>
			        <td id="p6_wed"></td>
			        <td id="p7_wed"></td>
			        <td id="p8_wed"></td>
			        <td id="p9_wed"></td>	
			        <td id="p10_wed"></td>
		        </tr>
		        <tr id="Tr17">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="p1_thu"></td>
			        <td id="p2_thu"></td>
			        <td id="p3_thu"></td>
			        <td id="p4_thu"></td>
			        <td id="p5_thu"></td>
			        <td id="p6_thu"></td>
			        <td id="p7_thu"></td>
			        <td id="p8_thu"></td>
			        <td id="p9_thu"></td>
			        <td id="p10_thu"></td>			
		        </tr>
		        <tr id="Tr18">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="p1_fri"></td>
			        <td id="p2_fri"></td>
			        <td id="p3_fri"></td>
			        <td id="p4_fri"></td>
			        <td id="p5_fri"></td>
			        <td id="p6_fri"></td>
			        <td id="p7_fri"></td>
			        <td id="p8_fri"></td>
			        <td id="p9_fri"></td>
			        <td id="p10_fri"></td>			
		        </tr>
		        </div>
            </table>
        </div>
</asp:Content>
