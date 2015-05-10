<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddEditModule.aspx.cs" Inherits="Team11.AddEditModule" %>

<%-- Header Content --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="Stylesheet" type="text/css" href="Styles/AddEditModule.css" />
</asp:Content>

<%-- Page Title Content --%>
<asp:Content ID="TitlesContent" runat="server" ContentPlaceHolderID="TitleContent">
    <h1>Module Management</h1>
</asp:Content>


<%-- Body Content --%>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        getModuleAjax()
        getDeptCode()
        initEditDialog()
    });
    var moduleData;
    var dept;
    var old_mod_code;
    function clearAll() {
        document.getElementById("TextBoxModuleName").value = "";
        document.getElementById("TextBoxModuleCode").value = "";
        document.getElementById("TextBoxLecturer").value = "";
    }
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
                moduleData = data.d;
                console.log(moduleData);
                for (var i = 0; i < moduleData.length; i++) {
                    $("#genTable").append("<tr id='" + moduleData[i].module_code + "'>" +
                        "<td>" + moduleData[i].module_code + "</td>" +
                        "<td>" + moduleData[i].module_title + "</td>" +
                        "<td>" + moduleData[i].lecturer + "</td>" +
                        "<td>" + "<button type='button' class='btnstd' onclick='showEditDialog(this)'>Edit</button> " + "</td>" +
                        "<td>" + "<input type='button' class='btnstd' id='delete" + (i + 1) + "' onclick='deleteModuleAjax(this)' value='Delete' /> " + "</td>" + "</tr>");
                }
            },
            error: function (response) {
                console.log(response);
            }
        });
    }
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
                dept = data.d;
                console.log(dept);
                $("#moduleCodeD").html("<h2> Add Module for " + dept[0] + "</h2>");
                $("#TextBoxModuleCodeNo").val(dept[1]);
                $("#DialogBoxModuleCodeNo").val(dept[1]);
            },
            error: function (response) {
                console.log(response);
            }
        });
    }

    function addModule() {
        var module = {};
        module.mod_code = $("#TextBoxModuleCodeNo").val() + $("#SelectBoxModuleNo").val().toUpperCase() + $("#TextBoxModuleCode").val();
        module.mod_title = $("#TextBoxModuleName").val();
        module.lecturer = $("#TextBoxLecturer").val();
        $.ajax(
        {
            type: "POST",
            async: true,
            url: "AddEditModule.aspx/insertModule",
            data: "{module: " + JSON.stringify(module) + "}",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                alert("success");
                getModuleAjax();
            },
            error: function (response) {
                console.log(response);
            }
        });
    }

    function deleteModuleAjax(el) {
        var module = {};
        module.mod_code = el.parentNode.parentNode.cells[0].textContent;
        if (confirm("Are you sure you want to delete this module?")) {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "AddEditModule.aspx/deletemodule",
                //send room_code of selected room to process in the codebehind environment
                data: "{module: " + JSON.stringify(module) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");
                    location.reload();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
    }

    function editModuleAjax(el) {
        var module = {};
        module.old_mod_code = old_mod_code;
        module.mod_code = $("#DialogBoxModuleCodeNo").val() + $("#DialogBoxModuleNo").val().toUpperCase() + $("#DialogBoxModuleCode").val();
        module.mod_title = $("#DialogBoxModuleName").val();
        module.lecturer = $("#DialogBoxLecturer").val();
        if (confirm("Are you sure you want to edit this module?")) {
            $.ajax(
            {
                type: "POST",
                async: true,
                url: "AddEditModule.aspx/editmodule",
                data: "{module: " + JSON.stringify(module) + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    alert("success");
                    location.reload();
                },
                error: function (response) {
                    console.log(response);
                }
            });
        }
    }


    function initEditDialog() {
        $("#dialog-Edit").dialog({
            height: 160,
            width: 350,
            position: {
                my: "center",
                at: "center",
                of: window
            }
        });
        $("#dialog-Edit").dialog("close");
    }
    function showEditDialog(el) {
        var id = el.parentNode.parentNode.cells[0].textContent;
        var request_id = parseInt(id);

        old_mod_code = el.parentNode.parentNode.cells[0].textContent;
        console.log(old_mod_code);
        $("#dialog-Edit").dialog("open");
    }

