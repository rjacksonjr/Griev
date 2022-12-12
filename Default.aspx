<%@ Page Language="C#" Title="Grievance Home" AutoEventWireup="true" Inherits="_Default" MasterPageFile="~/masterpagedhs.master" Codebehind="Default.aspx.cs" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">

<br />    
        <asp:LoginName runat="server" ID="LoggedInUN" visible="false" CssClass="username" FormatString="{0}"/>
   
    
    

    

        
  <p> Use the buttons or top menu to begin.</p>
    
    
   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
       
 <div class="jumbotron">
  <h1>Grievance</h1>
  <p>Welcome to Grievance</p>
   <table class="CSForm">
        <tr>
       
            <td style="vertical-align:top; width: 100px;">
                <a href="search_id.aspx">
                <asp:Button ID="revtn" runat="server" Text="Search ID" CssClass="buttonsmall" PostBackUrl="search_id.aspx" />
                <p>Step 1: Search ID.</p>
                    </a>
            </td>
                 <td style="vertical-align:top; width: 100px;">
                <a href="update_fm.aspx">
                <asp:Button ID="ImpBtn" runat="server" Text="Update Data" CssClass="buttonsmall" PostBackUrl="update_fm.aspx" />
                <p>Step 2: Update Grievance.</p>
                    </a>
            </td>
            <td style="vertical-align:top; width: 100px;">
                <a href="reports.aspx">
                <asp:Button ID="rep" runat="server" Text="Reports" CssClass="buttonsmall" PostBackUrl="reports.aspx" />
                <p>Step 3: Generate Reports.</p>
                </a>
            </td>
        </tr>
       <tr>
           <td colspan="3">
       
           </td>
       </tr>
    </table> 
</div>
    
     

</ContentTemplate>
       
    <Triggers>        
    
</Triggers>

    </asp:UpdatePanel>
   <asp:UpdateProgress ID="UpdateProgress1"    
    runat="server"    
    AssociatedUpdatePanelID="UpdatePanel1">  
    <progresstemplate>  
  
        <img src="Images/loadingBar.gif" />

        <asp:Label id="lblProgress"    
            runat="server"    
            Text="Loading...."    
            Width="200px"    
            BackColor="#FFFF80"    
            ForeColor="Silver"    
            Font-Bold="True"    
            Style="padding: 5px">  
        </asp:Label>    
    </progresstemplate>  
</asp:UpdateProgress>
 
    </asp:Content>

