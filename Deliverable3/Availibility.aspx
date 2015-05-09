<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Availibility.aspx.cs" Inherits="Team11.Availibility" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/Availability.css"/>    
    
    <script type="text/javascript" language="javascript">
         $(document).ready(function () {

        });
    </script>


</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Ad-Hoc</h1>
</asp:Content>

<%-- Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
			        <td id="p1_mon"><input type="button" id="p1_mon_select" value="select" /></td>
			        <td id="p2_mon"><input type="button" id="p2_mon_select" value="select" /></td>
			        <td id="p3_mon"><input type="button" id="p3_mon_select" value="select" /></td>
			        <td id="p4_mon"><input type="button" id="p4_mon_select" value="select" /></td>
			        <td id="p5_mon"><input type="button" id="p5_mon_select" value="select" /></td>
			        <td id="p6_mon"><input type="button" id="p6_mon_select" value="select" /></td>
			        <td id="p7_mon"><input type="button" id="p7_mon_select" value="select" /></td>
			        <td id="p8_mon"><input type="button" id="p8_mon_select" value="select" /></td>
			        <td id="p9_mon"><input type="button" id="p9_mon_select" value="select" /></td>	
			        <td id="p10_mon"><input type="button" id="p10_mon_select" value="select" /></td>
		        </tr>
		        <tr id="Tuesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Tuesday</td>
			        <td id="p1_tue"><input type="button" id="p1_tue_select" value="select" /></td>
			        <td id="p2_tue"><input type="button" id="p2_tue_select" value="select" /></td>
			        <td id="p3_tue"><input type="button" id="p3_tue_select" value="select" /></td>
			        <td id="p4_tue"><input type="button" id="p4_tue_select" value="select" /></td>
			        <td id="p5_tue"><input type="button" id="p5_tue_select" value="select" /></td>
			        <td id="p6_tue"><input type="button" id="p6_tue_select" value="select" /></td>
			        <td id="p7_tue"><input type="button" id="p7_tue_select" value="select" /></td>
			        <td id="p8_tue"><input type="button" id="p8_tue_select" value="select" /></td>
			        <td id="p9_tue"><input type="button" id="p9_tue_select" value="select" /></td>
			        <td id="p10_tue"><input type="button" id="p10_tue_select" value="select" /></td>			
		        </tr>
		        <tr id="Wednesday_td">
			        <td class="day" style="background-color:#f1f1f1;">Wednesday</td>
			        <td id="p1_wed"><input type="button" id="p1_wed_select" value="select" /></td>
			        <td id="p2_wed"><input type="button" id="p2_wed_select" value="select" /></td>
			        <td id="p3_wed"><input type="button" id="p3_wed_select" value="select" /></td>
			        <td id="p4_wed"><input type="button" id="p4_wed_select" value="select" /></td>
			        <td id="p5_wed"><input type="button" id="p5_wed_select" value="select" /></td>
			        <td id="p6_wed"><input type="button" id="p6_wed_select" value="select" /></td>
			        <td id="p7_wed"><input type="button" id="p7_wed_select" value="select" /></td>
			        <td id="p8_wed"><input type="button" id="p8_wed_select" value="select" /></td>
			        <td id="p9_wed"><input type="button" id="p9_wed_select" value="select" /></td>
			        <td id="p10_wed"><input type="button" id="p10_wed_select" value="select" /></td>
		        </tr>
		        <tr id="Thursday_td">
			        <td class="day" style="background-color:#f1f1f1;">Thursday</td>
			        <td id="p1_thu"><input type="button" id="p1_thu_select" value="select" /></td>
			        <td id="p2_thu"><input type="button" id="p2_thu_select" value="select" /></td>
			        <td id="p3_thu"><input type="button" id="p3_thu_select" value="select" /></td>
			        <td id="p4_thu"><input type="button" id="p4_thu_select" value="select" /></td>
			        <td id="p5_thu"><input type="button" id="p5_thu_select" value="select" /></td>
			        <td id="p6_thu"><input type="button" id="p6_thu_select" value="select" /></td>
			        <td id="p7_thu"><input type="button" id="p7_thu_select" value="select" /></td>
			        <td id="p8_thu"><input type="button" id="p8_thu_select" value="select" /></td>
			        <td id="p9_thu"><input type="button" id="p9_thu_select" value="select" /></td>
			        <td id="p10_thu"><input type="button" id="p10_thu_select" value="select" /></td>		
		        </tr>
		        <tr id="Friday_td">
			        <td class="day" style="background-color:#f1f1f1;">Friday</td>
			        <td id="p1_fri"><input type="button" id="p1_fri_select" value="select" /></td>
			        <td id="p2_fri"><input type="button" id="p2_fri_select" value="select" /></td>
			        <td id="p3_fri"><input type="button" id="p3_fri_select" value="select" /></td>
			        <td id="p4_fri"><input type="button" id="p4_fri_select" value="select" /></td>
			        <td id="p5_fri"><input type="button" id="p5_fri_select" value="select" /></td>
			        <td id="p6_fri"><input type="button" id="p6_fri_select" value="select" /></td>
			        <td id="p7_fri"><input type="button" id="p7_fri_select" value="select" /></td>
			        <td id="p8_fri"><input type="button" id="p8_fri_select" value="select" /></td>
			        <td id="p9_fri"><input type="button" id="p9_fri_select" value="select" /></td>
			        <td id="p10_fri"><input type="button" id="p10_fri_select" value="select" /></td>				
		        </tr>
		        </div>
            </table>
</asp:Content>
