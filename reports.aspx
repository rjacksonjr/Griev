<%@ Page Language="C#" AutoEventWireup="true" Inherits="_Reports" Title="Reports"  MasterPageFile="masterpagedhs.master"  Codebehind="reports.aspx.cs" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

    <asp:Content runat="server" ContentPlaceHolderID="Head">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">  
  <contenttemplate>  
          <div id="clinictb" runat="server" class="floatingtb">
<asp:Label ID="clinicnmlbl" runat="server" /> 
       </div>


   </contenttemplate>  
</asp:UpdatePanel>                                             
    <asp:UpdateProgress ID="UpdateProgress2"    
    runat="server"    
    AssociatedUpdatePanelID="UpdatePanel2">  
    <progresstemplate>  
    
    </progresstemplate>  
</asp:UpdateProgress>     

        </asp:Content>
    <asp:Content runat="server" ContentPlaceHolderID="MainContent">
   
  
  

            <div class="jumbotron">
     <h1>Reports</h1>
        </div>

  <table class="CSForm">
         <tr>
               <!-- Choose Your Clinic: -->
             <td style="vertical-align:top; width: 100px;">
            

        </td>
    <!-- Report Grids -->
                        
    <td style="vertical-align:top; width: 100px;">
  
    </td>

             <!-- Choose your reports -->

        <td>
        <div id="claimsbatchtreportbtns" runat="server" style="background-color:white;" visible="true">
            <asp:RadioButtonList ID="reportradio" runat="server" AutoPostBack="True" OnTextChanged="reportradio_TextChanged" CssClass="radiolistsmall" visible="true">
<asp:ListItem Text="LOA" Value="LOAReport" Selected="False" />
<asp:ListItem Text="Another report" Value="DetailFull" Selected="False" />
</asp:RadioButtonList>
        
            <asp:Button ID="htmlRptBtn"        runat="server"  OnClick="htmlRptBtn_Click"   visible="true"   Text="View Report" CssClass="buttonsmall" Width="100px" /> 
            <br />
            <br />
</div>

                     
                     
</td>
                    
          

    
    </tr>
    </table>

          <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">  
  <contenttemplate>

       </contenttemplate>  
        <Triggers>        
            
            
</Triggers>
</asp:UpdatePanel>                                             
   
    <asp:UpdateProgress ID="UpdateProgress1"    
    runat="server"    
    AssociatedUpdatePanelID="UpdatePanel1">  
    <progresstemplate>  
  
      
        <asp:Panel ID="loadingpnl" runat="server">
          <img src="Images/loadingBar.gif" />
            </asp:Panel>
       <ajaxToolkit:AlwaysVisibleControlExtender ID="AlwaysVisibleControlExtender1" runat="server"
    TargetControlID="loadingpnl"         
    VerticalOffset="100"
    HorizontalSide="Center"
    HorizontalOffset="25"
    ScrollEffectDuration=".1"/>
    </progresstemplate>  
</asp:UpdateProgress>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    
</asp:Content>
