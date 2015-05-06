<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="Team11.AdminPage" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Admin page CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/AdminPage.css"/>  
    
    <script type="text/javascript">
        $(document).ready(function () {
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
            $("#slider-capacity2").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity2").val(ui.value);
                }
            });
            //put the slider value into text box with id 'capacity'
            $("#capacity2").val($("#slider-capacity").slider("value"));
            $("#tabs").tabs();
            getRequestAjax();
            initFacilityDialog();
            getRoundAjax();
            getRoomAjax();
            getBuildingAjax();
            initRoomDialog();
            initAddRoomDialog();
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
            //start selectable
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
            }).selectable();
            //add new room selectable
            $("#selectable-arrangement2").selectable({
                stop: function () {
                    $(".ui-selected", this).each(function () {
                        var index = $("#selectable-arrangement2 li").index(this);
                        switch (index) {
                            case 0:
                                $("#arrangement2").val("Tiered");
                                break;
                            case 1:
                                $("#arrangement2").val("Flat");
                                break;
                        }
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
            }).selectable();
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
        var requestData;
        var currentRow;
        var roundData;
        var roomData;
        var buildingData;
        var currentRoom = 0;
        function filterChange() {
            var buildingOption = $("#building_filter").val();
            var building = buildingOption.substr((buildingOption.indexOf(":") + 2));
            var park = $("#park_filter").val();
            $("#accordion").remove();
            $("#room-tabs").append("<div id='accordion'>");
            for (var i = 0; i < roomData.length; i++) {
                if ((park == "Any" || roomData[i].park == park) && (buildingOption == "Any" || roomData[i].building_name == building)) {
                    $("#accordion").append("<h3>" + roomData[i].room_code + "</h3>");
                    $("#accordion").append("<div id='" + roomData[i].room_code + "'>Room: " + roomData[i].room_code + "<br />"
                    + "Building: " + roomData[i].building_name + "<br />" + "Park: " + roomData[i].park + "<br />" + "Capacity: " +
                    roomData[i].capacity + "<br /><input type='button' class='btns' id='edit" + (i + 1) + "' onclick='showRoomDialog(this)' value='Edit' />"
                    + "<input type='button' class='btns' id='delete" + (i + 1) + "' onclick='deleteRoomAjax(this)' value='Delete' />" + "<br /></div>");
                }
            }
            $("#accordion").accordion({
                collapsible: true,
                heightStyle: "content"
            });
            $("#room-tabs").append("</div>");
        }
        //allow user to edit pool room
        function showRoomDialog(room) {
            var room_code = $(room).closest("div").attr("id");
            $("#roomCode_edit").html("Room Code: " + room_code);
            $("#roomCode_val").val(room_code);
            resetFacility();
            var capacity;
            for (var i = 0; i < roomData.length; i++) {
                if (roomData[i].room_code == room_code) {
                    capacity = roomData[i].capacity;
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
                    if (roomData[i].wheelchair == 1) {
                        $("#wheelchair").val("1");
                        $("#selectable-wheelchair").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].projector == 1) {
                        $("#projector").val("1");
                        $("#selectable-projector").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].whiteboard == 1) {
                        $("#whiteboard").val("1");
                        $("#selectable-whiteboard").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].visualiser == 1) {
                        $("#visualiser").val("1");
                        $("#selectable-visualiser").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].computer == 1) {
                        $("#computer").val("1");
                        $("#selectable-computer").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].lecture_capture == 1) {
                        $("#capture").val("1");
                        $("#selectable-capture").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].pa_system == 1) {
                        $("#pa").val("1");
                        $("#selectable-pa").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].radio_microphone == 1) {
                        $("#mic").val("1");
                        $("#selectable-mic").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    if (roomData[i].video_dvd == 1) {
                        $("#video").val("1");
                        $("#selectable-video").children("li").attr("class", "ui-state-default ui-selected");
                    }
                }
            }
            $("#dialog-room").dialog("open");
        }
        function showAddRoomDialog() {
            $("#dialog-add-room").dialog("open");
        }
        function resetFacility() {
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
        }
        //start ajax
        //delete a pool room
        function deleteRoomAjax(room) {
            var code = $(room).closest("div").attr("id");
            var room = {};
            room.room_code = code;
            console.log(code);
            console.log(room);
            if (confirm("Are you sure you want to delete this room?")) {
                $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "AdminPage.aspx/deleteRoom",
                    //send room_code of selected room to process in the codebehind environment
                    data: "{room: " + JSON.stringify(room) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("success");
                        getRoomAjax();
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
            }
        }
        //add pool room
        function insertRoomAjax() {
            var room = {};
            //get user input value
            var buildingSelect = document.getElementById("building_add").value;
            var building = buildingSelect.substr(0, 1);
            var roomCode = document.getElementById("building_part").value + "." + document.getElementById("floor_part").value + "." + document.getElementById("room_part").value;
            var capacity = $("#capacity2").val();
            var wheelchair = $("#wheelchair2").val();
            var visualiser = $("#visualiser2").val();
            var projector = $("#projector2").val();
            var whiteboard = $("#whiteboard2").val();
            var computer = $("#computer2").val();
            var capture = $("#capture2").val();
            var pa = $("#pa2").val();
            var mic = $("#mic2").val();
            var video = $("#video2").val();

            var tiered
            var flat 
            if (document.getElementById("arrangement2").value == "Tiered") {
                tiered = 1;
                flat = 0;
            }
            else {
                tiered = 0;
                flat = 1;
            }
            room.building_code = building;
            room.room_code = roomCode;
            room.capacity = capacity;
            room.wheelchair = wheelchair;
            room.projector = projector;
            room.visualiser = visualiser;
            room.whiteboard = whiteboard;
            room.computer = computer;
            room.lecture_capture = capture;
            room.video_dvd = video;
            room.pa_system = pa;
            room.radio_microphone = mic;
            room.tiered = tiered;
            room.flat = flat;
            room.dept = "pool";
            if (confirm("Are you sure you want to add this room?")) {
                $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "AdminPage.aspx/insertRoom",
                    data: "{room: " + JSON.stringify(room) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("success");
                        getRoomAjax();
                        $("#dialog-add-room").dialog("close");
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
            }
            else
                return false;
        }
        //edit pool room
        function updateRoomAjax() {
            console.log($("#roomCode_val").val());
            console.log($("#wheelchair").val());
            console.log($("#visualiser").val());
            console.log($("#projector").val());
            console.log($("#whiteboard").val());
            var room = {};
            //get user input value
            var capacity = $("#capacity1").val();
            var wheelchair = $("#wheelchair").val();
            var visualiser = $("#visualiser").val();
            var projector = $("#projector").val();
            var whiteboard = $("#whiteboard").val();
            var computer = $("#computer").val();
            var capture = $("#capture").val();
            var pa = $("#pa").val();
            var mic = $("#mic").val();
            var video = $("#video").val();

            room.room_code = $("#roomCode_val").val();
            room.capacity = capacity;
            room.wheelchair = wheelchair;
            room.projector = projector;
            room.visualiser = visualiser;
            room.whiteboard = whiteboard;
            room.computer = computer;
            room.lecture_capture = capture;
            room.video_dvd = video;
            room.pa_system = pa;
            room.radio_microphone = mic;
            var id = $("#roomCode_val").val() + "Index"
            currentRoom = document.getElementById(id).value;
            console.log(currentRoom);
            if (confirm("Are you sure you want to edit this room?")) {
                $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "AdminPage.aspx/updateRoom",
                    data: "{room: " + JSON.stringify(room) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("success");
                        getRoomAjax();
                        $("#dialog-room").dialog("close");
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
            }
            else
                return false;
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
                    for (var i = 0; i < buildingData.length; i++) {
                        $("#building_filter").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                        $("#building_add").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
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
                    $("#accordion").remove();
                    $("#room-tabs").append("<div id='accordion'>");
                    for (var i = 0; i < roomData.length;i++){
                        $("#accordion").append("<h3>" + roomData[i].room_code + "</h3>");
                        $("#accordion").append("<div id='" + roomData[i].room_code + "'>Room: " + roomData[i].room_code + "<input type='hidden' id='" + roomData[i].room_code + "Index' value='" + i + "' />" + "<br />"
                        + "Building: " + roomData[i].building_name + "<br />" + "Park: " + roomData[i].park + "<br />" + "Capacity: " +
                        roomData[i].capacity + "<br /><input type='button' class='btns' id='edit" + (i + 1) + "' onclick='showRoomDialog(this)' value='Edit' />"
                        + "<input type='button' class='btns' id='delete" + (i + 1) + "' onclick='deleteRoomAjax(this)' value='Delete' />" + "<br /></div>");
                    }
                    var active;
                    if (currentRoom == "")
                        active = 0;
                    else
                        active = parseInt(currentRoom);
                    console.log(currentRoom);
                    $("#accordion").accordion({
                        collapsible: true,
                        heightStyle: "content",
                        active: parseInt(currentRoom)
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
                            $("#RoomAllocations").append("<tr id='" + (i + 1) + "'>");
                           // $(id).append("<td>" + requestData[i].request_id + "</td>");
                            $(id).append("<td>" + requestData[i].dept_code + "<input type='hidden' id='row" + (i + 1) + "' value='" + requestData[i].request_id + "' />" + "</td>");
                            $(id).append("<td>" + requestData[i].module + "</td>");
                            $(id).append("<td>" + requestData[i].room_code + "</td>");
                            $(id).append("<td>" + requestData[i].capacity + "</td>");
                            $(id).append("<td><input id='facility-" + requestData[i].request_id + "' type='button' class='btnsTa' value='Show' onclick='showFacilityDialog(this)' /></td>");
                            $(id).append("<td>" + requestData[i].special_req + "</td>");
                            $(id).append("<td>" + requestData[i].priority + "</td>");
                            $(id).append("<td>" + requestData[i].day + "</td>");
                            $(id).append("<td>" + requestData[i].period + "</td>");
                            $(id).append("<td>" + requestData[i].duration + "</td>");
                            $(id).append("<td>" + "Weeks" + "</td>");
                            $(id).append("<td>" + requestData[i].semester + "</td>");
                            $(id).append("<td>" + requestData[i].session + "</td>");
                            $(id).append("<td><input id='allocate-" + requestData[i].request_id + "' type='button' class='btns' value='Allocate' onclick='allocateAjax(this)' /><br/>" + "<input id='reject-" + requestData[i].request_id + "' type='button' class='btns' value='Reject' onclick='rejectAjax(this)' /></td>");
                            $("#RoomAllocations").append("</tr>");
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
        function initAddRoomDialog() {
            $("#dialog-add-room").dialog({
                height: 500,
                width: 700,
                position: {
                    my: "center",
                    at: "center",
                    of: window
                }
            });
            $("#dialog-add-room").dialog("close");
        }
        function initRoomDialog() {
            $("#dialog-room").dialog({
                height: 500,
                width: 700,
                position: {
                    my: "center",
                    at: "center",
                    of: window
                }
            });
            $("#dialog-room").dialog("close");
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
        function fillBuildingPart() {
            var buildingSelect = document.getElementById("building_add").value;
            var building = buildingSelect.substring(0, buildingSelect.indexOf(":") - 1);
            $("#building_part").val(building);
        }
    </script>
   
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Admin Page</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
            });
            </script>




    <%-- Tabs containing different admin functionality --%>
    <div class="tabs">
      <ul class="tab-links">
        <li class="active"><a href="#allocation-tabs">Room Allocation</a></li>
        <li><a href="#facility-tabs">Facility Management</a></li>
        <li><a href="#round-tabs">Round Dates</a></li>
        <li><a href="#room-tabs">Room Management</a></li>
      </ul>

  <div class="tab-content">
      <div id="allocation-tabs" class="tab active">
        <%-- These allow us to see table head and use filter when scrolling down the page --%>
        <h2>Room Allocation</h2>
        <div id="table_header">
            <table class="scrollTable">
	            <tr>
                        <td>Dept</td>
			            <td>Module <br /> Code</td>
			            <td>Room Code</td>
			            <td>Capacity</td>
                        <td>Facility</td>
			            <td style="cursor:default; font-size:0.8em; font-weight:bold;">Special <br/>Req</td>
			            <td>Priority</td>
			            <td>Day</td>
			            <td>Period</td>
			            <td>Duration</td>
			            <td style="cursor:default;">Week(s)</td>
                        <td>Semester</td>
                        <td>Session Type</td>
                        <td style="cursor:default;">Action</td>
                    </tr>
	            </table>
            </div>

            <div class="content_wrap">
                <table id="RoomAllocations" class="dataTable">
                </table>
            </div>
           </div>

           <%-- dialog displaying list of facilities specified by timetablers--%>
            <div id="dialog-facility" >
                <ul id="facility_list" >
                </ul>
                </div>

                <div id="facility-tabs" class="tab">
                   <div class="content_wrap">
                      <h2>Facility Management</h2>
                      <table>
                            <tr>
                                <td>Add New Facility:</td>
                                <td><input type="text" id="facName" name="facName"/></td>
                            </tr>
                            <tr>
                                <td colspan='2' align='right'>
                                    <input type="button" id="Button1" name="save_round" value="Submit" class="btns" onclick="" /></td>
                            </tr>
                      </table>
                   </div>
                </div>
                


          <div id="round-tabs" class="tab">
            <div class="content_wrap">
            <h2>Round dates</h2>
            <table>
            <tr>
            <td>Round 1: <label for="from">From</label></td>
            <td><input type="text" id="from1" name="from1"/></td>
            <td><label for="to">to</label></td>
            <td><input type="text" id="to1" name="to1"/></td>
            </tr><tr>
            <td>Round 2: <label for="from">From</label></td>
            <td><input type="text" id="from2" name="from2"/></td>
            <td><label for="to">to</label></td>
            <td><input type="text" id="to2" name="to2"/></td>
            </tr><tr>
            <td>Round 3: <label for="from">From</label></td>
            <td><input type="text" id="from3" name="from3"/></td>
            <td><label for="to">to</label></td>
            <td><input type="text" id="to3" name="to3"/></td>
            </tr><tr>
            <td colspan='4' align='right'><input type="button" id="save_round" name="save_round" value="Submit" class="btns" onclick="updateRoundAjax()" /></td>
            </tr>
            </table>
          </div>
                </div>
          <div id="room-tabs" class="tab">
            <h2>Room Management</h2>
              <div class="content_wrap">
                  <br />
                  Park: <select id="park_filter" onchange="filterChange()">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>    
                            <option>West</option>                 
                        </select>&nbsp;
                  Building: <select id="building_filter" onchange="filterChange()">
                                <option>Any</option>
                            </select>&nbsp;
                  <input type="button" id="room-insert" value="Add Room" class="btns" onclick="showAddRoomDialog()" style="width:auto" />
              </div>
              <div id="accordion">
                
              </div>
              <div id="dialog-add-room" title="Add New Room">
                  Building: <select id="building_add" onchange="fillBuildingPart()">

                            </select><br />
                  Room Code: <input type="text" readonly="readonly" id="building_part" value="A" />.
                  <select id="floor_part">
                      <option>0</option>
                      <option>1</option>
                      <option>2</option>
                  </select>.
                  <input type="text" id="room_part" /><br />
                  Arrangement: <table>
                                    <tr>
                                        <td>
                                            <ol id="selectable-arrangement2">
                                                <li class="ui-state-default" style="width: 200px">Tiered</li>
                                                <li class="ui-state-default" style="width: 200px">Flat</li>
                                            </ol>
                                            <input type="hidden" id="arrangement2" name="arrangement2" value="Any" />
                                        </td>
                                    </tr>
                               </table>
                  Capacity: <div id="slider-capacity2"></div> &nbsp; <input type="text" id="capacity2" name="capacity2" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/><br />
                  Facility: <table>
                    <tr>
                        <td>
                            <ol id="selectable-computer2">
                                <li class="ui-state-default" style="width: 200px">Computer</li>
                            </ol>
                            <input type="hidden" id="computer2" name="computer2" value="0"/>
                        </td>
                        <td>
                                <ol id="selectable-capture2">
                                    <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                </ol>
                                <input type="hidden" id="capture2" name="capture2" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                        <td>
                            <ol id="selectable-mic2">
                                <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                            </ol>
                            <input type="hidden" id="mic2" name="mic" value="0" />
                        </td>
                        <td>
                            <ol id="selectable-video2">
                                <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                            </ol>
                            <input type="hidden" id="video2" name="video" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ol id="selectable-visualiser2">
                                <li class="ui-state-default" style="width: 200px">Visualiser</li>
                            </ol>
                            <input type="hidden" id="visualiser2" name="visualiser" value="0" />
                        </td>
                        <td>
                            <ol id="selectable-whiteboard2">
                                <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                            </ol>
                            <input type="hidden" id="whiteboard2" name="whiteboard" value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <ol id="selectable-wheelchair2">
                                <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                            </ol>
                            <input type="hidden" id="wheelchair2" name="wheelchair" value="0" />
                        </td>
                    </tr>
                </table><br />
                <input type="button" id="add_room_submit" value="Submit" class="btns" onclick="insertRoomAjax()" />
              </div>

              <div id="dialog-room" title="Pool Room Management">
                 <div id="roomCode_edit">
                        Room Code:        
                 </div><br />
                <input type="hidden" id="roomCode_val" />
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
                <input type="button" id="room-submit" value="Submit" class="btns" onclick="updateRoomAjax()" />
              </div>
             </div>
          </div>
        </div> 

</asp:Content>
