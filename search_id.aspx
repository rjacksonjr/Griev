<%@ Page Language="C#" Title="Search ID" AutoEventWireup="True" Inherits="searchcin" MasterPageFile="masterpagedhs.master" maintainscrollpositiononpostback="true" Codebehind="search_id.aspx.cs" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">

  <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">  
  <contenttemplate>  
  
    

   </contenttemplate>  
</asp:UpdatePanel>                                             
 
<asp:UpdateProgress ID="UpdateProgress2"    
    runat="server"    
    AssociatedUpdatePanelID="UpdatePanel2">  
    <progresstemplate>  
          <img src="Images/loadingBar.gif" />
     
        <div id="loading">
           <asp:Label id="lblProgress2"    
            runat="server"    
            Text="Loading...."    
            Width="200px"    
            BackColor="#FFFF80"    
            ForeColor="Silver"    
            Font-Bold="True"    
            Style="padding: 5px">  
        </asp:Label>    
            </div>
    </progresstemplate>  
</asp:UpdateProgress>

        </asp:Content>

    
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
  
  
      
          
        <asp:LoginName runat="server" ID="LoggedInUN" visible="false" CssClass="username" FormatString="{0}"/>
  

       <br />  <p id="centertext">
            
        </p>
      <div class="jumbotron">
     <h1>Search For Case/Member</h1>
        </div>
   <table class="csform">
  
       <%--<tr>
           <td colspan="3">
               <asp:LinkButton ID="NonMemLinkButton" runat="server" CommandArgument="NonMemView" CommandName="SwitchViewByID" OnClick="NonMemLinkButton_Click" Font-Size="X-Large" Font-Bold="True">Add Non Members</asp:LinkButton>
           </td>
       </tr>--%> <!-- Non Members Link to second tab on update page -->

    
       <tr>
           <td>

    <div id="searchdiv">
        <asp:Label ID="searchmsglbl" runat="server"></asp:Label>
        <br />
      <asp:TextBox ID="searchtb" runat="server"></asp:TextBox>
<asp:Button ID="searchbtn"  runat="server" CssClass="buttonsmall" Text="Search ID"  OnClick="searchbtn_Click" ToolTip="Please only click search one time." />
<asp:Button ID="clearbtn"  runat="server" CssClass="buttonsmall" Text="Clear Search"  OnClick="clear_Click" ToolTip="Please only click search one time."/>
    <br />
         <asp:Label ID="errqryLbl" runat="server" CssClass="label-warning">  </asp:Label>          
    </div><!-- Textbox and button to search for data warehouse ID -->
           </td>
           
           
       </tr> <!-- Search box -->
       <tr>
            
             
             
             <td >
             
<asp:GridView ID ="SearchResultsGV" runat="server"  
    AllowPaging="False" 
    AllowSorting="False" 
    DataKeyNames="MBR_DIM_ID" 
    Font-Bold="False" 
    Font-Italic="False" 
    Font-Overline="False" 
    Font-Size="1em" 
    Font-Strikeout="False" 
    Font-Underline="False" 
    OnLoad="SearchResultsGV_Load" 
    OnRowCommand="SearchResultsGV_RowCommand" 
    ShowHeaderWhenEmpty="True" 
    AutoGenerateColumns="False">
                                 <HeaderStyle CssClass="FixedHeaderPCP" />
                                 
                                 <AlternatingRowStyle CssClass="AltItStyle" />
                                 <RowStyle CssClass="ItStyle" />
                                 
<Columns>
    <asp:TemplateField>
        <HeaderTemplate>
            Action
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Button ID="importbtn" runat="server" CssClass="buttonsmall" text="Import"  CommandArgument='<%#Eval("MBR_PLAN_ID")%>' CommandName="Import" />
                   <ajaxToolkit:ConfirmButtonExtender ID="cbe" runat="server"
    TargetControlID="importbtn"
    ConfirmText="Import Results, continue?"
    ConfirmOnFormSubmit="True" />
        </ItemTemplate>
    </asp:TemplateField>


    <asp:BoundField DataField="MBR_PLAN_ID" HeaderText="Member ID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
    <HeaderStyle Width="140px" HorizontalAlign="Center" />
    </asp:BoundField>
    <asp:BoundField DataField="FIRST_NAME" HeaderText="First Name" ItemStyle-HorizontalAlign="Center">
    <HeaderStyle Width="120px" />
    </asp:BoundField>
    <asp:BoundField DataField="LAST_NAME" HeaderText="Last Name" ItemStyle-HorizontalAlign="Center">
    <HeaderStyle Width="120px" />
    </asp:BoundField>
    <asp:BoundField DataField="GENDER" HeaderText="Gender" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="60" HeaderStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="MAIL_ADDR1" HeaderText="Address" HeaderStyle-Width="140" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="MAIL_CITY" HeaderText="City" HeaderStyle-Width="150" ItemStyle-HorizontalAlign="Center" />
    <asp:BoundField DataField="MAIL_ZIP" HeaderText="Zip" HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
