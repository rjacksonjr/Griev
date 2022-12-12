<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDHS.master" AutoEventWireup="true" Inherits="update_fm" Codebehind="update_fm.aspx.cs" MaintainScrollPositionOnPostback="True" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel" runat="server" UpdateMode="Conditional">
   
    </asp:UpdatePanel>
      

    <div class="jumbotron">
     <h1>Update Case</h1>
          <asp:Label ID="debuglbl" runat="server" />
        </div>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="MemeberView" runat="server">
       
            
            
             <asp:SqlDataSource ID="SqlDataID" runat="server" 
                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>">

            </asp:SqlDataSource>
           
            <%--<asp:LinkButton ID="NonMemLinkButton" runat="server" CommandArgument="NonMemView" CommandName="SwitchViewByID"  Font-Size="X-Large" Font-Bold="True">Go To Non Members</asp:LinkButton>--%>
            &nbsp;<br /> 
            <br />
            Search Entered Grievance:<br />
            <asp:DropDownList ID="MBR_ID_DDL" runat="server" AutoPostBack="True" DataSourceID="SqlDataID" DataTextField="INFO" DataValueField="FORM_ID" OnDataBound="MBR_ID_DDL_DataBound" OnSelectedIndexChanged="MBR_ID_DDL_SelectedIndexChanged1">
            </asp:DropDownList>
            
            <asp:TextBox ID="TextBox13" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
            <asp:TextBox ID="TextBox14" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
            <asp:TextBox ID="ModBy_TB" runat="server" Visible="false"></asp:TextBox>
            


            <asp:SqlDataSource ID="SqlDataSourceMS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                            ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>" 
                            UpdateCommandType="Text">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox14" Name="FORM_ID" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>                    
                    <asp:ControlParameter ControlID="ModBy_TB" Name="MODIFIED_BY" PropertyName="Text" />
                    <asp:ControlParameter ControlID="FormView1" Name="mcs_received_date" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="MCS_DUE_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="time_received" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="coordinator" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="case_type" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="request_type" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="related_case_id" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="incident_date" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="location_incident" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="resolution_cd" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="griev_cd" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="griev_summary" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="gna_notes" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="case_due_date" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="contact" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="SI_CASE_NO" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="MCS_CGC_SENT_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="DHS_FAC_SENT_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="MCS_CGC_RECD_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="DHS_FAC_RECD_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="FormView1" Name="CASE_CLOSED_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="TextBox14" Name="FORM_ID" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlGriev_CD" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                                                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>">
                                                
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Sql_AH_PCS" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                                                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>">
                                                
            </asp:SqlDataSource>
            


            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSourceMS" DefaultMode="Edit" OnDataBound="FormView1_DataBound" Width="1010px" BackColor="White">
                                <EditItemTemplate>
                                    <div class="panel panel-success">  
                                        <div class="panel-heading" style="height:30px;">
                                         <h1 class="panel-title" style="text-align:left">Case Information:</h1>
                                        </div>
                                       <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Form #:</span><br /> 
                                                    <asp:TextBox ID="Form_ID_TBX" runat="server" ReadOnly="True" Text='<%# Bind("FORM_ID") %>' Width="100px"></asp:TextBox>
                                                </div>
                                                
                                                <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Case ID:</span><br /> 
                                                    <asp:TextBox ID="case_ID_TBX" runat="server" ReadOnly="True" Text='<%# Eval("case_ID") %>' Width="100px"></asp:TextBox>
                                                </div> 
                                                <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Created By:</span><br /> 
                                                    <asp:TextBox ID="Created_by_TBX" runat="server" ReadOnly="True" Text='<%# Eval("created_by") %>' Width="140px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Create Date:</span><br />
                                                    <asp:TextBox ID="create_date_TBX" runat="server" ReadOnly="True" Text='<%# Eval("create_date", "{0:dd-MMM-yyyy}") %>' Width="100px"></asp:TextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Modified By:</span><br /> 
                                                    <asp:TextBox ID="modified_by_TBX" runat="server" ReadOnly="True" Text='<%# Eval("modified_by", "{0:dd-MMM-yyyy}") %>' Width="140px"></asp:TextBox>
                                                </div>
                                            </div>
                                           <div class="row">
                                               
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">MCS Recd Date:</span><br />
                                                    <asp:TextBox ID="MCS_DT_TBX" runat="server" Text='<%# Bind("mcs_received_date", "{0:dd-MMM-yyyy}") %>' Width="100px" BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="DateUpdateCalEx" runat="server" Format="dd-MMM-yyyy" TargetControlID="MCS_DT_TBX" TodaysDateFormat="dd-MMM-yyyy" />
                                               </div>
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Time Received:</span><br />
                                                    <asp:TextBox id="time_received_TB"  runat="server" ReadOnly="false" Text='<%# Bind("time_received") %>' Width="100px" BackColor="#E9E9E9"></asp:TextBox>                                                
                                               </div>
                                               <div class="col-md-3">
                                                    <span style="font-size:small; font-weight:bold">Coordinator:</span><br />
                                                   <asp:DropDownList ID="CoordDDL" runat="server" SelectedValue='<%# Bind("coordinator") %>' AppendDataBoundItems="True" BackColor="#E9E9E9">
                                                                <asp:ListItem Text="Select" Value="" />
                                                                <asp:ListItem Value="Arjang Bayginejad">Arjang Bayginejad</asp:ListItem>
                                                                <asp:ListItem Value="Bertha Vazquez">Bertha Vazquez</asp:ListItem>
                                                                <asp:ListItem Value="Cindy Hernandez">Cindy Hernandez</asp:ListItem>
                                                                <asp:ListItem Value="Darlene Wells">Darlene Wells</asp:ListItem>
                                                                <asp:ListItem Value="Difawn Long">Difawn Long</asp:ListItem>
                                                                <asp:ListItem Value="Giovanni Rivera">Giovanni Rivera</asp:ListItem>
                                                                <asp:ListItem Value="John Shen">John Shen</asp:ListItem> 
                                                                <asp:ListItem Value="Marlene Vasquez">Marlene Vasquez</asp:ListItem>
                                                                <asp:ListItem Value="Michael Patrick Tadeo">Michael Tadeo</asp:ListItem>                                                                
                                                                <asp:ListItem Value="David Nguyen">David Nguyen</asp:ListItem>
                                                                <asp:ListItem Value="Michael Tadeo">Michael Tadeo</asp:ListItem>
                                                                <asp:ListItem Value="Regina Caballes">Regina Caballes</asp:ListItem>                                                                                                                       
                                                                
                                                  </asp:DropDownList>
                                               </div>
                                               <div class="col-md-2">
                                                <span style="font-size:small; font-weight:bold">Case Type:</span><br />
                                                <asp:DropDownList ID="Case_Type_DDL" runat="server" SelectedValue='<%# Bind("case_type") %>' AppendDataBoundItems="True" BackColor="#E9E9E9">
                                                                <asp:ListItem Text="Select" Value="" />
                                                                <asp:ListItem Value="Clinical">Clinical</asp:ListItem>
                                                                <asp:ListItem Value="Disenrollment">Disenrollment</asp:ListItem>
                                                                <asp:ListItem Value="Non-Clinical">Non-Clinical</asp:ListItem>
                                                                <asp:ListItem Value="Transfer">Transfer</asp:ListItem>
                                                                                         
                                                                 
                                                 </asp:DropDownList>
                                               </div>
                                               <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Request Type:</span><br />
                                                <asp:DropDownList ID="Request_Type_DDL" runat="server" SelectedValue='<%# Bind("request_type") %>' AppendDataBoundItems="True" BackColor="#E9E9E9">
                                                                <asp:ListItem Text="Select" Value="" />
                                                                <asp:ListItem Value="Appeal">Appeal</asp:ListItem>
                                                                <asp:ListItem Value="Expedited">Expedited(72 Hours)</asp:ListItem>
                                                                <asp:ListItem Value="DMHC">DMHC</asp:ListItem>
                                                                <asp:ListItem Value="DHS Provider Grievances Request">DHS Provider Grievances Request</asp:ListItem>
                                                                <asp:ListItem Value="IMR">IMR</asp:ListItem>
                                                                <asp:ListItem Value="PQI">PQI</asp:ListItem>
                                                                <asp:ListItem Value="Routine7">Routine (7 Days)</asp:ListItem>
                                                                <asp:ListItem Value="Routine10">Routine (10 Days)</asp:ListItem>
                                                                <asp:ListItem Value="Routine60">Routine (60 Days)</asp:ListItem>
                                                                <asp:ListItem Value="Stat">Stat (24 Hours or Less)</asp:ListItem>
                                                                <asp:ListItem Value="State">State Fair Hearing</asp:ListItem>
                                                                
                                                                
                                                  </asp:DropDownList>
                                               </div>
                                           </div>
                                           <div class="row">
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">SI Case# :</span><br />
                                                    <asp:TextBox ID="SI_CASE_TBX" runat="server" Text='<%# Bind("SI_CASE_NO") %>' Width="100px" BackColor="#E9E9E9"></asp:TextBox>
                                             </div>
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Date Sent to MCS-CGC:</span><br />
                                                    <asp:TextBox id="MCS_CGC_SENT_DATE_TBX"  runat="server" Text='<%# Bind("MCS_CGC_SENT_DATE", "{0:dd-MMM-yyyy}") %>'  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MMM-yyyy" TargetControlID="MCS_CGC_SENT_DATE_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                               </div>
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Date Sent to DHS Fac:</span><br />
                                                    <asp:TextBox id="DHS_FAC_SENT_DATE_TBX"  runat="server" Text='<%# Bind("DHS_FAC_SENT_DATE", "{0:dd-MMM-yyyy}") %>'  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MMM-yyyy" TargetControlID="DHS_FAC_SENT_DATE_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                               </div>
                                               <div class="col-md-3">
                                                    <span style="font-size:small; font-weight:bold">Rec’d from MCS-CGC:</span><br />
                                                    <asp:TextBox id="MCS_CGC_RECD_DATE_TBX"  runat="server" Text='<%# Bind("MCS_CGC_RECD_DATE", "{0:dd-MMM-yyyy}") %>'  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" Format="dd-MMM-yyyy" TargetControlID="MCS_CGC_RECD_DATE_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                               </div>
                                               <div class="col-md-3">
                                                    <span style="font-size:small; font-weight:bold">Date Rec’d from DHS Fac:</span><br />
                                                    <asp:TextBox id="DHS_FAC_RECD_DATE_TBX"  runat="server" Text='<%# Bind("DHS_FAC_RECD_DATE", "{0:dd-MMM-yyyy}") %>'  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender6" runat="server" Format="dd-MMM-yyyy" TargetControlID="DHS_FAC_RECD_DATE_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                               </div>  
                                           </div>
                                           <div class="row">
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">MCS Due Date:</span><br />
                                                    <asp:TextBox id="mcs_due_date_TBX"  runat="server" Text='<%# Bind("mcs_due_date", "{0:dd-MMM-yyyy}") %>' Width="100px"  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yyyy" TargetControlID="mcs_due_date_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                               </div>
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Case Closed Date:</span><br />
                                                    <asp:TextBox id="CASE_CLOSED_DATE_TBX"  runat="server" Text='<%# Bind("CASE_CLOSED_DATE", "{0:dd-MMM-yyyy}") %>'  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender7" runat="server" Format="dd-MMM-yyyy" TargetControlID="CASE_CLOSED_DATE_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                                </div> 
                                               <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Case Due Date:</span><br />
                                                    <asp:TextBox id="case_due_date_TBX"  runat="server" Text='<%# Bind("case_due_date", "{0:dd-MMM-yyyy}") %>'  BackColor="#E9E9E9"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender10" runat="server" Format="dd-MMM-yyyy" TargetControlID="case_due_date_TBX" TodaysDateFormat="dd-MMM-yyyy" />                                                
                                                </div>
                                                <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">Related Case ID:</span><br />
                                                    <asp:TextBox ID="Rel_Case_TBX" runat="server" Text='<%# Bind("related_case_id") %>' BackColor="#E9E9E9"></asp:TextBox>
                                                </div>                                               

                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                    <span style="font-size:small; font-weight:bold">PITG Case ID:</span><br />
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("OLD_CASE") %>' ReadOnly="true" ></asp:TextBox>
                                             </div>
                                            <div class="col-md-7">
                                                    <span style="font-size:small; font-weight:bold">PITG Incident Location:</span><br />
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("PITG_INCIDENT") %>' ReadOnly="true"  Width="350px"></asp:TextBox>
                                             </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2">
                                                 <span style="font-size:small; font-weight:bold">Incident Date:</span><br />
                                                 <asp:TextBox ID="incident_date_TBX" runat="server" Text='<%# Bind("incident_date", "{0:dd-MMM-yyyy}") %>' Width="100px" BackColor="#E9E9E9"></asp:TextBox>
                                                 <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" Format="dd-MMM-yyyy" TargetControlID="incident_date_TBX" TodaysDateFormat="dd-MMM-yyyy" />
                                            </div>
                                            <div class="col-md-5">
                                                <span style="font-size:small; font-weight:bold">Incident Location :</span><br /> 
                                                <asp:DropDownList ID="location_incident_DDL" runat="server" SelectedValue='<%# Bind("location_incident") %>' DataSourceID="Sql_AH_PCS" DataTextField="ah1_ce_name" DataValueField="ah1_ce_name" AppendDataBoundItems="True" AutoPostBack="True" BackColor="#E9E9E9">
                                                                <asp:ListItem Text="Select" Value="" />
                                                                <asp:ListItem Text="DHS-Managed Care Services" Value="DHS-Managed Care Services" />
                                                                <asp:ListItem Text="DHS" Value="DHS" />
                                                                <asp:ListItem Text="Health Plan" Value="Health Plan" />
                                                                <asp:ListItem Text="OON Services Provider" Value="OON Services Provider" /> 
                                                 </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Resolution Code:</span><br /> 
                                                <asp:DropDownList ID="Resolution_CD_DDL" runat="server" SelectedValue='<%# Bind("resolution_cd") %>' AppendDataBoundItems="True" BackColor="#E9E9E9">
                                                    <asp:ListItem Text="Select" Value="" />
                                                    <asp:ListItem Value="Denial of Medical Home Change Only">Denial of Medical Home Change Only</asp:ListItem>
                                                    <asp:ListItem Value="Fully In Favor of Participant">Fully In Favor of Participant</asp:ListItem>
                                                    <asp:ListItem Value="Fully In Favor of Provider">Fully In Favor of Provider</asp:ListItem>
                                                    <asp:ListItem Value="In Favor of MHLA Program">In Favor of MHLA Program</asp:ListItem>
                                                    <asp:ListItem Value="In Favor of Participant Medical Home Change Only">In Favor of Participant Medical Home Change Only</asp:ListItem>
                                                    <asp:ListItem Value="Partially In Favor of Participant/Provider">Partially In Favor of Participant/Provider</asp:ListItem>
                                                    <asp:ListItem Value="Patient was Disenrolled out of DHS Network">Patient was Disenrolled out of DHS Network</asp:ListItem>
                                                    <asp:ListItem Value="Patient was transferred to another DHS Facility">Patient was transferred to another DHS Facility</asp:ListItem>
                                                    <asp:ListItem Value="Request Denied for Transfer/Disenrollment">Request Denied for Transfer/Disenrollment</asp:ListItem>
                                                    <asp:ListItem Value="Withdraw">Withdraw</asp:ListItem>                   
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            
                                            <div class="col-md-9">
                                                <span style="font-size:small; font-weight:bold">Grievance Code:</span><br /> 
                                                <asp:DropDownList ID="griev_cd_DDL" runat="server" SelectedValue='<%# Bind("griev_cd") %>' DataSourceID="SqlGriev_CD" DataTextField="GRIEV_DESC" DataValueField="GRIEV_CD" AppendDataBoundItems="True" BackColor="#E9E9E9" AutoPostBack="True">
                                                    <asp:ListItem Text="Select" Value="" />
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-2">
                                                <span style="font-size:small; font-weight:bold">HP Contact:</span><br />
                                                <asp:TextBox ID="Contact_TBX" runat="server" Text='<%# Bind("contact") %>' Width="150px" BackColor="#E9E9E9"></asp:TextBox>
                                            </div>      
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <span style="font-size:small; font-weight:bold">Grievance Summary:</span><br />
                                                <asp:TextBox ID="Griev_Sum_TBX" runat="server" Text='<%# Bind("griev_summary") %>' Width="600px" Height="60px" TextMode="MultiLine" BackColor="#E9E9E9"></asp:TextBox>
                                            </div>                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <span style="font-size:small; font-weight:bold">G&A Notes:</span><br />
                                                <asp:TextBox ID="gna_notes_TBX" runat="server" Text='<%# Bind("gna_notes") %>' Width="600px" Height="60px" TextMode="MultiLine" BackColor="#E9E9E9"></asp:TextBox>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
   <%------------------------Member---------------------------------------------------------------------%>
                                    <div class="panel panel-warning">  
                                        <div class="panel-heading" style="height:30px;">
                                         <h1 class="panel-title" style="text-align:left">Member Information:</h1>
                                        </div>
                                       <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Line Of Business:</span><br /> 
                                                <asp:TextBox ID="LOB_DESC_TBX" runat="server" Text='<%# Eval("LOB_DESC") %>' Width="200px" ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Member ID:</span><br /> 
                                                <asp:TextBox ID="mbr_plan_id_TBX" runat="server" Text='<%# Eval("mbr_plan_id") %>' ReadOnly="True"></asp:TextBox>
                                            </div>
                                                                                        
                                         </div>                                       
                                        <div class="row">
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Member First Name:</span><br /> 
                                                <asp:TextBox ID="FName_TBX" runat="server" Text='<%# Eval("first_name") %>' ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Member Last Name:</span><br /> 
                                                <asp:TextBox ID="LName_TBX" runat="server" Text='<%# Eval("last_name") %>' ReadOnly="True"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2">
                                                <span style="font-size:small; font-weight:bold">Gender:</span><br /> 
                                                <asp:TextBox ID="Gender_TBX" runat="server" Text='<%# Eval("GENDER") %>' ReadOnly="true" Width="40px"></asp:TextBox>
                                            </div>
                                            <div class="col-md-2">
                                                <span style="font-size:small; font-weight:bold">DOB:</span><br /> 
                                                <asp:TextBox ID="DOB_TBX" runat="server" Text='<%# Eval("DOB_DATE", "{0:dd-MMM-yyyy}") %>' ReadOnly="true" Width="100px"></asp:TextBox>
                                            </div>
                                        </div>                                        
                                        <div class="row">
                                            <div class="col-md-5">
                                                <span style="font-size:small; font-weight:bold">Primary Care Provider:</span><br /> 
                                                <asp:TextBox ID="PCP_TBX" runat="server" Height="22px" Text='<%# Eval("PCP") %>' ReadOnly="true" Width="350px"></asp:TextBox> 
                                            </div>
                                            <div class="col-md-4">
                                                <span style="font-size:small; font-weight:bold">PCS:</span><br /> 
                                                <asp:TextBox ID="PCS_TBX" runat="server" Height="22px" Text='<%# Eval("PCS") %>' ReadOnly="true" Width="350px"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Affiliated Hospital:</span><br /> 
                                                <asp:TextBox ID="AH_name_TBX" runat="server" Height="22px" Text='<%# Eval("ah1_ce_name") %>' ReadOnly="true" Width="350px"></asp:TextBox>
                                            </div>
                                         </div>
                                                                                      
                                    </div>
                                    </div>                
                                    

                                                                                         
                                        </div>
                                        
                                         
                                        </div>
                                    </div>                            
                                     <div id="buttons" class="accordionContent" style="text-align: center; border: thin solid #C0C0C0">
                                        <%--<asp:CompareValidator ID="Compare_dates" 
                                            runat="server" 
                                            SetFocusOnError="true" 
                                            ControlToValidate="incident_date_TBX" 
                                            ControlToCompare="MCS_DT_TBX" 
                                            Type="Date" 
                                            Operator="GreaterThan"
                                            ErrorMessage="Date must be after Incident Date"></asp:CompareValidator> --%>
                                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Update" CssClass="button" Font-Size="Larger" TabIndex="16" Text="Update Case" UseSubmitBehavior="False" />

                                        
                                        <br />
                                        REF #:
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("FORM_ID")%>' />
                                        | Created By:
                                        <asp:Label ID="ENTEREDBYLabel" runat="server" Text='<%# Eval("CREATED_BY")%>' />
                                        | Modified:
                                        <asp:Label ID="MODIFIEDLabel" runat="server" Text="<%# DateTime.Now %>" />
                                        | Modified By:
                                        <asp:Label ID="MODIFIED_BY_lbl" runat="server" Text='<%# Eval("MODIFIED_BY")%>' />
                                        <br />
                                    </div>
                                </EditItemTemplate>
                            </asp:FormView>
            <div class="accordionContent">
            </div>
            <ajaxToolkit:Accordion ID="MyAccordion" runat="server" AutoSize="None" ContentCssClass="accordionContent" FadeTransitions="false" FramesPerSecond="40" 
                HeaderCssClass="accordionHeader" HeaderSelectedCssClass="accordionHeaderSelected" Height="471px" RequireOpenedPane="false" SelectedIndex="0" 
                SuppressHeaderPostbacks="true" TransitionDuration="250" Visible="False" BackColor="White">
                <Panes>
                    <%--<ajaxToolkit:AccordionPane ID="CPTPane">
                        
                            
                        <Header>
                            CPT
                        </Header>
                        <Content>
                            <asp:FormView ID="FormView_CPT" runat="server" DataSourceID="SqlCPT_TB" DefaultMode="Insert" Visible="True">
                                <InsertItemTemplate>
                                    <div class="panel panel-primary">  
                                        <div class="panel-heading" style="height:30px; width:900px">
                                         <h1 class="panel-title" style="text-align:left">CPT:</h1>
                                        </div>
                                       <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <span style="font-size:small; font-weight:bold">CPT:</span><br /> 
                                                <!-- CPT WebService SearchBox -->
                                                <asp:TextBox runat="server" id="cptcodes" Text='<%# Bind("CPT_DESC") %>' style="width:350px" class="searchcpt" placeholder="CPT Code or Description"/> 
                                                
                                            </div>
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Number Of Service Reqd:</span><br />                                                 
                                                <asp:TextBox ID="NOS_TB" runat="server" Text='<%# Bind("NOS") %>'></asp:TextBox>                                                
                                            </div>
                                            <div class="col-md-3">
                                                <span style="font-size:small; font-weight:bold">Number Of Service Apprd:</span><br />                                                 
                                                <asp:TextBox ID="NOA_TB" runat="server" Text='<%# Bind("NOA") %>'></asp:TextBox>
                                                <asp:TextBox ID="CPT_CD_TB" runat="server"  Text='<%# Bind("CPT_CD") %>' class="CPTCodeClass" ></asp:TextBox>
                                               
                                            </div>
                                        </div>
                                        </div>

                                    </div>
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" commandname="Insert" text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" commandname="Cancel" text="Cancel" />
                                </InsertItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="SqlCPT_TB" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>"
                                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox14" Name="LOG_ID" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="FormView_CPT" Name="CPT_DESC" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="FormView_CPT" Name="NOS" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="FormView_CPT" Name="NOA" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="FormView_CPT" Name="CPT_CD" PropertyName="SelectedValue" />                                     
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox14" Name="LOG_ID" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <%--<asp:ControlParameter ControlID="GridView3" Name="CPT_ID" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="GridView3" Name="NOS" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="GridView3" Name="NOA" PropertyName="SelectedValue" />
                                </UpdateParameters>
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="GridView3" Name="CPT_ID" PropertyName="SelectedValue" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                            &nbsp;
                            
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlCPT_TB" ForeColor="#333333" Width="900px" GridLines="None" AutoGenerateEditButton="True" AutoGenerateDeleteButton="true" DataKeyNames="CPT_ID">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="CPT_ID" HeaderText="CPT #" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="CPT_CD"  HeaderText="CPT Code" ReadOnly="True"/>
                                    <asp:BoundField DataField="CPT_DESC" HeaderText="CPT" ReadOnly="True">
                                    <HeaderStyle Width="400px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NOS"  HeaderText="Number Of Service Reqd" />
                                    <asp:BoundField DataField="NOA"  HeaderText="Number Of Service Apprv" />
                                </Columns>
                                
                                <EditRowStyle BackColor="#e7effb" />
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
                        
                        </Content>
                    </ajaxToolkit:AccordionPane>--%>
                    <ajaxToolkit:AccordionPane ID="CommentsPane">
                        <Header>
                            Comments
                        </Header>
                        <Content>
                            
                            <asp:SqlDataSource ID="SqlDataSourceComments" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox14" Name="FORM_ID" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="FormView2" Name="COMMENTS" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="FormView2" DefaultValue="M" Name="COM_TYPE" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox14" Name="FORM_ID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <asp:FormView ID="FormView2" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CssClass="CSForm" DataSourceID="SqlDataSourceComments" DefaultMode="Insert" Visible="True" Width="367px">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="LOG_IDTextBox" runat="server" Text='<%# Bind("FORM_ID") %>' Visible="False" />
                                    <asp:TextBox ID="COM_TP_TB" runat="server" Text='<%# Bind("COM_TYPE") %>' Visible="False" />
                                    <br />
                                    <strong><span style="font-size: large">COMMENTS:</span></strong><br />
                                    <asp:TextBox ID="COMMENTSTextBox" runat="server" Text='<%# Bind("COMMENTS") %>' Width="700" Height="60" TextMode="MultiLine" />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" commandname="Insert" text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" commandname="Cancel" text="Cancel" />
                                </InsertItemTemplate>
                            </asp:FormView>
                           
                             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceComments" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="CASE_COM_ID" HeaderText="Comment #">
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="COMMENTS" HeaderText="Comments" />
                                    <asp:BoundField DataField="COM_DT" HeaderText="Entered Date" DataFormatString="{0:d}" />
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
                                
                        </Content>
                    </ajaxToolkit:AccordionPane>
                    <%--<ajaxToolkit:AccordionPane ID="COCCommentsPane">
                        <Header>
                            COC Comments
                        </Header>
                        <Content>
                            <asp:SqlDataSource ID="SqlCommentsCOC" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="TextBox14" Name="LOG_ID" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="COCFormView" Name="COMMENTS" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="COCFormView" DefaultValue="COC" Name="COM_TYPE" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox14" Name="LOG_ID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:FormView ID="COCFormView" runat="server" AllowPaging="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CssClass="CSForm" DataSourceID="SqlCommentsCOC" DefaultMode="Insert" Visible="True" Width="367px">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="LOG_IDTextBox" runat="server" Text='<%# Bind("LOG_ID") %>' Visible="False" />
                                    <asp:TextBox ID="COM_TP_TB" runat="server" Text='<%# Bind("COM_TYPE") %>' Visible="False" />
                                    <br />
                                    <strong><span style="font-size: large">COC COMMENTS:</span></strong> &nbsp;<asp:TextBox ID="COMMENTSTextBox" runat="server" Text='<%# Bind("COMMENTS") %>' Width="700" Height="60" TextMode="MultiLine" />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" commandname="Insert" text="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" commandname="Cancel" text="Cancel" />
                                </InsertItemTemplate>
                            </asp:FormView>
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlCommentsCOC" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="COM_ID" HeaderText="Comment #">
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="COMMENTS" HeaderText="Comments" />
                                    <asp:BoundField DataField="COM_DT" HeaderText="Entered Date" DataFormatString="{0:d}" />
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
                        </Content>
                    </ajaxToolkit:AccordionPane>--%>
                    <ajaxToolkit:AccordionPane ID="LetterPane">
                        <Header>
                            Letters
                        </Header>
                        <Content>
                            <asp:LinkButton ID="LOAButton" ForeColor="#cc3300" runat="server" OnClick="LOAButton_Click">LOA Letter</asp:LinkButton><br />
                            <asp:LinkButton ID="ApprovalButton" ForeColor="#cc3300" runat="server" OnClick="ApprovalButton_Click">Approval Letter</asp:LinkButton>
                        </Content>
                    </ajaxToolkit:AccordionPane>

                </Panes>
            </ajaxToolkit:Accordion>
        </asp:View>
        <asp:View ID="NonMemView" runat="server">
            <asp:LinkButton ID="MemLinkButton" runat="server" CommandArgument="MemeberView" OnClick="MemLinkButton_Click1" CommandName="SwitchViewByID" Font-Size="X-Large" Font-Bold="True">Go To Members</asp:LinkButton>
            <br />
            <br />
            
            
            <asp:SqlDataSource ID="FLDOBSql" runat="server" 
                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>" >

            </asp:SqlDataSource>
           
            
             <asp:DropDownList ID="FLDOB_DD" runat="server" DataSourceID="FLDOBSql" AppendDataBoundItems="True" DataTextField="FLDOB" DataValueField="LOG_ID" AutoPostBack="True" OnSelectedIndexChanged="FLDOB_DD_SelectedIndexChanged">
                <asp:ListItem Text="Select" Value="" />
            </asp:DropDownList>
            <asp:TextBox ID="LOG_ID_HOLDER_TB" runat="server" Visible="False"></asp:TextBox>
            
            
            <asp:SqlDataSource ID="NonMemSql" runat="server" 
                ConnectionString="<%$ ConnectionStrings:OraConnectionStringMS %>" 
                ProviderName="<%$ ConnectionStrings:OraConnectionStringMS.ProviderName %>" 
                SelectCommand="SELECT * FROM VW_ms_umlog_nonmain_DEV WHERE LOG_ID = :LOG_ID"
                InsertCommand="insert into MS_UMLOG_NONMAIN_DEV
                                (LOG_ID, CALLER, CALLER_NO, CALL_DATE, FAX_DATE, FNAME, LNAME, GENDER, DOB, CIN, PHONE, ADDRESS, CITY, ZIP, AFF_HOSP, ENTERED_BY) 
                                VALUES
                        (LOG_ID.NEXTVAL, :CALLER, :CALLER_NO, :CALL_DATE, :FAX_DATE, :FNAME, :LNAME,:GENDER, :DOB, :CIN, :PHONE, :ADDRESS, :CITY, :ZIP, :AFF_HOSP, :ENTERED_BY)" 
                UpdateCommand="update MS_UMLOG_NONMAIN_DEV
                                SET CALLER = :CALLER,
                                CALLER_NO = :CALLER_NO,
                                CALL_DATE = :CALL_DATE,
                                FAX_DATE = :FAX_DATE,
                                FNAME = :FNAME,
                                LNAME = :LNAME,
                                GENDER = :GENDER,
                                DOB = :DOB
                                WHERE LOG_ID = :LOG_ID">
                <InsertParameters>
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CALLER" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CALLER_NO" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CALL_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="FAX_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="FNAME" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="LNAME" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="GENDER" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="DOB" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CIN" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="PHONE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="ADDRESS" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CITY" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="ZIP" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="AFF_HOSP" PropertyName="SelectedValue" />
                </InsertParameters>                
                <SelectParameters>
                    <asp:ControlParameter ControlID="LOG_ID_HOLDER_TB" Name="LOG_ID" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CALLER" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CALLER_NO" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="CALL_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="FAX_DATE" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="FNAME" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="LNAME" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="GENDER" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="NonMemFormView" Name="DOB"  PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="LOG_ID_HOLDER_TB" Name="LOG_ID" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            
            <asp:FormView ID="FormView3" runat="server" DataSourceID="NonMemSql" DefaultMode="Edit" HeaderText="Edit Non-Member">
                <EditItemTemplate>                    
                   <table>
                       <tr>    
                          <td>Caller Name:<br />
                              <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("CALLER") %>'></asp:TextBox>
                          </td>
                          <td>Caller Contact#:<br />
                              <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("CALLER_NO") %>'></asp:TextBox>
                          </td>
                          <td>Call Date:<br />
                              <asp:TextBox ID="Call_DT_TB" runat="server" Text='<%# Bind("CALL_DATE") %>' ReadOnly="True"></asp:TextBox>
                          </td>
                          <td>Fax Date:<br />
                              <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("FAX_DATE") %>'></asp:TextBox>
                          </td>
                        </tr>
                        <tr>
                          <td>Member First Name:<br />
                              <asp:TextBox ID="FNAMETB" runat="server" Text='<%# Bind("FNAME") %>'></asp:TextBox>
                          </td>
                          <td>Member Last Name:<br />
                              <asp:TextBox ID="LNAMETB" runat="server" Text='<%# Bind("LNAME") %>'></asp:TextBox>
                          </td>
                          <td>Gender:<br />
                              <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("GENDER") %>' Width="40px"></asp:TextBox>
                          </td>
                          <td>DOB:<br />
                              <asp:TextBox ID="DOB_E_TB" runat="server" Text='<%# Bind("DOB") %>' Width="90px"></asp:TextBox>
                              <ajaxToolkit:CalendarExtender ID="DOBECalEx" runat="server" Format="dd-MMM-yyyy" TargetControlID="DOB_E_TB" TodaysDateFormat="dd-MMM-yyyy" />
                          </td>
                        </tr>
                    </table>
                        <div id="buttons" style="text-align: center; border: thin solid #C0C0C0">
                                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="False" CommandName="Update" CssClass="button" Font-Size="Larger" TabIndex="16" Text="Save Changes" UseSubmitBehavior="False" />
                                        <br />
                                        REF #:
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("LOG_ID")%>' />
                                        | MODIFIED:
                                        <asp:Label ID="MODIFIEDLabel" runat="server" Text="<%# DateTime.Now %>" />
                                        | Entered By:
                                        <asp:Label ID="UserLabel" runat="server" Text='<%# BasePage.CurrentUser %>' />
                                        <br />
                                    </div>   
                </EditItemTemplate>
                <HeaderStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
            </asp:FormView>
            
            <br />
            <br />
            <br />
            <br />
            
            <asp:FormView ID="NonMemFormView" runat="server" DataSourceID="NonMemSql" DefaultMode="Insert" HeaderText="Add New Non-Member">
                <HeaderStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" />
                <InsertItemTemplate>
                   <%-- <asp:LinkButton ID="EditLinkButton" runat="server" CausesValidation="True" commandname="Edit" text="Update" />--%>
                    
                    <table> 
                        <tr>    
                          <td>Caller Name:<br />
                              <asp:TextBox ID="TextBox24" runat="server" Text='<%# Bind("CALLER") %>'></asp:TextBox>
                          </td>
                          <td>Caller Contact#:<br />
                              <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("CALLER_NO") %>'></asp:TextBox>
                          </td>
                          <td>Call Date:<br />
                              <asp:TextBox ID="Call_DT_TB" runat="server" Text='<%# Bind("CALL_DATE") %>' ReadOnly="True"></asp:TextBox>
                          </td>
                          <td>Fax Date:<br />
                              <asp:TextBox ID="TextBox33" runat="server" Text='<%# Bind("FAX_DATE") %>'></asp:TextBox>
                          </td>
                          <td>Requesting Provider:<br />
                              <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("AFF_HOSP") %>'></asp:TextBox>
                          </td>
                        </tr>
                        <tr>
                          <td>Member First Name:<br />
                              <asp:TextBox ID="FNAME_TB" runat="server" Text='<%# Bind("FNAME") %>'></asp:TextBox>
                          </td>
                          <td>Member Last Name:<br />
                              <asp:TextBox ID="LNAME_TB" runat="server" Text='<%# Bind("LNAME") %>'></asp:TextBox>
                          </td>
                          <td>Gender:<br />
                              <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("GENDER") %>' Width="40px"></asp:TextBox>
                          </td>
                          <td>DOB:<br />
                              <asp:TextBox ID="DOB_TB" runat="server" Text='<%# Bind("DOB") %>' Width="90px"></asp:TextBox>
                              <ajaxToolkit:CalendarExtender ID="DOBCalEx" runat="server" Format="dd-MMM-yyyy" TargetControlID="DOB_TB" TodaysDateFormat="dd-MMM-yyyy" />
                          </td>   
                          <td>CIN:<br />
                              <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("CIN") %>'></asp:TextBox>
                          </td>
                      </tr>
                      <tr> 
                          <td>Address:<br />
                              <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("ADDRESS") %>'></asp:TextBox>
                          </td>
                          <td>City:<br />
                              <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("CITY") %>'></asp:TextBox>
                          </td>
                          <td>Zip:<br />
                              <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("ZIP") %>'></asp:TextBox>
                          </td>
                          <td>Phone:<br />
                              <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("PHONE") %>'></asp:TextBox>
                          </td>
                      </tr>
                    </table>
                    <br />
                       <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" commandname="Insert" text="Insert" />
                       &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" commandname="Cancel" text="Cancel" /> 
                    | Entered By: <asp:Label ID="ENTEREDBYLabel" runat="server" Text='<%# Bind("ENTERED_BY")%>' /> 
                </InsertItemTemplate>
            </asp:FormView>
            <br />
        </asp:View>
    </asp:MultiView>
     <br />
     <div id="CompletedMsg" runat="server" visible="false" class="CSFormCompleted">
         <asp:Label ID="CompleteLbl" runat="server" Font-Names="Tahoma" Font-Size="X-Large" ForeColor="Red"></asp:Label>

         </div>



   
         <br />
         <asp:Label ID="err1tlbl" runat="server" Font-Names="Tahoma" Font-Size="Large" ForeColor="Red"></asp:Label>
         <br />
         <asp:Label ID="err2tlbl" runat="server" Font-Names="Tahoma" Font-Size="Large" ForeColor="Red"></asp:Label>
            
    <script type="text/javascript">
       $(document).ready(function () {
           $(".searchdiag").autocomplete({
               source: function (request, response) {
                   $.ajax({
                       type: "POST",
                       contentType: "application/json; charset=utf-8",
                       url: "WebService/SearchLookup.asmx/SearchDiag",
                       dataType: "json",
                       data: "{'Value':'" + request.term + "'}",
                       success: function (data) {
                           response($.map(data.d, function (item) {
                               return {
                                   label: item.Diag,
                                   value: item.Diag,
                                   name: item.Diag
                               }
                           }))
                       }
                   });
               },
               minLength: 4,
               select: function (event, ui) {
                   //TO TEST PURPOSE ONLY
                   log(ui.item ? "Selected: " + ui.item.label + " Value: " + ui.item.value + " Name: " + ui.item.name : "Nothing selected, input was " + this.value);

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
    </script>

    <!-- Script for DiagCode lookup -->
    
    <script type="text/javascript">
            $(document).ready(function () {
                $(".searchcpt").autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            url: "WebService/SearchLookup.asmx/SearchCPT",
                            dataType: "json",
                            data: "{'Value':'" + request.term + "'}",
                            success: function (data) {
                                response($.map(data.d, function (item) {
                                    return {
                                        label: item.CPTDesc,
                                        value: item.CPTDesc,
                                        name: item.CPTDesc,
                                        cptcd: item.CPTCode
                                    }
                                }))
                            }
                        });
                    },
                    minLength: 4,
                    select: function (event, ui) {
                   
                        log(ui.item ? "Selected: " + ui.item.label + " Value: " + ui.item.value + " Name: " + ui.item.name : "Nothing selected, input was " + this.value);
                        $(".CPTCodeClass").val(ui.item.cptcd);
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
    </script>
    
    <!-- script for CPT lookup -->       

    <script type="text/javascript">
        $(document).ready(function () {
            

                 $(".searchfac").autocomplete({
                     source: function (request, response) {
                         $.ajax({
                             type: "POST",
                             contentType: "application/json; charset=utf-8",
                             url: "WebService/SearchLookup.asmx/SearchFac",
                             dataType: "json",
                             data: "{'Value':'" + request.term + "'}",
                             success: function (data) {
                                 response($.map(data.d, function (item) {
                                     return {
                                         label: item.FacCode + ' ' + item.FacName + ' ' + item.FacAddress + ' ' + item.FacCsz, 
                                         value: item.FacName,
                                         name: item.FacName,
                                         csz: item.FacCsz,
                                         fcd: item.FacCode,
                                         addr: item.FacAddress
                                         
                                     }
                                 }))
                             }
                         });
                     },
                     minLength: 0,
                     select: function (event, ui) {
                         //TO TEST PURPOSE ONLY
                         log(ui.item ? "Selected: " + ui.item.label + " Value: " + ui.item.value + " Name: " + ui.item.name : "Nothing selected, input was " + this.value);
                         $(".FacCszClass").val(ui.item.csz);
                         $(".FacAddrClass").val(ui.item.addr);
                         $(".FacCDClass").val(ui.item.fcd);

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
           
            //test 5
               //  alert($("#ctl00_MainContent_FormView1_AUTH_DIAG_FAC_DDL").val());
                 $("#ctl00_MainContent_FormView1_facilities").autocomplete('search', $("#ctl00_MainContent_FormView1_AUTH_DIAG_FAC_DDL").val());
            //$("#ctl00_MainContent_FormView1_facilities").data('ui-autocomplete')._trigger('select', 'autocompleteselect', { item: { value: $("#ctl00_MainContent_FormView1_AUTH_DIAG_FAC_DDL").val() } });
                 //$('#ctl00_MainContent_FormView1_facilities').data('uiAutocomplete')._trigger('select');
            // $("#ctl00_MainContent_FormView1_facilities").trigger("autocompleteselect");
                 $(this).data('ui-autocomplete')._trigger('select', 'autocompleteselect', { item: { value: $(this).val() } });

            //test 1
             //    alert($("#ctl00_MainContent_FormView1_AUTH_DIAG_FAC_DDL").val());
             //    $("#ctl00_MainContent_FormView1_facilities").data('ui-autocomplete')._trigger('select', 'autocompleteselect', { item: { value: $("#ctl00_MainContent_FormView1_AUTH_DIAG_FAC_DDL").val() } });

        });
      
        //test 2
      //  alert("hi2");
      //  $('#ctl00_MainContent_FormView1_facilities').data('uiAutocomplete')._trigger('select');
       // 
        //test 3
       // alert("hi3");
        //$("#ctl00_MainContent_FormView1_searchdiag").trigger("autocompleteselect");
        //$("ctl00_MainContent_FormView1_AUTH_DIAG_FAC_DDL").change(function)
        //{
        //    alert("ddl click");
        //    $("#ctl00_MainContent_FormView1_searchdiag").trigger("autocompleteselect");
        //};

        
             function log(message) {
                 $("<div/>").text(message).prependTo("#log");
                 $("#log").attr("scrollTop", 0);
             }
    </script>

    <!-- Script of Facility lookup 2 -->
 <%--   <script type="text/javascript">
        $(document).ready(function () {
            $(".searchfac2").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "WebService/SearchLookup.asmx/SearchFac",
                        dataType: "json",
                        data: "{'Value':'" + request.term + "'}",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.FacCode + ' ' + item.FacName,
                                    value: item.FacName,
                                    name: item.FacName
                                }
                            }))
                        }
                    });
                },
                minLength: 3,
                select: function (event, ui) {
                    //TO TEST PURPOSE ONLY
                    log(ui.item ? "Selected: " + ui.item.label + " Value: " + ui.item.value + " Name: " + ui.item.name : "Nothing selected, input was " + this.value);

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
    </script>--%>

</asp:Content>
