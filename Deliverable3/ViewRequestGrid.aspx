<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRequestGrid.aspx.cs" Inherits="Team11.ViewRequestGrid" %>

<%--Header Content--%>
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
    </script>

</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    <h1>View Requests</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="tabs">
    <ul class="tab-links">
        <li class="active"><a href="#rejected">Rejected</a></li>
        <li><a href="#booked">Booked</a></li>
        <li><a href="#pending">Pending</a></li>
    </ul>
    <button type="button" onclick="decreaseWeek()">-</button><input id="current_week" type="text" name="current_week"  disabled /><button type="button" onclick="increaseWeek()">+</button>
    <div class="tab-content">
        <div id="rejected" class="tab active">
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
			        <td id="p1_mon_Rejected"></td>
			        <td id="p2_mon_Rejected"></td>
			        <td id="p3_mon_Rejected"></td>
			        <td id="p4_mon_Rejected"></td>
			        <td id="p5_mon_Rejected"></td>
			        <td id="p6_mon_Rejected"></td>
			        <td id="p7_mon_Rejected"></td>
			        <td id="p8_mon_Rejected"></td>
			        <td id="p9_mon_Rejected"></td>	
			        <td id="p10_mon_Rejected"></td>
		        </tr>
		        <tr id="Tuesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="p1_tue_Rejected"></td>
			        <td id="p2_tue_Rejected"></td>
			        <td id="p3_tue_Rejected"></td>
			        <td id="p4_tue_Rejected"></td>
			        <td id="p5_tue_Rejected"></td>
			        <td id="p6_tue_Rejected"></td>
			        <td id="p7_tue_Rejected"></td>
			        <td id="p8_tue_Rejected"></td>
			        <td id="p9_tue_Rejected"></td>
			        <td id="p10_tue_Rejected"></td>			
		        </tr>
		        <tr id="Wednesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="p1_wed_Rejected"></td>
			        <td id="p2_wed_Rejected"></td>
			        <td id="p3_wed_Rejected"></td>
			        <td id="p4_wed_Rejected"></td>
			        <td id="p5_wed_Rejected"></td>
			        <td id="p6_wed_Rejected"></td>
			        <td id="p7_wed_Rejected"></td>
			        <td id="p8_wed_Rejected"></td>
			        <td id="p9_wed_Rejected"></td>	
			        <td id="p10_wed_Rejected"></td>
		        </tr>
		        <tr id="Thursday_td">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="p1_thu_Rejected"></td>
			        <td id="p2_thu_Rejected"></td>
			        <td id="p3_thu_Rejected"></td>
			        <td id="p4_thu_Rejected"></td>
			        <td id="p5_thu_Rejected"></td>
			        <td id="p6_thu_Rejected"></td>
			        <td id="p7_thu_Rejected"></td>
			        <td id="p8_thu_Rejected"></td>
			        <td id="p9_thu_Rejected"></td>
			        <td id="p10_thu_Rejected"></td>			
		        </tr>
		        <tr id="Friday_td">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="p1_fri_Rejected"></td>
			        <td id="p2_fri_Rejected"></td>
			        <td id="p3_fri_Rejected"></td>
			        <td id="p4_fri_Rejected"></td>
			        <td id="p5_fri_Rejected"></td>
			        <td id="p6_fri_Rejected"></td>
			        <td id="p7_fri_Rejected"></td>
			        <td id="p8_fri_Rejected"></td>
			        <td id="p9_fri_Rejected"></td>
			        <td id="p10_fri_Rejected"></td>			
		        </tr>
		        </div>
            </table>
        </div>
        <div id="booked" class="tab">
            <table frame="box" style="width:100%;" align "center" class="testTable" id="Booked">
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
			        <td id="p1_mon_Booked"></td>
			        <td id="p2_mon_Booked"></td>
			        <td id="p3_mon_Booked"></td>
			        <td id="p4_mon_Booked"></td>
			        <td id="p5_mon_Booked"></td>
			        <td id="p6_mon_Booked"></td>
			        <td id="p7_mon_Booked"></td>
			        <td id="p8_mon_Booked"></td>
			        <td id="p9_mon_Booked"></td>	
			        <td id="p10_mon_Booked"></td>
		        </tr>
		        <tr id="Tuesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="p1_tue_Booked"></td>
			        <td id="p2_tue_Booked"></td>
			        <td id="p3_tue_Booked"></td>
			        <td id="p4_tue_Booked"></td>
			        <td id="p5_tue_Booked"></td>
			        <td id="p6_tue_Booked"></td>
			        <td id="p7_tue_Booked"></td>
			        <td id="p8_tue_Booked"></td>
			        <td id="p9_tue_Booked"></td>
			        <td id="p10_tue_Booked"></td>			
		        </tr>
		        <tr id="Wednesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="p1_wed_Booked"></td>
			        <td id="p2_wed_Booked"></td>
			        <td id="p3_wed_Booked"></td>
			        <td id="p4_wed_Booked"></td>
			        <td id="p5_wed_Booked"></td>
			        <td id="p6_wed_Booked"></td>
			        <td id="p7_wed_Booked"></td>
			        <td id="p8_wed_Booked"></td>
			        <td id="p9_wed_Booked"></td>	
			        <td id="p10_wed_Booked"></td>
		        </tr>
		        <tr id="Thursday_td">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="p1_thu_Booked"></td>
			        <td id="p2_thu_Booked"></td>
			        <td id="p3_thu_Booked"></td>
			        <td id="p4_thu_Booked"></td>
			        <td id="p5_thu_Booked"></td>
			        <td id="p6_thu_Booked"></td>
			        <td id="p7_thu_Booked"></td>
			        <td id="p8_thu_Booked"></td>
			        <td id="p9_thu_Booked"></td>
			        <td id="p10_thu_Booked"></td>			
		        </tr>
		        <tr id="Friday_td">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="p1_fri_Booked"></td>
			        <td id="p2_fri_Booked"></td>
			        <td id="p3_fri_Booked"></td>
			        <td id="p4_fri_Booked"></td>
			        <td id="p5_fri_Booked"></td>
			        <td id="p6_fri_Booked"></td>
			        <td id="p7_fri_Booked"></td>
			        <td id="p8_fri_Booked"></td>
			        <td id="p9_fri_Booked"></td>
			        <td id="p10_fri_Booked"></td>			
		        </tr>
		        </div>
            </table>
        </div>
        <div id="pending" class="tab">
            <table frame="box" style="width:100%;" align "center" class="testTable" id="Pending">
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
			        <td id="p1_mon_Pending"></td>
			        <td id="p2_mon_Pending"></td>
			        <td id="p3_mon_Pending"></td>
			        <td id="p4_mon_Pending"></td>
			        <td id="p5_mon_Pending"></td>
			        <td id="p6_mon_Pending"></td>
			        <td id="p7_mon_Pending"></td>
			        <td id="p8_mon_Pending"></td>
			        <td id="p9_mon_Pending"></td>	
			        <td id="p10_mon_Pending"></td>
		        </tr>
		        <tr id="Tuesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="p1_tue_Pending"></td>
			        <td id="p2_tue_Pending"></td>
			        <td id="p3_tue_Pending"></td>
			        <td id="p4_tue_Pending"></td>
			        <td id="p5_tue_Pending"></td>
			        <td id="p6_tue_Pending"></td>
			        <td id="p7_tue_Pending"></td>
			        <td id="p8_tue_Pending"></td>
			        <td id="p9_tue_Pending"></td>
			        <td id="p10_tue_Pending"></td>			
		        </tr>
		        <tr id="Wednesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="p1_wed_Pending"></td>
			        <td id="p2_wed_Pending"></td>
			        <td id="p3_wed_Pending"></td>
			        <td id="p4_wed_Pending"></td>
			        <td id="p5_wed_Pending"></td>
			        <td id="p6_wed_Pending"></td>
			        <td id="p7_wed_Pending"></td>
			        <td id="p8_wed_Pending"></td>
			        <td id="p9_wed_Pending"></td>	
			        <td id="p10_wed_Pending"></td>
		        </tr>
		        <tr id="Thursday_td">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="p1_thu_Pending"></td>
			        <td id="p2_thu_Pending"></td>
			        <td id="p3_thu_Pending"></td>
			        <td id="p4_thu_Pending"></td>
			        <td id="p5_thu_Pending"></td>
			        <td id="p6_thu_Pending"></td>
			        <td id="p7_thu_Pending"></td>
			        <td id="p8_thu_Pending"></td>
			        <td id="p9_thu_Pending"></td>
			        <td id="p10_thu_Pending"></td>			
		        </tr>
		        <tr id="Friday_td">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="p1_fri_Pending"></td>
			        <td id="p2_fri_Pending"></td>
			        <td id="p3_fri_Pending"></td>
			        <td id="p4_fri_Pending"></td>
			        <td id="p5_fri_Pending"></td>
			        <td id="p6_fri_Pending"></td>
			        <td id="p7_fri_Pending"></td>
			        <td id="p8_fri_Pending"></td>
			        <td id="p9_fri_Pending"></td>
			        <td id="p10_fri_Pending"></td>			
		        </tr>
		        </div>
            </table>
        </div>
    </div>
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
                    </td>
                </tr>
              </table>
        <input type="button" id="request-submit" value="Submit" class="btns" onclick="updateRequestAjax()" />&nbsp
        <input type="button" id="request-del" value="Delete" class="btns" onclick="deleteRequestAjax(request_id)" />&nbsp
        <input type="button" id="cancel" class="btns" value="cancel" onclick="$('#dialog-request').dialog('close')" />
    </div>
</asp:Content>
