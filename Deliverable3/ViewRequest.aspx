<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewRequest.aspx.cs" Inherits="Team11.ViewRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/ViewRequest.css"/>  
   
    <script type="text/javascript">
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
                    for (var i = 0; i < requestData.length; i++) {
                        $("#" + requestData[i].status).append("<tr>" + "<td>" + requestData[i].request_id + "</td>" + "<td>" + requestData[i].module + "</td>" + "<td>" + requestData[i].room_code
                            + "</td>" + "<td>" + requestData[i].capacity + "</td>" + "<td>" + " <button type='button' class='btns'>show</button> " + "</td>"
                            + "<td>" + "<button type='button' class='btns'>show</button>" + "</td>" + "<td>" + requestData[i].priority + "</td>"
                            + "<td>" + requestData[i].day + "</td>" + "<td>" + requestData[i].period + "</td>" + "<td>" + requestData[i].duration + "</td>"
                            + "<td>" + "<button type='button' class='btns'>show</button>" + "</td>" + "<td>" + "<button type='button' class='btns'>show</button>"
                            + "</td>" + "</tr>");
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
</asp:Content>