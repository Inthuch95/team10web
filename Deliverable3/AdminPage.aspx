<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="Team11.CreateRequest" MaintainScrollPositionOnPostback = "true"%>

<%-- Create Request Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Admin page CSS -->
    <link rel="Stylesheet" type="text/css" href="Styles/AdminPage.css"/>  
    
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
            getRequestAjax();
        });
        var requestData;
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
                        for (var i = 0; i < requestData.length; i++) {
                            var id = "#" + (i + 1);
                            $("#dataTable").append("<tr id='" + (i + 1) + "'>");
                            $(id).append("<td>" + requestData[i].request_id + "</td>");
                            $(id).append("<td>" + requestData[i].dept_code + "</td>");
                            $(id).append("<td>" + requestData[i].module + "</td>");
                            $(id).append("<td>" + requestData[i].room_code + "</td>");
                            $(id).append("<td>" + requestData[i].capacity + "</td>");
                            $(id).append("<td>" + "facility" + "</td>");
                            $(id).append("<td>" + requestData[i].special_req + "</td>");
                            $(id).append("<td>" + requestData[i].priority + "</td>");
                            $(id).append("<td>" + requestData[i].day + "</td>");
                            $(id).append("<td>" + requestData[i].period + "</td>");
                            $(id).append("<td>" + requestData[i].duration + "</td>");
                            $(id).append("<td>" + "Weeks" + "</td>");
                            //$(id).append("<td>" + requestData[i].semester + "</td>");
                            //$(id).append("<td>" + requestData[i].lecturer + "</td>");
                            //$(id).append("<td>" + requestData[i].session + "</td>");
                            //$(id).append("<td>" + requestData[i].status + "</td>");
                            $(id).append("<td>" + "button" + "</td>");
                            $("#dataTable").append("</tr>");
                        }
                    },
                    error: function (response) {
                        console.log(response);
                    }
                });
        }

        //end ajax
    </script>
   
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Admin Page</h1>
</asp:Content>

<%-- MAIN BODY CONTENT --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- Tabs containing different admin functionality --%>
    <div id="tabs">
      <ul>
        <li><a href="#room-allocation-tabs">Room Allocation</a></li>
        <li><a href="#facility-tabs">Facility Management</a></li>
        <li><a href="#round-tabs">Round Dates</a></li>
      </ul>
      <div id="room-allocation-tabs">
        <h2>Room allocation</h2>
        <%-- These allow us to see table head and use filter when scrolling down the page --%>
        <div id="table_header">
            <table id="scrollTable">
	            <tr>
		            <h4>Click on the headers to sort the table</h4><br/><br/>
			            <td id="request_id">
				            Request</br>Id
			            </td>
                        <td id="dept_code">
			                Depaertment
		                </td>
			            <td id="module_code">
				            Module </br> Code
			            </td>
			            <td id="room_code">
				            Room Code
			            </td>
			            <td id="capacity">
				            Capacity
			            </td>
                        <td id="facility">
                            Facility
                        </td>
			            <td id="special_requirements" style="cursor:default; font-size:0.8em; font-weight:bold;">
				            Special </br>Requirements
			            </td>
			            <td id="priority">
				            Priority
			            </td>
			            <td id="day">
				            Day
			            </td>
			            <td id="period">
				            Period
				
			            <td id="duration">
				            Duration
			            </td>
			            <td id="week(s)" style="cursor:default;">
				            Week(s)
			            </td>
                        <%--<td id="semester">
                            Semester
                        </td>
                        <td id="lecturer">
                            Lecturer
                        </td>
                        <td id="session">
                            Session Type
                        </td>
                        <td id="status">
                            Status
                        </td>--%>
			            <td id="edit_cell" style="cursor:default;">
				            Edit/Delete
			            </td>
                    </tr>
	            </table>
            </div>

            <div id="content_wrap">
                <table id="dataTable" class="entries_table">
	                <tr style="display:none;">
		                <td id="request_id">
			                Request_id
		                </td>
                        <td id="dept_code">
			                Depaertment
		                </td>
		                <td id="module_code">
			                Module_code
		                </td>
		                <td id="room_code">
			                Room_code
		                </td>
		                <td id="capacity">
			                Capacity
		                </td>
		                <td id="facility">
                            Facility
		                </td>
		                <td id="special_requirements">
			                Special </br>Requirements
		                </td>
		                <td id="priority">
			                Priority
		                </td>
		                <td id="day">
			                Day
		                </td>
		                <td id="period">
			                Period
		                </td>
				
		                <td id="duration">
			                Duration
		                </td>
		                <td id="week(s)" >
			                Week(s)
		                </td>
                        <%--<td id="semester">
                            Semester
                        </td>
                        <td id="lecturer">
                            Lecturer
                        </td>
                        <td id="session">
                            Session Type
                        </td>
                        <td id="status">
                            Status
                        </td>--%>
		                <td id="edit_cell" style="cursor:default;">
			                Edit/Delete
		                </td>
				
	                </tr>
                </table>
            </div>
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
