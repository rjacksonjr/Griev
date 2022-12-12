<%@ Page Language="C#" MasterPageFile="MasterPageDHS.master" Inherits="Login" Title="Login" Codebehind="Login.aspx.cs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<br />

   
<div runat="server" id="logindiv" class="panel-primary col-lg-4">
    <div class="panel-heading">
        Login
    </div>
    <div class="panel-body">
 <asp:Label ID="lblUserName" runat="server" Text="User Name:">
		 </asp:Label>

         <ajaxToolkit:BalloonPopupExtender ID="PopupControlExtender2" runat="server"
        TargetControlID="txtUserName"
        BalloonPopupControlID="unpopuppnl"
        Position="Auto" 
        BalloonStyle="Cloud"
        BalloonSize="Medium"
        CustomCssUrl="/styles/BalloonPopupOvalStyle.css"
        CustomClassName="oval"
        UseShadow="true" 
        ScrollBars="Auto"
        DisplayOnMouseOver="false"
        DisplayOnFocus="false"
        DisplayOnClick="true" />
                    <asp:TextBox ID="txtUserName" runat="server" 
                        ToolTip="Please type in c# for contractors, e# for employees"  TabIndex="1" 
                        ></asp:TextBox>
                
                    <asp:Panel ID="unpopuppnl" runat="server" >
                        Please enter your HOSTED E# for employees, C# for contractors.
                    </asp:Panel>

    </div>
    <div class="panel-body">

          <asp:Label ID="lblPassword" runat="server" Text="Password:">
                       
		  </asp:Label>

        <ajaxToolkit:BalloonPopupExtender ID="BalloonPopupExtender1" runat="server"
        TargetControlID="txtPassword"
        BalloonPopupControlID="pwpopuppnl"
        Position="Auto" 
        BalloonStyle="Cloud"
        BalloonSize="Medium"
        CustomCssUrl="/styles/BalloonPopupOvalStyle.css"
        CustomClassName="oval"
        UseShadow="true" 
        ScrollBars="Auto"
        DisplayOnMouseOver="false"
        DisplayOnFocus="True"
        DisplayOnClick="true" />
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                        ToolTip="Please enter your HOSTED domain password." TabIndex="2" ></asp:TextBox>
                     <asp:Panel ID="pwpopuppnl" runat="server" >
                        Use the same password used at your LA County workstations computer.
                    </asp:Panel>

        <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" CssClass="btn btn-default" 
                        Text="Login" TabIndex="3" />
     <asp:Panel runat="server" ID="errorloginpnl" visible="False">
<div class="alert alert-danger alert-dismissible" role="alert" >
<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <asp:Label ID="errLogin" runat="server"/>
</div>    
      </asp:Panel>   
            
   
      
    </div>
    <div class="panel-footer">
               <a href="http://mylacounty.gov/wps/portal/mylac/forget">I forgot my password</a>
           
        </div>
    </div>
    
         
<script type="text/javascript">
    window.onload = function () {
        var oInput = document.getElementById("<%=txtUserName.ClientID%>");
        oInput.focus();
        oInput.value += "";
    };
</script>
    
    
    
    
</asp:Content>