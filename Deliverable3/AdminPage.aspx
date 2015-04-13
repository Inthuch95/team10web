<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Create Request CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/CreateRequest.css" />
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {

            //Room Buttons
            if ($("#MainContent_RadioButtonListView_0").is(":checked")) {
                $("#MainContent_RadioButtonListView_0").parent().addClass("btn btn-danger");
            };
            if ($("#MainContent_RadioButtonListView_1").is(":checked")) {
                $("#MainContent_RadioButtonListView_1").parent().addClass("btn btn-danger");
            };
            $("#tabs").tabs();
        });
    </script>
    <script type="text/javascript" language="javascript">
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
                        if (roomData[i].tiered == 1)
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
        getRoomAjax();
    </script>
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Admin Page</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <div id="tabs">
      <ul>
        <li><a href="#room-allocation-tabs">Room Allocation</a></li>
        <li><a href="#facility-tabs">Facility Management</a></li>
        <li><a href="#round-tabs">Round Dates</a></li>
      </ul>
      <div id="room-allocation-tabs">
        <p>Room allocation</p>
      </div>
      <div id="facility-tabs">
        <p>Facility management</p>
      </div>
      <div id="round-tabs">
        <p>Round dates</p>
      </div>
</div>  
    <%--<div>--%>
        <%-- General information --%>
<%--        <table class="inputs box_class" id="main_layout" >
            <tr>
                
                <td>
                    <table align="center">
                        <tr>
                            <td align="center" colspan="2">Select a Room:</td>
                            <td align="center" colspan="3">
                                <select id="room1" name="room1"></select>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:ListItem class="none btn btn-primary">Delete Room</asp:ListItem></td>
                            <td><asp:ListItem class="none btn btn-primary">Change Room</asp:ListItem></td>
                            <td><asp:ListItem class="none btn btn-primary">View Room Facilities</asp:ListItem></td>
                            <td><asp:ListItem class="none btn btn-primary">Edit Room Facilities</asp:ListItem></td>
                            <td><asp:ListItem class="none btn btn-primary">Add Room Facility</asp:ListItem></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <div id="divDelRoom" runat="server" visible="false">



        </div>
        <div id="divEditRoom" runat="server" visible="false">



        </div>
        <div id="divViewFac" runat="server" visible="false">



        </div>
        <div id="divEditFac" runat="server" visible="false">



        </div>
        <div id="divAddFac" runat="server" visible="false">



        </div>
    </div>
    <div>
        <table class="inputs box_class" id="Table1" >
            <tr>
                <td align="left">Change Round Dates</td>
                <td>
                    <table>
                        <tr>
                            <td>Round 1:</td>
                        </tr>
                        <tr>
                            <td>Start:</td>
                            <td>dd/mm/yyyy</td>
                            <td>End:</td>
                            <td>dd/mm/yyyy</td>
                        </tr>
                        <tr>
                            <td>Round 2:</td>
                        </tr>
                        <tr>
                            <td>Start:</td>
                            <td>dd/mm/yyyy</td>
                            <td>End:</td>
                            <td>dd/mm/yyyy</td>
                        </tr>
                        <tr>
                            <td>Round 3:</td>
                        </tr>
                        <tr>
                            <td>Start:</td>
                            <td>dd/mm/yyyy</td>
                            <td>End:</td>
                            <td>dd/mm/yyyy</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="inputs box_class" id="Table2" >
            <tr>
                <td align="left">Change Status of Request</td>
            </tr>
        </table>
        <table class="inputs box_class" id="Table3" >
            <tr>
                <td align="left">Allocate Rooms</td>
            </tr>
        </table>
      </div>   --%>  
</asp:Content>
<%-- <tr>
              <td align="left">Current Rooms Facilities</td>
                <td>
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
                            <td>
                                Add New Facility
                            </td>
                        </tr>
                    </table>
                 </td>
            </tr> --%>
