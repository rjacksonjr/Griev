<%@ Page Language="C#" AutoEventWireup="True" Inherits="_RptViewer" Title="Reports" MasterPageFile="masterpagedhs.master" Codebehind="rptviewer.aspx.cs" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">


        <rsweb:ReportViewer ID="RptViewerSum" runat="server" Font-Names="Verdana" Font-Size="8pt"
        Height="800px" Width="100%" 
            WaitMessageFont-Names="Verdana" 
            WaitMessageFont-Size="14pt" 
            DocumentMapCollapsed="True" 
            BackColor="White" 
            DocumentMapWidth="15%" 
            EnableTheming="False" 
            ZoomMode="PageWidth" 
            ToolTip="Export to excel, Do Not Print" 
            AsyncRendering="True" 
            ProcessingMode="Local" 
            ShowBackButton="False" 
            ShowPrintButton="False" 
            ShowRefreshButton="False"
            
            >
     
    </rsweb:ReportViewer>

<asp:SqlDataSource ID="DataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS%>" providerName="<%$ ConnectionStrings:OraConnectionStringMS.providerName %>" >

</asp:SqlDataSource>
    


    </asp:Content>