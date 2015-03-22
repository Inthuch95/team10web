<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Create Request CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/CreateRequest.css" />
    <script type="text/javascript" language="javascript">
        var roomData;
        var buildingData;
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
        //selectable 3
        var selectedWhiteboard3 = false;
        var selectedComputer3 = false;
        var selectedCap3 = false;
        var selectedPa3 = false;
        var selectedProjector3 = false;
        var selectedMic3 = false;
        var selectedVideo3 = false;
        var selectedVisualiser3 = false;
        var selectedWheelchair3 = false;
        //selectable 4
        var selectedWhiteboard4 = false;
        var selectedComputer4 = false;
        var selectedCap4 = false;
        var selectedPa4 = false;
        var selectedProjector4 = false;
        var selectedMic4 = false;
        var selectedVideo4 = false;
        var selectedVisualiser4 = false;
        var selectedWheelchair4 = false;
        //selectable 5
        var selectedWhiteboard5 = false;
        var selectedComputer5 = false;
        var selectedCap5 = false;
        var selectedPa5 = false;
        var selectedProjector5 = false;
        var selectedMic5 = false;
        var selectedVideo5 = false;
        var selectedVisualiser5 = false;
        var selectedWheelchair5 = false;
        $(document).ready(function () {
           //implement jquery ui selectable to facility options 
            //start selectable
            //room preference 1
           $("#selectable-session").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-session li").index(this);
                       switch(index) {
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
                               $("#arrangement").val("Tired");
                               break;
                           case 1:
                               $("#arrangement").val("Flat");
                               break;
                       }
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
            //room preference 2
           $("#selectable-arrangement2").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-arrangement2 li").index(this);
                       switch (index) {
                           case 0:
                               $("#arrangement2").val("Tired");
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
            getDeptCode();
            getModuleAjax();
            getRoomAjax();
            getBuildingAjax();
            //implement jquery ui slider to 'number of rooms' and 'capacity'
            //start slider
            $("#slider-rooms").slider({
                range: "max",
                min: 1,
                max: 5,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#noRooms").val(ui.value);
                }
            });
            //put the slider value into text box with id 'noRooms'
            $("#noRooms").val($("#slider-rooms").slider("value"));
            //capacity 1
            $("#slider-capacity1").slider({
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
            $("#capacity1").val($("#slider-capacity1").slider("value"));
            //capacity 2
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
            //put the slider value into text box with id 'capacity2'
            $("#capacity2").val($("#slider-capacity2").slider("value"));
            //capacity 3
            $("#slider-capacity3").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity3").val(ui.value);
                }
            });
            //put the slider value into text box with id 'capacity3'
            $("#capacity3").val($("#slider-capacity3").slider("value"));
            //capacity 4
            $("#slider-capacity4").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity4").val(ui.value);
                }
            });
            //put the slider value into text box with id 'capacity4'
            $("#capacity4").val($("#slider-capacity4").slider("value"));
            //capacity 5
            $("#slider-capacity5").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity5").val(ui.value);
                }
            });
            //put the slider value into text box with id 'capacity'
            $("#capacity5").val($("#slider-capacity5").slider("value"));
            //end slider
        });

        
        //start AJAX
        //get current username
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
                    for (var i = 0; i < result.length; i++) {
                        //populate module drop down list
                        $("#module").append("<option>" + result[i].module_code + " : " + result[i].module_title + "</option>");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //get modules that belongs to current department
        function getDeptCode() {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "CreateRequest.aspx/getDept",
                data: "{}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var result = data.d;
                    for (var i = 0; i < result.length; i++) {
                        $("#dept").val(result[0]);
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
                    for (var i = 0; i < roomData.length; i++) {
                        if(roomData[i].tiered == 1)
                            $("#room1").append("<option>" + roomData[i].room_code + "</option>");
                        if (i > 1 && roomData[i].tiered == 1)
                            $("#room2").append("<option>" + roomData[i].room_code + "</option>");
                        if (i > 2 && roomData[i].tiered == 1)
                            $("#room3").append("<option>" + roomData[i].room_code + "</option>");
                        if (i > 3 && roomData[i].tiered == 1)
                            $("#room4").append("<option>" + roomData[i].room_code + "</option>");
                        if (i > 4 && roomData[i].tiered == 1)
                            $("#room5").append("<option>" + roomData[i].room_code + "</option>");
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
                    for (var i = 0; i < buildingData.length;i++){
                        $("#building").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                        if (i > 1)
                            $("#building2").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                        if (i > 2)
                            $("#building3").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                        if (i > 3)
                            $("#building4").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                        if (i > 4)
                            $("#building5").append("<option>" + buildingData[i].building_code + " : " + buildingData[i].building_name + "</option>");
                    }
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
        //end AJAX

        //change room preference Based on capacity, park and additional options
        function changeRoom(){
            var noOfRooms = parseInt(document.getElementById('noRooms').value);
            var park = document.getElementById("park").value;
            var capacity = parseInt(document.getElementById("capacity1").value);
            var capacity2 = ""; if (noOfRooms > 1) capacity2 = parseInt(document.getElementById("capacity2").value);
            var capacity3 = ""; if (noOfRooms > 2) capacity3 = parseInt(document.getElementById("capacity3").value);
            var capacity4 = ""; if (noOfRooms > 3) capacity4 = parseInt(document.getElementById("capacity4").value);
            var isWheelchair = document.getElementById("wheelchair_yes").checked;
            var isWheelchair2; if (noOfRooms > 1) isWheelchair2 = document.getElementById("wheelchair_yes2").checked;
            var isWheelchair3; if (noOfRooms > 2) isWheelchair3 = document.getElementById("wheelchair_yes3").checked;
            var isWheelchair4; if (noOfRooms > 3) isWheelchair4 = document.getElementById("wheelchair_yes4").checked;
            var isVisualiser = document.getElementById("visualiser_yes").checked;
            var isVisualiser2; if (noOfRooms > 1) isVisualiser2 = document.getElementById("visualiser_yes2").checked;
            var isVisualiser3; if (noOfRooms > 2) isVisualiser3 = document.getElementById("visualiser_yes3").checked;
            var isVisualiser4; if (noOfRooms > 3) isVisualiser4 = document.getElementById("visualiser_yes4").checked;
            var isProjector = document.getElementById("projector_yes").checked;
            var isProjector2; if (noOfRooms > 1) isProjector2 = document.getElementById("projector_yes2").checked;
            var isProjector3; if (noOfRooms > 2) isProjector3 = document.getElementById("projector_yes3").checked;
            var isProjector4; if (noOfRooms > 3) isProjector4 = document.getElementById("projector_yes4").checked;
            var isWhiteboard = document.getElementById("whiteboard_yes").checked;
            var isWhiteboard2; if (noOfRooms > 1) isWhiteboard2 = document.getElementById("whiteboard_yes2").checked;
            var isWhiteboard3; if (noOfRooms > 2) isWhiteboard3 = document.getElementById("whiteboard_yes3").checked;
            var isWhiteboard4; if (noOfRooms > 3) isWhiteboard4 = document.getElementById("whiteboard_yes4").checked;

            var n = parseInt(document.forms.requestForm.elements.day.value) - 1;
            var day;
            if (n > -1) {
                day = document.forms.requestForm.elements.day[n].id;
                day = day.charAt(0).toUpperCase() + day.slice(1);
            }

            var weeks = [];

            for (var x = 0; x < 16; x++) {
                if (document.forms.requestForm.elements['weeks[]'][x].checked) {
                    weeks.push(x + 1);
                }
            }



            var period = document.getElementById('time').selectedIndex + 1;
            var duration = document.getElementById('duration').selectedIndex + 1;

            var bookedRooms = [];

            var flag = false;

            for (var x = 0; x < weeks.length; x++) {
                if (weeks[x] > 0 && weeks[x] < 13) flag = true;
            }


            for (var x = 1; x < bookingData.length; x++) {
                for (var y = 0; y < weeks.length; y++) {
                    if (parseInt(bookingData[x].week) == weeks[y] || (bookingData[x].week == "0" && flag == true)) {
                        if (bookingData[x].day == day) {
                            if ((parseInt(bookingData[x].period) <= period && ((parseInt(bookingData[x].period) + parseInt(bookingData[x].duration)) > period)) ||
                            ((period + duration) > parseInt(bookingData[x].period) && period < parseInt(bookingData[x].period) + parseInt(bookingData[x].duration))) {
                                bookedRooms.push(bookingData[x].room_code);
                            }
                        }
                    }
                }
            }

            //empty the room code list
            $("#room_list").empty();
            $("#room_list").append("<option>" + "" + "</option>");
            $("#room_list2").find("select").empty();
            $("#room_list2").find("select").append("<option>" + "" + "</option>");
            $("#room_list3").find("select").empty();
            $("#room_list3").find("select").append("<option>" + "" + "</option>");
            $("#room_list4").find("select").empty();
            $("#room_list4").find("select").append("<option>" + "" + "</option>");
            for (var i = 0; i < roomData.length; i++) {
                //if the room has enough capacity, and has the options the user asked for - or he didn't ask for the option, then add it to the list
                if (bookedRooms.indexOf(roomData[i].room_code) == -1 && (roomData[i].capacity >= capacity || isNaN(capacity)) &&
                (park == "Any" || park == roomData[i].park) &&
                (!isWheelchair || roomData[i].wheelchair == 1) &&
                (!isVisualiser || roomData[i].visualiser == 1) &&
                (!isProjector || roomData[i].projector == 1) &&
                (!isWhiteboard || roomData[i].whiteboard == 1))
                    $("#room_list").append("<option value='" + roomData[i].room_code + "'>" + roomData[i].room_code + "</option>");
            }
            //additional stages if more than one room pref option required
            //Tom middleton
            if (parseInt(document.getElementById('noRooms').value) > 1) {

                for (var i = 0; i < roomData.length; i++) {
                    if (bookedRooms.indexOf(roomData[i].room_code) == -1 && (roomData[i].capacity >= capacity2 || isNaN(capacity2)) &&
                    (park == "Any" || park == roomData[i].park) &&
                    (!isWheelchair2 || roomData[i].wheelchair == 1) &&
                    (!isVisualiser2 || roomData[i].visualiser == 1) &&
                    (!isProjector2 || roomData[i].projector == 1) &&
                    (!isWhiteboard2 || roomData[i].whiteboard == 1))
                        $("#room_list2").find("select").append("<option value='" + roomData[i].room_code + "'>" + roomData[i].room_code + "</option>");
                }

                //else {}
                for (var x = 1; x < 4; x++) {
                    document.getElementById('room_list' + (x + 1)).style.display = 'none';
                    document.getElementById('roomlabel' + (x + 1)).style.display = 'none';
                    document.getElementById('advancedinputs' + (x + 1)).style.display = 'none';
                }
                noOfRooms = parseInt(document.getElementById('noRooms').value);
                if (noOfRooms > 1) {
                    for (var x = 1; x < noOfRooms; x++) {
                        document.getElementById('room_list' + (x + 1)).style.display = 'block';
                        document.getElementById('roomlabel' + (x + 1)).style.display = 'block';
                        document.getElementById('advancedinputs' + (x + 1)).style.display = 'block';
                    }
                }
            }
            else {
                for (var x = 1; x < 4; x++) {
                    document.getElementById('room_list' + (x + 1)).style.display = 'none';
                    document.getElementById('roomlabel' + (x + 1)).style.display = 'none';
                    document.getElementById('advancedinputs' + (x + 1)).style.display = 'none';
                }
            }
            if (parseInt(document.getElementById('noRooms').value) > 2) {
                for (var i = 0; i < roomData.length; i++) {

                    if (bookedRooms.indexOf(roomData[i].room_code) == -1 && (roomData[i].capacity >= capacity3 || isNaN(capacity3)) &&
                    (park == "Any" || park == roomData[i].park) &&
                    (!isWheelchair3 || roomData[i].wheelchair == 1) &&
                    (!isVisualiser3 || roomData[i].visualiser == 1) &&
                    (!isProjector3 || roomData[i].projector == 1) &&
                    (!isWhiteboard3 || roomData[i].whiteboard == 1))
                        $("#room_list3").find("select").append("<option value='" + roomData[i].room_code + "'>" + roomData[i].room_code + "</option>");

                }
            }
            if (parseInt(document.getElementById('noRooms').value) > 3) {

                for (var i = 0; i < roomData.length; i++) {
                    if (bookedRooms.indexOf(roomData[i].room_code) == -1 && (roomData[i].capacity >= capacity4 || isNaN(capacity)) &&
                    (park == "Any" || park == roomData[i].park) &&
                    (!isWheelchair4 || roomData[i].wheelchair == 1) &&
                    (!isVisualiser4 || roomData[i].visualiser == 1) &&
                    (!isProjector4 || roomData[i].projector == 1) &&
                    (!isWhiteboard4 || roomData[i].whiteboard == 1))
                        $("#room_list4").find("select").append("<option value='" + roomData[i].room_code + "'>" + roomData[i].room_code + "</option>");
                }

            }
        }
    </script>

  
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Create Request - Round: 3 (Ad-Hoc Only)</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div >
        <%-- General information --%>
        <table class="inputs box_class" id="main_layout" >
            <tr>
                <td align="left">Department</td>
                <td align="left">Module</td>
            </tr>
            <tr>
                <%-- Department --%>
                <td align="left">
                    <input type="text" id="dept" name="dept" style="border:0;" readonly="readonly" />
                </td>
                <%-- Module --%>
                <td align="left">
                    <select id="module" name="module">

                    </select>
                </td>
            <tr>
                <td align="left">Number of Rooms</td>
                <td align="left">Session Type</td>
            </tr>
            <tr>
                <%-- Number of rooms --%>
                <td align="center">
                    <table>
                        <tr>
                            <td>
                                <div id="slider-rooms"></div>
                            </td>
                            <td>
                                <input type="text" id="noRooms" name="noRooms" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/>
                            </td>
                        </tr>
                    </table>
                </td>
                <%-- Session type --%>
                <td align="left">
                    <ol id="selectable-session">
                        <li class="ui-state-default ui-selected" style="width: 80px">Lecture</li>
                        <li class="ui-state-default" style="width: 80px">Practical</li>
                        <li class="ui-state-default" style="width: 80px">Seminar</li>
                        <li class="ui-state-default" style="width: 80px">Tutorial</li>
                    </ol>
                    <input type="hidden" id="session" name="session" value="Lecture" />
                </td>
            </tr>
        </table>

        <%--Room preference 1--%> 
        <table class="inputs box_class" id="main_layout">
            <tr>
                <td colspan="2" align="left">Facility</td>
                <td align="left">Arrangement</td>
            </tr>
            <tr>
                <%--Facility options 1--%> 
                <td align="left" colspan="2">
                    <table>
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
                    </table>
                </td>
                <td align="left">
                    <ol id="selectable-arrangement">
                        <li class="ui-state-default ui-selected" style="width: 200px">Tiered</li>
                        <li class="ui-state-default" style="width: 200px">Flat</li>
                    </ol>
                    <input type="hidden" id="arrangement" name="arrangement" value="Tiered" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="3">
                    Capacity
                </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                    <table>
                        <tr>
                            <td>
                                <div id="slider-capacity1"></div>
                            </td>
                            <td>
                                <input type="text" id="capacity1" name="capacity1" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left">Park</td>
                <td align="left">Building</td>
                <td align="left">Room</td>
            </tr>
            <tr>
                <td align="left">
                    <select id="park" name="park">
                        <option>Any</option>
                        <option>Central</option>
                        <option>East</option>
                        <option>West</option>
                    </select>
                </td>
                <td align="left">
                    <select id="building" name="building">
                        <option>Any</option>
                    </select>
                </td>
                <td align="left">
                    <select id="room1" name="room1"></select>
                </td>
            </tr>
        </table>
          <%--Room preference 2--%> 
        <div>
            <table class="inputs box_class" id="main_layout">
                <tr>
                    <td colspan="2" align="left">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 2--%> 
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
                                <td>
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
                                <td>
                                    <ol id="selectable-wheelchair2">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair2" name="wheelchair2" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement2">
                            <li class="ui-state-default ui-selected" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement2" name="arrangement2" value="Tiered" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity2"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity2" name="capacity2" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">Park</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left">
                        <select id="park2" name="park2">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>
                            <option>West</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="building2" name="building2">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room2" name="room2"></select>
                    </td>
                </tr>
            </table>
        </div>
        <%--Room preference 3--%> 
        <div>
            <table class="inputs box_class" id="room_pref3">
                <tr>
                    <td colspan="2" align="left">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 3--%> 
                                <td>
                                    <ol id="selectable-computer3">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer3" name="computer3" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture3">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture3" name="capture3" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-pa3">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa3" name="pa3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector3">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector3" name="projector3" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-mic3">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic3" name="mic3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video3">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video3" name="video3" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-visualiser3">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser3" name="visualiser3" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard3">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard3" name="whiteboard3" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-wheelchair3">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair3" name="wheelchair3" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement3">
                            <li class="ui-state-default ui-selected" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement3" name="arrangement3" value="Tiered" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity3"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity3" name="capacity3" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">Park</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left">
                        <select id="park3" name="park3">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>
                            <option>West</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="building3" name="building3">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room3" name="room3"></select>
                    </td>
                </tr>
            </table>
        </div>
        <%--Room preference 4--%> 
        <div>
            <table class="inputs box_class" id="room_pref4">
                <tr>
                    <td colspan="2" align="left">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 4--%> 
                                <td>
                                    <ol id="selectable-computer4">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer4" name="computer4" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture4">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture4" name="capture4" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-pa4">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa4" name="pa4" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector4">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector4" name="projector4" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-mic4">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic4" name="mic4" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video4">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video4" name="video4" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-visualiser4">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser4" name="visualiser4" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard4">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard4" name="whiteboard4" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-wheelchair4">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair4" name="wheelchair4" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement4">
                            <li class="ui-state-default ui-selected" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement4" name="arrangement4" value="Tiered" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity4"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity4" name="capacity4" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">Park</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left">
                        <select id="park4" name="park4">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>
                            <option>West</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="building4" name="building4">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room4" name="room4"></select>
                    </td>
                </tr>
            </table>
        </div>
        <%--Room preference 5--%> 
        <div>
            <table class="inputs box_class" id="room_pref5">
                <tr>
                    <td colspan="2" align="left">Facility</td>
                    <td align="left">Arrangement</td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table>
                            <tr>
                                <%--Facility options 5--%> 
                                <td>
                                    <ol id="selectable-computer5">
                                        <li class="ui-state-default" style="width: 200px">Computer</li>
                                    </ol>
                                    <input type="hidden" id="computer5" name="computer5" value="0"/>
                                </td>
                                <td>
                                     <ol id="selectable-capture5">
                                         <li class="ui-state-default" style="width: 200px">Lecture Capture</li>
                                     </ol>
                                     <input type="hidden" id="capture5" name="capture5" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-pa5">
                                        <li class="ui-state-default" style="width: 200px">PA System</li>
                                    </ol>
                                    <input type="hidden" id="pa5" name="pa5" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-projector5">
                                        <li class="ui-state-default" style="width: 200px">Projector</li>
                                    </ol>
                                    <input type="hidden" id="projector5" name="projector5" value="0" />
                                </td>
                             </tr>
                             <tr>
                                <td>
                                    <ol id="selectable-mic5">
                                        <li class="ui-state-default" style="width: 200px">Radio Microphone</li>
                                    </ol>
                                    <input type="hidden" id="mic5" name="mic5" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-video5">
                                        <li class="ui-state-default" style="width: 200px">Video/DVD Player</li>
                                    </ol>
                                    <input type="hidden" id="video5" name="video5" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-visualiser5">
                                        <li class="ui-state-default" style="width: 200px">Visualiser</li>
                                    </ol>
                                    <input type="hidden" id="visualiser5" name="visualiser5" value="0" />
                                </td>
                                <td>
                                    <ol id="selectable-whiteboard5">
                                        <li class="ui-state-default" style="width: 200px">Whiteboard</li>
                                    </ol>
                                    <input type="hidden" id="whiteboard5" name="whiteboard5" value="0" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <ol id="selectable-wheelchair5">
                                        <li class="ui-state-default" style="width: 200px">Wheelchair Access</li>
                                    </ol>
                                    <input type="hidden" id="wheelchair5" name="wheelchair5" value="0" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td align="left">
                        <ol id="selectable-arrangement5">
                            <li class="ui-state-default ui-selected" style="width: 200px">Tiered</li>
                            <li class="ui-state-default" style="width: 200px">Flat</li>
                        </ol>
                        <input type="hidden" id="arrangement5" name="arrangement5" value="Tiered" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="3">
                        Capacity
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <table>
                            <tr>
                                <td>
                                    <div id="slider-capacity5"></div>
                                </td>
                                <td>
                                    <input type="text" id="capacity5" name="capacity5" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold; text-align:center;"/>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="left">Park</td>
                    <td align="left">Building</td>
                    <td align="left">Room</td>
                </tr>
                <tr>
                    <td align="left">
                        <select id="park5" name="park5">
                            <option>Any</option>
                            <option>Central</option>
                            <option>East</option>
                            <option>West</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="building5" name="building5">
                            <option>Any</option>
                        </select>
                    </td>
                    <td align="left">
                        <select id="room5" name="room5"></select>
                    </td>
                </tr>
            </table>
        </div>
      </div>      
</asp:Content>
