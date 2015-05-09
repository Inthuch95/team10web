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

    function clearAll() {
        document.getElementById("TextBoxModuleName").value = "";
        document.getElementById("TextBoxModuleCode").value = "";
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






















     <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
        DeleteCommand="DELETE FROM [Module] WHERE [moduleID] = @moduleID" 
        InsertCommand="INSERT INTO [Module] ([moduleCode], [moduleTitle]) VALUES (@moduleCode, @moduleTitle)" 
        SelectCommand="SELECT [moduleCode], [moduleTitle], [moduleID] FROM [Module] WHERE ([userID] = @userID)" 
        
        UpdateCommand="UPDATE [Module] SET [moduleCode] = @moduleCode, [moduleTitle] = @moduleTitle WHERE [moduleID] = @moduleID">
            <DeleteParameters>
                <asp:Parameter Name="moduleID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="moduleCode" Type="String" />
                <asp:Parameter Name="moduleTitle" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="userID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="moduleCode" Type="String" />
                <asp:Parameter Name="moduleTitle" Type="String" />
                <asp:Parameter Name="moduleID" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
  

     <br />


    <asp:GridView ID="GridView2" CssClass="table" runat="server" AllowSorting="True" 
        AutoGenerateColumns="False" CellPadding="8" DataKeyNames="moduleID" 
        DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="none" 
        Width="1250px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="moduleCode" HeaderText="moduleCode" 
                SortExpression="moduleCode" />
            <asp:BoundField DataField="moduleTitle" HeaderText="moduleTitle" 
                SortExpression="moduleTitle" />
            <asp:BoundField DataField="moduleID" HeaderText="moduleID" 
                InsertVisible="False" ReadOnly="True" SortExpression="moduleID" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#9D009D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#330066" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#9D009D" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#9D009D" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#9D009D" />
    </asp:GridView>


      <br />


    <div class="table">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:myConnectionString %>" 
        InsertCommand="INSERT INTO [Module] ([moduleCode], [moduleTitle]) VALUES (@moduleCode, @moduleTitle)" 
        
            SelectCommand="SELECT [moduleCode], [moduleTitle] FROM [Module] WHERE ([userID] = @userID)">
        <InsertParameters>
            <asp:Parameter Name="moduleCode" Type="String" />
            <asp:Parameter Name="moduleTitle" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="userID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   </div>


</asp:Content>
