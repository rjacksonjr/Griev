using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
//using System.Data.Sql;
//using System.Data.SqlClient;
using System.IO;
//these two below are to play with threading.
//using System.Threading;
//using System.Threading.Tasks;
//using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Text;
using System.Reflection;
//using System.DirectoryServices;
using Microsoft.Reporting.WebForms;
//using Microsoft.ReportViewer.WebForms;


public partial class _RptViewer : BasePage
{
//Isaac Martinez, Los Angeles June 2014
//This is the main landing page for MCSFSD
//I've inserted several comments below in common methods and functions
//for the benefit of training new developers and making code
//easier to ready. 

 

    #region Page Load, run your functions, check postback conditions, etc.
    protected void Page_Load(object sender, EventArgs e)
    {



        if (this.Page.IsPostBack)
        {
            
        }
        else
        {

            if (Request.QueryString["rpt"] != null)
            {
                // String authnum = Request.QueryString["authnum"].ToString();
                
                string rpt = Request.QueryString["rpt"].ToString();
                string authnum = Request.QueryString["authnum"].ToString();
                loadrpt(rpt, authnum);
            }

            else
            {
                Response.Write("No report selected");
            }

        }

    }
    #endregion
  
    #region Select Report
    protected void reportradio_TextChanged(object sender, EventArgs e)
    {

         
        
    }
    /*
        public override void VerifyRenderingInServerForm(Control control)
        {
             Verifies that the control is rendered
        } */
    #endregion

    #region Run Reports
    protected void loadrpt(string rpt, string authnum)
    {



        if (rpt == "LOA.rdlc")
        {
            
            SqlDataSourceSUMSelect(authnum);
            //  Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");
            RptViewerSum.Visible = true;
            RptViewerSum.LocalReport.DataSources.Clear();
            ReportDataSource datasource = new ReportDataSource("DataSet1", "DataSource1");
            RptViewerSum.LocalReport.ReportPath = rpt;
            
            RptViewerSum.LocalReport.DataSources.Add(datasource);
            ReportParameter p1 = new ReportParameter("dhs_auth_num", authnum);
            RptViewerSum.LocalReport.SetParameters(p1);
            RptViewerSum.LocalReport.Refresh();
            

            
            

        }

        if (rpt == "Patient_Approval.rdlc")
        {

            SqlDataSourceSUMSelect(authnum);
            //  Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");
            RptViewerSum.Visible = true;
            RptViewerSum.LocalReport.DataSources.Clear();
            ReportDataSource datasource = new ReportDataSource("DataSet1", "DataSource1");
            RptViewerSum.LocalReport.ReportPath = rpt;

            RptViewerSum.LocalReport.DataSources.Add(datasource);
            ReportParameter p1 = new ReportParameter("dhs_auth_num", authnum);
            RptViewerSum.LocalReport.SetParameters(p1);
            RptViewerSum.LocalReport.Refresh();





        }
    }

    //    if (rpt == "SummaryRpt.rdlc")
    //    {
    //        SqlDataSourceSUMSelect(authnum);
    //        //  Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");
    //        RptViewerSum.Visible = true;
    //        RptViewerSum.LocalReport.DataSources.Clear();
    //        ReportDataSource datasource = new ReportDataSource("SummaryDS", "SqlDataSourceClaimsGV");
    //        RptViewerSum.LocalReport.ReportPath = rpt;
    //        RptViewerSum.LocalReport.DataSources.Add(datasource);
    //        RptViewerSum.LocalReport.Refresh();

    //    }


    //    if (rpt  == "DetailReport.rdlc")
    //    {
    //        SqlDataSourceDETSelect(authnum);
    //        //DetailsGV.DataBind();
    //        //Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");
           
    //        RptViewerSum.Visible = true;
    //        //RptViewerSum.LocalReport.ReportPath.("rpt");
    //        RptViewerSum.LocalReport.DataSources.Clear();
    //        ReportDataSource datasource = new ReportDataSource("DetailDS", "SqlDataSourceClaimsGV");
    //        RptViewerSum.LocalReport.ReportPath = rpt;
    //        RptViewerSum.LocalReport.DataSources.Add(datasource);
    //        RptViewerSum.LocalReport.Refresh();

    //    }
    //    if (rpt == "Detailrpt.rdlc")
    //    {
    //        SqlDataSourceDETSelect(authnum);
    //        //DetailsGV.DataBind();
    //        //Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");

    //        RptViewerSum.Visible = true;
    //        //RptViewerSum.LocalReport.ReportPath.("rpt");
    //        RptViewerSum.LocalReport.DataSources.Clear();
    //        ReportDataSource datasource = new ReportDataSource("DetailDS", "SqlDataSourceClaimsGV");
    //        RptViewerSum.LocalReport.ReportPath = rpt;
    //        RptViewerSum.LocalReport.DataSources.Add(datasource);
    //        RptViewerSum.LocalReport.Refresh();

    //    }


    //}
    #endregion

    #region Report Source
    protected void SqlDataSourceSUMSelect(string authnum)
    {

        DataSource1.SelectCommand =
            "select m.*,CPT_CD, cpt_desc,cpt.noa from devrpt_ms.vw_umlog_main_prod m left join devrpt_ms.ms_umlog_cpt_prod cpt on m.log_id = cpt.log_id where dhs_auth_num = '"+authnum+"'";
    }

    //protected void SqlDataSourceDETSelect(string authnum)
    //{
    //    SqlDataSourceClaimsGV.SelectParameters["selbatch"].DefaultValue = authnum;
    //    //SqlDataSourceArticole.SelectParameters["id"].DefaultValue = id.ToString();

    //    SqlDataSourceClaimsGV.SelectCommand =
    //        " select * from "
    //        + ActiveTableSrc
    //        //where batch = '"
    //        //  + authnumradio.SelectedValue
    //        + " where batch = :selbatch order by admit_date desc, id, rectype ";
      

    

    //}
   
    #endregion
    
    #region Report Exporting
    protected void RptViewerSum_PreRender(object sender, EventArgs e)
    {
        DisableUnwantedExportFormat((ReportViewer)sender, "WORDOPENXML");
        DisableUnwantedExportFormat((ReportViewer)sender, "PDF");
        
    } 
 
    public void DisableUnwantedExportFormat(ReportViewer ReportViewerID, string strFormatName)
    {
        FieldInfo info;
        foreach (RenderingExtension extension in ReportViewerID.LocalReport.ListRenderingExtensions())
        {
            if (extension.Name.Trim().ToUpper() == strFormatName.Trim().ToUpper())
            {
                info = extension.GetType().GetField("m_isVisible", BindingFlags.Instance | BindingFlags.NonPublic);
                info.SetValue(extension, false);
            }
        }

    }
    #endregion

}
