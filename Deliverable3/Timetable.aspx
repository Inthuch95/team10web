<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="Team11.Timetable" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ViewRequestGrid.css"/>  
    <script type="text/javascript">
        $(document).ready(function () {
            getRequestAjax();
            initRequestDialog();
            initRequestDialog();
            loadDuration();
            loadPeriod();
            getModuleAjax();
            getRoomAjax();
            getBuildingAjax();
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
        function deleteRequestAjax(id) {
            var request = {};
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
                        alert("deleted");
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
            $.ajax(
                {
                    type: "POST",
                    async: true,
                    url: "ViewRequest.aspx/updateRequest",
                    data: "{request: " + JSON.stringify(request) + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        alert("success");
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
                            var e = document.getElementById("lecturer");
                            var strUser = e.options[e.selectedIndex].value;
                            if (requestData[i].lecturer == strUser) {
                                var id = "p" + requestData[i].period + "_" + requestData[i].day.substr(0, 3).toLowerCase() + "_" + requestData[i].status;
                                var id2 = "#p" + requestData[i].period + "_" + requestData[i].day.substr(0, 3).toLowerCase() + "_" + requestData[i].status;
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
        function showEditDialog(id) {
            resetForm();
            var currentId = id;

            for (var i = 0; i < requestData.length; i++) {
                if (requestData[i].request_id == currentId) {
                    request_id = requestData[i].request_id;
                    $("#module").val(requestData[i].module);
                    $("#request_id").val(currentId);
                    $("#priority").val(requestData[i].priority);
                    resetForm();
                    if (parseInt(requestData[i].priority) == 1) {
                        $("#selectable-priority").children("li").attr("class", "ui-state-default ui-selected");
                    }
                    else {
                        $("#selectable-priority").children("li").attr("class", "ui-state-default");
                    }
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
        function clearTable() {
            for (var i = 1; i <= 10; i++) {
                $("#p" + i + "_mon_Rejected").empty();
                $("#p" + i + "_tue_Rejected").empty();
                $("#p" + i + "_wed_Rejected").empty();
                $("#p" + i + "_thu_Rejected").empty();
                $("#p" + i + "_fri_Rejected").empty();
                $("#p" + i + "_mon_Booked").empty();
                $("#p" + i + "_tue_Booked").empty();
                $("#p" + i + "_wed_Booked").empty();
                $("#p" + i + "_thu_Booked").empty();
                $("#p" + i + "_fri_Booked").empty();
                $("#p" + i + "_mon_Pending").empty();
                $("#p" + i + "_tue_Pending").empty();
                $("#p" + i + "_wed_Pending").empty();
                $("#p" + i + "_thu_Pending").empty();
                $("#p" + i + "_fri_Pending").empty();
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

        function selectedLecturer() {



        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    <h1>Timetable</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div class="tabs">
    <select id="lecturer" name="lecturer" onchange="selectedLecturer()"></select>

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
			        <td id="Td51"></td>
			        <td id="Td52"></td>
			        <td id="Td53"></td>
			        <td id="Td54"></td>
			        <td id="Td55"></td>
			        <td id="Td56"></td>
			        <td id="Td57"></td>
			        <td id="Td58"></td>
			        <td id="Td59"></td>	
			        <td id="Td60"></td>
		        </tr>
		        <tr id="Tr15">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="Td61"></td>
			        <td id="Td62"></td>
			        <td id="Td63"></td>
			        <td id="Td64"></td>
			        <td id="Td65"></td>
			        <td id="Td66"></td>
			        <td id="Td67"></td>
			        <td id="Td68"></td>
			        <td id="Td69"></td>
			        <td id="Td70"></td>			
		        </tr>
		        <tr id="Tr16">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="Td71"></td>
			        <td id="Td72"></td>
			        <td id="Td73"></td>
			        <td id="Td74"></td>
			        <td id="Td75"></td>
			        <td id="Td76"></td>
			        <td id="Td77"></td>
			        <td id="Td78"></td>
			        <td id="Td79"></td>	
			        <td id="Td80"></td>
		        </tr>
		        <tr id="Tr17">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="Td81"></td>
			        <td id="Td82"></td>
			        <td id="Td83"></td>
			        <td id="Td84"></td>
			        <td id="Td85"></td>
			        <td id="Td86"></td>
			        <td id="Td87"></td>
			        <td id="Td88"></td>
			        <td id="Td89"></td>
			        <td id="Td90"></td>			
		        </tr>
		        <tr id="Tr18">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="Td91"></td>
			        <td id="Td92"></td>
			        <td id="Td93"></td>
			        <td id="Td94"></td>
			        <td id="Td95"></td>
			        <td id="Td96"></td>
			        <td id="Td97"></td>
			        <td id="Td98"></td>
			        <td id="Td99"></td>
			        <td id="Td100"></td>			
		        </tr>
		        </div>
            </table>
        </div>
</asp:Content>