</Columns>
     <EditRowStyle BackColor="#2461BF" />
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
     <RowStyle BackColor="#EFF3FB" />
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
     <SortedAscendingCellStyle BackColor="#F5F7FB" />
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />
     <SortedDescendingCellStyle BackColor="#E9EBEF" />
     <SortedDescendingHeaderStyle BackColor="#4870BE" />                                 


                             </asp:GridView>
  
                         
             </td><!-- GridView that shows you the results after you have searched for a ID -->
                         
 
     
         </tr> <!-- Search results, import button -->
       <tr>
           
       </tr> 
       <tr>
           
           <td colspan="3"><!-- DataTables From JSON ServerSide-->
               
               <asp:Label runat="server" ID="Section15Lbl" Font-Size="Large" >Top 15</asp:Label>

               <table id="SearchIDTbl"> 
                   <thead>
                   <tr>
                       <th>Details</th>
                       <th>FORM ID</th>
                       <th>MEMBER ID</th>
                        <th>MEMBER NAME</th>
                       <th>DOB</th>
                       <th>PCS</th>
                       <th>MCS Received Date</th>
                       <th>CREATED BY</th>
                       
                   </tr>    
                   </thead>
                   <tbody>
                       <tr>
                       <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           <td></td>
                           
                       </tr>
                   </tbody>
                   
               </table>


    
          
    
    
  
    


    <script type="text/javascript">
        $(document).ready(function () {
            $(".searchCFL").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "WebService/SearchLookup.asmx/SearchCFL",
                        dataType: "json",
                        data: "{'Value':'" + request.term + "'}",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.Info,
                                    value: item.CIN,
                                    name: item.Info
                                }
                            }))
                        }
                    });
                },
                minLength: 4,
                select: function (event, ui) {
                    //TO TEST PURPOSE ONLY
                    log(ui.item ? "Selected: " + ui.item.label + " Value: " + ui.item.value + " Name: " + ui.item.name : "Nothing selected, input was " + this.value);
                  //  alert("Function Called");
                    PageMethod.CinIHSS_TB_CINSubmit();
                },

                open: function () {
                    $(this).removeClass("ui-corner-all").addClass("ui-corner-top");
                },
                close: function () {
                    $(this).removeClass("ui-corner-top").addClass("ui-corner-all");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });

        });
        function log(message) {
            $("<div/>").text(message).prependTo("#log");
            $("#log").attr("scrollTop", 0);
        }


        function CinSubmit()
        {
            alert("Function Called");
            PageMethods.CinIHSS_TB_CINSubmit();
        }

    </script> <!-- Old web services -->

    
    <script type="text/javascript">





        /* WORKING JSONP with new mcsRecDate*/
        //the case and spelling of your columns must match 100%

        $(document).ready(function () {
            $('#SearchIDTbl').DataTable({
                "processing": true,
                "serverSide": false,
                "ajax": {
                    "url": "https://webservicesmcs.dhs.lacounty.gov/RavenService/api/Grievance/NewDtData",
                    "dataType": "jsonp",
                    "contentType": "application/json"

                }
                ,
                "columns": [

                { "data": "detailsUrl" },
                { "data": "formId" },
                { "data": "memberId" },
                { "data": "memberName" },
                { "data": "dob" },
                { "data": "pcs" },
                { "data": "mcsRecDate" },
                { "data": "createdBy" }
                ]
            });
        });

        /* WORKING JSONP */
        //the case and spelling of your columns must match 100%

        //$(document).ready(function () {
        //    $('#SearchIDTbl').DataTable({
        //        "processing": true,
        //        "serverSide": false,
        //        "ajax": {
        //            "url": "https://webservicesmcs.dhs.lacounty.gov/RavenService/api/Grievance/DtData",
        //          "dataType": "jsonp",
        //          "contentType": "application/json"
        
        //        }
        //        ,
        //        "columns": [
                
        //        { "data": "detailsUrl" }, 
        //        { "data": "formId" },
        //        { "data": "memberId" },
        //        { "data": "memberName" },
        //        { "data": "dob" },
        //        { "data": "pcs" },
        //        { "data": "incidentDate" },
        //        { "data": "createdBy" }
        //        ]
        //    });
        //});


        /* WORKING ASMX */
        //the case and spelling of your columns must match 100%

        //$(document).ready(function () {
        //    $('#SearchIDTbl').DataTable({
        //        "processing": true,
        //        "serverSide": false,
        //        "ajax": {

        //            "url": "http://webservicesmcs.dev.dhs.lacounty.gov:8080/RavenService/api/Grievance/DtData"
                    
        //        }
        //        ,
        //        "columns": [

        //        { "data": "DetailsUrl" },
        //        { "data": "FormId" },
        //        { "data": "MemberId" },
        //        { "data": "MemberName" },
        //        { "data": "DOB" },
        //        { "data": "PCS" },
        //        { "data": "IncidentDate" },
        //        { "data": "CreatedBy" }
        //        ]
        //    });
        //});

</script> <!-- data tables -->


</asp:Content>