</script>


    <!-- Add Module -->
        <div class="AddModuleHead">
            <div id="moduleCodeD" class="headerContainer">
            </div>

                <div>
                <table class="headTable">
                    <tr>
                        <td>
                        <h3 class="minustopmarg">Module Title</h3>
                        </td>
                        <td>
                        <input type="text" style="width:800px" id="TextBoxModuleName"/>
                        </td>
                    </tr>
                    <tr>
                      <td>
                        <h3 class="minustopmarg">Module Code</h3>
                      </td>
                      <td>
                        <input type="text" style="width:200px" id="TextBoxModuleCodeNo"  disabled />
                        <select id="SelectBoxModuleNo">
                            <option value="a">A</option>
                            <option value="b">B</option>
                            <option value="c">C</option>
                            <option value="d">D</option>
                            <option value="f">F</option> 
                            <option value="i">I</option>
                            <option value="p">P</option>                          
                        </select>
                        <input type="text" style="width:550px" id="TextBoxModuleCode" />
                      </td>
                  </tr>
                  <tr>
                      <td>
                        <h3 class="minustopmarg">Lecturer</h3>
                      </td>
                      <td>
                         <input type="text" style="width:800px" id="TextBoxLecturer"/>
                      </td>
                  </tr>
                </table>
                </div>

                <div>
                  <br />
                  <table class="buttonTable">
                     <tr>
                      <td> 
                    <button class="btns" onclick="addModule()" >Add Module</button>
                      </td> 
                      <td>
                    <button class="btns" onclick="clearAll();" >Clear All</button>
                      </td> 
                     </tr>
                 </table>
                 <br />
              </div>
        </div>

        <br />
         <div class="body-content">
          <div id="table_header"> 
            <table class="scrollTable">
	         <tr>
			        <td id="modulecd_td" onclick="sortHeader(this.id)">Module Code</td>
			        <td id="modulenm_td" onclick="sortHeader(this.id)">Module Name</td>
                    <td id="lecturer_td" onclick="sortHeader(this.id)">Lecturer</td>
       		        <td id="edit_td" style="cursor:default;" >Edit</td>
  			        <td id="delete_td" style="cursor:default;" >Delete</td>
                </tr>
	          </table>
            </div> 
            <div id="table_body">
             <table id="genTable" class="dataTable">
             </table>
            </div>
            </div>



             <div id="dialog-Edit" title="Edit Module">
               <table>
                    <tr>
                        <td>
                        <h5>Module Title : </h5>
                        </td>
                        <td>
                        <input type="text" id="DialogBoxModuleName"/>
                        </td>
                    </tr>
                    <tr>
                      <td>
                        <h5>Module Code : </h5>
                      </td>
                      <td>
                        <input type="text" style="width:50px; text-align:center;" id="DialogBoxModuleCodeNo"  disabled />
                        <select id="DialogBoxModuleNo">
                            <option value="a">A</option>
                            <option value="b">B</option>
                            <option value="c">C</option>
                            <option value="d">D</option>
                            <option value="f">F</option> 
                            <option value="i">I</option>
                            <option value="p">P</option>                          
                        </select>
                        <input type="text" id="DialogBoxModuleCode" />
                      </td>
                  </tr>
                  <tr>
                      <td>
                        <h5>Lecturer : </h5>
                      </td>
                      <td>
                         <input type="text" id="DialogBoxLecturer"/>
                      </td>
                  </tr>
                </table>
               <button class="btns" onclick="editModuleAjax()">Edit Module</button>
             </div>
</asp:Content>
