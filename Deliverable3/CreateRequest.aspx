<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Create Request CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/CreateRequest.css" />
    <script type="text/javascript" language="javascript">
        var roomData;
        var buildingData;
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
           $("#selectable-wheelchair").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-wheelchair li").index(this);
                       switch (index) {
                           case 0:
                               $("#wheelchair").val(1);
                               break;
                           case 1:
                               $("#wheelchair").val(0);
                               break;
                       }
                   });
               }
           });
           $("#selectable-whiteboard").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-whiteboard li").index(this);
                       switch (index) {
                           case 0:
                               $("#whiteboard").val("1");
                               break;
                           case 1:
                               $("#whiteboard").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-projector").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-projector li").index(this);
                       switch (index) {
                           case 0:
                               $("#projector").val("1");
                               break;
                           case 1:
                               $("#projector").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-visualiser").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-visualiser li").index(this);
                       switch (index) {
                           case 0:
                               $("#visualiser").val("1");
                               break;
                           case 1:
                               $("#visualiser").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-computer").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-computer li").index(this);
                       switch (index) {
                           case 0:
                               $("#computer").val("1");
                               break;
                           case 1:
                               $("#computer").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-video").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-video li").index(this);
                       switch (index) {
                           case 0:
                               $("#video").val("1");
                               break;
                           case 1:
                               $("#video").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-pa").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-pa li").index(this);
                       switch (index) {
                           case 0:
                               $("#pa").val("1");
                               break;
                           case 1:
                               $("#pa").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-mic").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-mic li").index(this);
                       switch (index) {
                           case 0:
                               $("#mic").val("1");
                               break;
                           case 1:
                               $("#mic").val("0");
                               break;
                       }
                   });
               }
           });
           $("#selectable-capture").selectable({
               stop: function () {
                   $(".ui-selected", this).each(function () {
                       var index = $("#selectable-capture li").index(this);
                       switch (index) {
                           case 0:
                               $("#capture").val("1");
                               break;
                           case 1:
                               $("#capture").val("0");
                               break;
                       }
                   });
               }
           });
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
            $("#slider-capacity").slider({
                range: "max",
                min: 1,
                max: 500,
                value: 1,
                step: 1,
                slide: function (event, ui) {
                    $("#capacity").val(ui.value);
                }
            });
            //put the slider value into text box with id 'capacity'
            $("#capacity").val($("#slider-capacity").slider("value"));
        });
        //end slider
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
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
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
    </script>

  
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Create Request - Round: 3 (Ad-Hoc Only)</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <div>
        <%-- General information --%>
        <table class="inputs box_class" id="top_table">
            <tr>
                <td align="left">Department</td>
                <td align="left">Module</td>
                <td align="left">Number of Rooms</td>
                <td align="left">Session Type</td>
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
                <%-- Number of rooms --%>
                <td align="left">
                    <div id="slider-rooms"></div>
                    <input type="text" id="noRooms" name="noRooms" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold;"/>
                </td>
                <%-- Session type --%>
                <td align="left">
                    <ol id="selectable-session">
                        <li class="ui-state-default ui-selected">Lecture</li>
                        <li class="ui-state-default">Practical</li>
                        <li class="ui-state-default">Seminar</li>
                        <li class="ui-state-default">Tutorial</li>
                    </ol>
                    <input type="hidden" id="session" name="session" value="Lecture" />
                </td>
            </tr>
        </table>

        <%--Room preference 1--%>
        <table class="inputs box_class">
            <tr>
                <td align="left">Arrangement</td>
                <td align="left">Computer</td>
                <td align="left">Wheelchair Access</td>
            </tr>
            <tr>
                <%-- Arrangement --%>
                <td  align="left">
                    <ol id="selectable-arrangement">
                        <li class="ui-state-default ui-selected">Tiered</li>
                        <li class="ui-state-default">Flat</li>
                    </ol>
                    <input type="hidden" id="arrangement" name="arrangement" value="Tiered" />
                </td>
                <%-- Computer --%>
                <td align="left">
                    <ol id="selectable-computer">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default">No</li>
                    </ol>
                    <input type="hidden" id="computer" name="computer" value="1" />
                </td>
                <%-- wheelchair --%>
                <td align="left">
                    <ol id="selectable-wheelchair">
                        <li class="ui-state-default">Yes</li>
                        <li class="ui-state-default ui-selected">No</li>
                    </ol>
                    <input type="hidden" id="wheelchair" name="wheelchair" value="0" />
                </td>
            </tr>
            <tr>
                <td align="left">Whiteboard</td>
                <td align="left">Projector</td>
                <td align="left">Visualiser</td>
            </tr>
            <tr>
                <%-- Whiteboard --%>
                <td align="left">
                    <ol id="selectable-whiteboard">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default">No</li>
                    </ol>
                    <input type="hidden" id="whiteboard" name="whiteboard" value="1" />
                </td>
                <%-- Projector --%>
                <td align="left">
                    <ol id="selectable-projector">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default ">No</li>
                    </ol>
                    <input type="hidden" id="projector" name="projector" value="1" />
                </td>
                <%-- Visualiser --%>
                <td align="left">
                    <ol id="selectable-visualiser">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default">No</li>
                    </ol>
                    <input type="hidden" id="visualiser" name="visualiser" value="1" />
                </td>
            </tr>
             <tr>
                <td align="left">Video/DVD Player</td>
                <td align="left">PA System</td>
                <td align="left">Radio Microphone</td>
            </tr>
             <tr>
                <%-- Video/DVD --%>
                <td align="left">
                    <ol id="selectable-video">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default">No</li>
                    </ol>
                    <input type="hidden" id="video" name="video" value="1" />
                </td>
                <%-- PA System --%>
                <td align="left">
                    <ol id="selectable-pa">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default ">No</li>
                    </ol>
                    <input type="hidden" id="pa" name="pa" value="1" />
                </td>
                <%-- Visualiser --%>
                <td align="left">
                    <ol id="selectable-mic">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default">No</li>
                    </ol>
                    <input type="hidden" id="mic" name="mic" value="1" />
                </td>
            </tr>
            <tr>
                <td align="left">Lecture Capture</td>
                <td align="left" colspan="2">Capacity</td>
            </tr>
            <tr>
                <%-- Lecture Capture --%>
                <td align="left">
                    <ol id="selectable-capture">
                        <li class="ui-state-default ui-selected">Yes</li>
                        <li class="ui-state-default">No</li>
                    </ol>
                    <input type="hidden" id="capture" name="capture" value="1" />
                </td>
                <%-- Capacity --%>
                <td align="left" colspan="2">
                    <div id="slider-capacity"></div><br />
                    <input type="text" id="capacity" name="capacity" readonly="readonly" style="border:0; color:#f6931f; font-weight:bold;"/>
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
                    <select id="building" name="building"></select>
                </td>
                <td align="left">
                    <select id="room1" name="room1"></select>
                </td>
            </tr>
        </table> 
      </div>      
</asp:Content>
