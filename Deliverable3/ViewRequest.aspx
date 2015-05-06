<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="Team11.ViewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ViewRequest.css"/>  
   
    <script type="text/javascript">
     $(document).ready(function () {
         getRequestAjax();
         initFacilityDialog();
         initSpecialDialog();
         initRequestDialog();
     });

     var requestData;
     //start ajax
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
                     alert("deleted");
                     getRequestAjax();
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
                            + "</td>" + "<td>" + requestData[i].capacity + "</td>" + "<td>" + " <button type='button' class='btns' onclick='showFacilityDialog(this)'>show</button> " + "</td>"
                            + "<td>" + "<button type='button' class='btns' onclick='showSpecialDialog(this)'>show</button>" + "</td>" + "<td>" + requestData[i].priority + "</td>"
                            + "<td>" + requestData[i].day + "</td>" + "<td>" + requestData[i].period + "</td>" + "<td>" + requestData[i].duration + "</td>"
                            + "<td>" + "<button type='button' class='btns'>show</button>" + "</td>");
                        if (requestData[i].status == "Pending" || requestData[i].status == "Booked") {
                            $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='updateRequestAjax(this)' class='btns'>Edit</button><br /><button type='button' onclick='deleteRequestAjax(this)' class='btns'>Delete</button>"
                            + "</td>");
                            $("#" + requestData[i].status).append("</tr>");
                        }
                        else {
                            $("#" + requestData[i].request_id).append("<td>" + "<button type='button' onclick='resubmitRequestAjax(this)' class='btns'>Resubmit</button><br /><button type='button' onclick='updateRequestAjax(this)' class='btns'>Edit</button>"
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
                 at: "top",
                 of: window
             }
         });
         $("#dialog-facility").dialog("close");
     }
     function initSpecialDialog() {
         $("#dialog-special").dialog({
             position: {
                 my: "center",
                 at: "top",
                 of: window
             }
         });
         $("#dialog-special").dialog("close");
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

    <div class="tab-content">
        <div id="rejected" class="tab active">
          <div id="table_header"> 
            <table class="scrollTable">
	         <tr>
			        <td>Request<br/>Id</td>
			        <td>Module <br/> Code</td>
			        <td>Room Code</td>
			        <td>Capacity</td>
			        <td>Facility</td>
			        <td style="cursor:default; font-size:0.8em; font-weight:bold;">Special <br/>Requirements</td>
			        <td>Priority</td>
			        <td>Day</td>
			        <td>Period</td>
			        <td>Duration</td>
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
			        <td>Request<br/>Id</td>
			        <td>Module <br/> Code</td>
			        <td>Room Code</td>
			        <td>Capacity</td>
			        <td>Facility</td>
			        <td style="cursor:default; font-size:0.8em; font-weight:bold;">Special <br/>Requirements</td>
			        <td>Priority</td>
			        <td>Day</td>
			        <td>Period</td>
			        <td>Duration</td>
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
				    <td>Request<br/>Id</td>
			        <td>Module <br/> Code</td>
			        <td>Room Code</td>
			        <td>Capacity</td>
			        <td>Facility</td>
			        <td style="cursor:default; font-size:0.8em; font-weight:bold;">Special <br/>Requirements</td>
			        <td>Priority</td>
			        <td>Day</td>
			        <td>Period</td>
			        <td>Duration</td>
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
    <div id="dialog-request" title="Edit Request">
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
</asp:Content>