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
    });
    var moduleData;
    var dept;
    function clearAll() {
        document.getElementById("TextBoxModuleName").value = "";
        document.getElementById("TextBoxModuleCode").value = "";
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
            },
            error: function (response) {
                console.log(response);
            }
        });
    }

</script>


    <!-- Add Module -->
        <div class="AddModuleHead">
            <div class="headerContainer">
              <h2>Add Module for</h2>
            </div>

                <div>
                <table class="headTable">
                    <tr>
                        <td>
                        <h3 class="minustopmarg">Module Title</h3>
                        </td>
                        <td>
                        <input type="text" class="form-control" id="TextBoxModuleName"/>
                        </td>
                    </tr>
                    <tr>
                      <td>
                        <h3 class="minustopmarg">Module Code</h3>
                      </td>
                      <td>
                        <input type="text" class="form-control" id="TextBoxModuleCode"/>
                      </td>
                  </tr>
                </table>
                </div>

                <div>
                  <br />
                  <table class="buttonTable">
                     <tr>
                      <td> 
                    <button class="btns" id="Button1" >Add Module</button>
                      </td> 
                      <td>
                    <button class="btns" onclick="clearAll();" >Clear All</button>
                      </td> 
                     </tr>
                 </table>
                 <br />
              </div>
        </div>


</asp:Content>
