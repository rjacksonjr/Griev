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
//using System.DirectoryServices;
using Microsoft.Reporting.WebForms;
//using Microsoft.ReportViewer.WebForms;


public partial class _Reports : BasePage
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

            
        }
        
    }
    #endregion

    #region Bind claimsbatch Radio

  
  
  
    #endregion

    #region claimsbatch Events
    protected void claimsbatchradio_TextChanged(object sender, EventArgs e)
    {

      
        //Response.Write(claimsbatchradio.SelectedValue);
     
        //show label top of page
        claimsbatchtreportbtns.Visible = true;
        reportradio.Visible = true;
        //string claimsbatch = claimsbatchradio.SelectedValue.ToString();
        //string claimsbatchdate = claimsbatchradio.SelectedItem.ToString();
        //clinicnmlbl.Text = claimsbatchdate;
        //BasePage.claimsbatch = claimsbatch;
        //BasePage.claimsbatchdate = claimsbatchdate;
        //base.LogActivity(CurrentUser + " is in Reports module viewing " + claimsbatchdate, true, true, true);
        
    }
     #endregion

    #region Select Report
    protected void reportradio_TextChanged(object sender, EventArgs e)
    {

        htmlRptBtn.Visible = true;
        
        
    }
    /*
        public override void VerifyRenderingInServerForm(Control control)
        {
             Verifies that the control is rendered
        } */
    #endregion

    #region Run Reports
    protected void htmlRptBtn_Click(object sender, EventArgs e)
    {
         
        if (reportradio.SelectedValue.Equals("LOAReport"))
        {
            Response.Redirect("rptviewer.aspx?rpt=LOA.rdlc");
            // Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");
            
        }


        if (reportradio.SelectedValue == "DetailFull")
        {
            Response.Redirect("rptviewer.aspx?rpt=Detailrpt.rdlc");
            //DetailsGV.DataBind();
           // Response.Write(@"<script language='javascript'>alert('Please wait while your report is retrieved.');</script>");
            
        }


    }
    #endregion

    #region Roles


    //unused
    static string GetRolesNowBuilder()
    {
        string[] roles = Roles.GetRolesForUser();

        //
        // Concatenate all the elements into a StringBuilder.
        //
        StringBuilder builder = new StringBuilder();
        foreach (string value in roles)
        {
            builder.Insert(0, '"');
            //builder.Append(''');
            builder.Append(value);
            builder.Append('.');
        }
        return builder.ToString();
        // string dbits = " '" + roles + "' ";
        //string result = string.Join(", ", dbits);
        //return result;
    }

    //used
    static string GetRolesNow()
    {
        string[] roles = Roles.GetRolesForUser();
        string result = string.Join("', '", roles);
        return result;
    }

    #endregion
   
}
