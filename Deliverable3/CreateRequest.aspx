<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Create Request CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/CreateRequest.css" />
    <script type="text/javascript" language="javascript">
        var roomData;
        var buildingData;
        var selectedWhiteboard = false;
        var selectedComputer = false;
        var selectedCap = false;
        var selectedPa = false;
        var selectedProjector = false;
        var selectedMic = false;
        var selectedVideo = false;
        var selectedVisualiser = false;
        var selectedWheelchair = false;
        $(document).ready(function () {
           //implement jquery ui selectable to facility options 
            //start selectable
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
        });
        //end slider
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
      </div>      
</asp:Content>
