<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="Team11.ViewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ViewRequest.css"/>  
   
    <script type="text/javascript" language="javascript">
     $(document).ready(function () {
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
    <h1>View Requests</h1>
</asp:Content>

<%-- Page Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%-- These allow us to see table head and use filter when scrolling down the page --%>
    <div id="table_header">
        <table id="scrollTable">
	        <tr>
		        <div id="status_change"><h3>Filter by: </h3>
			        <select id="status">
                        <option>Rejected</option>
                        <option>Booked</option>
                        <option>Pending</option>
                    </select><br/>
		        </div>
		        <h4>Click on the headers to sort the table</h4><br/><br/>
			        <td id="request_id">
				        Request</br>Id
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
			        <td id="wheelchair">
				        Wheelchair
			        </td>
			        <td id="projector">
				        Projector
			        </td>
			        <td id="visualiser">
				        Visualiser
			        </td>
			        <td id="whiteboard">
				        Whiteboard
			        </td>
			        <td id="special_requirements" style="cursor:default; font-size:0.8em; font-weight:bold;">
				        Special </br>Requirements
			        </td>
			        <td id="priority">
				        Priority
			        </td>
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
			        <td id="edit_cell" style="cursor:default;">
				        Edit/Delete
			        </td>
                </tr>
	        </table>
        </div>

        <div id="content_wrap">
            <table id="dataTable" class="entries_table">
	            <tr style="display:none;">
                    <select style="display:none;" id="statusList">
                        <option>Rejected</option>
                        <option>Booked</option>
                        <option>Pending</option>
                    </select>
		            <td id="request_id">
			            request_id
		            </td>
		            <td id="module_code">
			            module_code
		            </td>
		            <td id="room_code">
			            room_code
		            </td>
		            <td id="capacity">
			            capacity
		            </td>
		            <td id="wheelchair">
			            wheelchair
		            </td>
		            <td id="projector">
			            projector
		            </td>
		            <td id="visualiser">
			            visualiser
		            </td>
		            <td id="whiteboard">
			            whiteboard
		            </td>
		            <td id="special_requirements">
			            Special </br>Requirements
		            </td>
		            <td id="priority">
			            priority
		            </td>
		            <td id="day">
			            day
		            </td>
		            <td id="period">
			            period
		            </td>
				
		            <td id="duration">
			            duration
		            </td>
		            <td id="week(s)" >
			            week(s)
		            </td>
		            <td id="edit_cell" style="cursor:default;">
			            Edit/Delete
		            </td>
				
	            </tr>
            </table>
        </div>
</asp:Content>
