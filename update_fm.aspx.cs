using System;
//using System.Collections.Generic;
using System.Configuration;
using System.Data;
//using System.Data.Entity;
//using System.Data.Sql;
using System.Data.SqlClient;
//using System.IO;
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
//using System.Globalization;
//using System.DirectoryServices;

public partial class update_fm : BasePage
{

    #region Page Load

    #region Page Load, run your functions, check postback conditions, etc.

    protected void Page_Load(object sender, EventArgs e)
    {
        
       
        
        

        if (!Page.IsPostBack)
        {
            if (Request.QueryString["formid"] != null)

            {
                string formid1 = Request.QueryString["formid"].ToString();
                //debuglbl.Text = "LOGID is" + logid1.ToString();

                TextBox14.Text = formid1;
                MyAccordion.Visible = true;
                MBR_ID_DDL.SelectedValue = formid1;
                
            }

           
                
           
          
            
        }
        else

        {
            //if (ViewState["authddl"] != null)
            //{
            //    DropDownList AuthDDL = FormView1.FindControl("AUTH_DIAG_FAC_DDL") as DropDownList;
            //    string seeint = ViewState["authddl"].ToString();
            //    AuthDDL.SelectedIndex = int.Parse(seeint);
            //}
            
        }

        BindAllObjects();
        LateBindings();

       var qs = Request.QueryString["view"];
            if (qs != null)
            {
                if (qs == "1")
                {
                    MultiView1.ActiveViewIndex = 1;
                }
            }


           
       

    }
    #endregion

    #endregion

    #region Bind All Objects
    protected void BindAllObjects()
    {

        SqlDataSourceMSSelect();
        SqlGriev_CD_Select();
        Sql_AH_PCS_Select();
        SqlDataIDSelectUpdate();
        //SqlCPT_TB_Select();
        SqlDataSourceCommentsSelect();
        //SqlCommentsCOCSelect();
        FLDOBSqlSelect();

       
        
        
        // SqlDataAuthSelect();
     
    }

    protected void LateBindings()

    {
        TextBox MBRID = FormView1.FindControl("Form_ID_TBX") as TextBox;

        if (MBRID != null)
        {
            TextBox13.Text = MBRID.Text;

            //only repop auth ddl on postback:
            //add please select only once
                
                //SqlAuthDataBind(TextBox13.Text);
            SqlGVDataBind(TextBox13.Text);
            
        }
        
    }

    #endregion

    #region SQLDataMSCommands
    protected void SqlDataIDSelectUpdate()
    {
        SqlDataID.SelectCommand = "SELECT MBR_PLAN_ID, FORM_ID, FORM_ID||' | '||case_id||' | '||first_name||' | '||last_name||' | '||dob_date||' | '||Modified_by info  FROM griev_req_form_" + DataMode + " order by create_date desc";
    }
    protected void SqlDataSourceMSSelect()
    {
        
        SqlDataSourceMS.SelectCommand =
          "SELECT * FROM griev_req_form_" + DataMode + " where FORM_ID = " + TextBox14.Text;
        SqlDataSourceMS.UpdateCommand = "UPDATE  griev_req_form_" + DataMode + " SET "                               
                                + " MODIFIED_BY = :MODIFIED_BY,"
                                + " MCS_RECEIVED_DATE = :MCS_RECEIVED_DATE,"
                                + " MCS_DUE_DATE = :MCS_DUE_DATE,"
                                + " TIME_RECEIVED = :TIME_RECEIVED,"
                                + " COORDINATOR = :COORDINATOR,"
                                + " CASE_TYPE = :CASE_TYPE,"
                                + " REQUEST_TYPE = :REQUEST_TYPE,"
                                + " RELATED_CASE_ID = :RELATED_CASE_ID,"
                                + " INCIDENT_DATE = :INCIDENT_DATE,"
                                + " LOCATION_INCIDENT = :LOCATION_INCIDENT,"
                                + " RESOLUTION_CD = :RESOLUTION_CD,"
                                + " GRIEV_CD = :GRIEV_CD,"
                                + " GRIEV_SUMMARY = :GRIEV_SUMMARY,"
                                + " GNA_NOTES = :GNA_NOTES,"
                                + " CASE_DUE_DATE = :CASE_DUE_DATE,"
                                + " CONTACT = :CONTACT,"
                                + " SI_CASE_NO = :SI_CASE_NO,"
                                + " MCS_CGC_SENT_DATE = :MCS_CGC_SENT_DATE,"
                                + " DHS_FAC_SENT_DATE = :DHS_FAC_SENT_DATE,"
                                + " MCS_CGC_RECD_DATE = :MCS_CGC_RECD_DATE,"
                                + " DHS_FAC_RECD_DATE = :DHS_FAC_RECD_DATE,"
                                + " CASE_CLOSED_DATE = :CASE_CLOSED_DATE"
                                + " where FORM_ID = :FORM_ID";     
    }
    protected void SqlGriev_CD_Select()
    {
        SqlGriev_CD.SelectCommand = "Select GRIEV_CD, GRIEV_DESC from GRIEV_CODE";
    }
    
    protected void Sql_AH_PCS_Select()
    {
        Sql_AH_PCS.SelectCommand = "Select ah1_ce_name from ("
                                    + "Select distinct ah1_ce_name from DWADM.PROVIDER_DIM P where p.ah1_ce_name is not null "
                                    + "Union "
                                    + "select distinct p.pcs_site_desc from DWADM.PROVIDER_DIM P where term_date >= sysdate and p.pcs_site_desc is not null)"
                                    + "order by ah1_ce_name";
    }
        

    protected void SqlDataSourceCommentsSelect()
    {
        SqlDataSourceComments.SelectCommand = "SELECT * FROM GRIEV_Comments_" + DataMode + " where COM_TYPE = 'M' and FORM_ID = :FORM_ID";
        SqlDataSourceComments.InsertCommand = "insert into GRIEV_Comments_" + DataMode
                                                    + " (FORM_ID, CASE_COM_ID, COMMENTS, COM_DT, COM_TYPE)"
                                                    + " values"
                                                    + " (:FORM_ID, CASE_COM_ID.NEXTVAL, :COMMENTS, SYSDATE, :COM_TYPE)";
    }
    
    
    protected void FLDOBSqlSelect()
    {
        FLDOBSql.SelectCommand = "select LOG_ID, FNAME||'-'||LNAME||'-'||DOB FLDOB, CIN from ms_umlog_nonmain_" + DataMode; 
    }
    #endregion

    #region DropDown Behavior


    protected void MBR_ID_DDL_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Response.Redirect("update_fm.aspx?formid=" + MBR_ID_DDL.SelectedValue.ToString());
    }
    protected void COC_STATUS_DD_SelectedIdexChanged(object sender, EventArgs e)
    {

    }
  protected void FLDOB_DD_SelectedIndexChanged(object sender, EventArgs e)
    {
        LOG_ID_HOLDER_TB.Text = FLDOB_DD.SelectedValue.ToString();
    }
   

#endregion 

    #region GV Auth Data Source
  

  protected void SqlGVDataBind(string mbrid)
  {//temp unused
      
      GridView authgv = FormView1.FindControl("auth_fac_gv") as GridView;

      OracleConnection cn = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString);

      cn.Open();

      String sql = "select m.mbr_dim_id,m.first_name,m.last_name,a.auth_num,a.call_date,a.fac_name,a.dx,d.icd9_desc from pms_ds.rdt_auth_to_dwh a "
                                      + " inner join dwadm.member_dim m on a.src_mbr_id = m.src_mbr_id inner join ETLADM.FTT_ICD9_DIAG_CODES d on a.dx = d.icd9_cd "
                                      + " where m.mbr_dim_id = '" + mbrid + "' and sysdate-60 <= a.call_date group by m.mbr_dim_id,m.first_name,m.last_name,a.auth_num,a.call_date,a.fac_name,a.dx,d.icd9_desc";


      OracleCommand cmd = new OracleCommand(sql, cn);


      try
      {
          OracleDataReader dr1 = cmd.ExecuteReader();


          authgv.DataSource = dr1;
          authgv.DataBind();


          OracleDataReader dr2 = cmd.ExecuteReader();

          while (dr2.Read())
          {
              // dr.Read();
              string diaval = dr2["icd9_desc"].ToString();
              ViewState["diaval"] = diaval;
          }

      }
      catch

      { }
      cn.Close();
  }


  
#endregion

  
    #region Formview Events

  protected void FormView1_DataBound(object sender, EventArgs e)
  {
      NoticeTextDate();
      FaxTextDate();
      MODIFIED_BY();

     
  }

    #endregion

    #region FormView Object Formatting



  protected void NoticeTextDate()
    {
        TextBox Notice = FormView1.FindControl("NoticeTBX") as TextBox;
        TextBox FaxDate = FormView1.FindControl("Fax_DT_TBX") as TextBox;
        

        if (Notice == null)
        { 
        }
        else
        {

            if (Notice.Text == "")
            {
                Notice.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                
            }
            else
            {
             
                Notice.Text = TextBoxOracleDate(Notice.Text);
             
            }

        }
    
    }

    protected void MODIFIED_BY()
    {

        ModBy_TB.Text = CurrentUser;
    }
    protected void FaxTextDate()
    {
        
        TextBox FaxDate = FormView1.FindControl("Fax_DT_TBX") as TextBox;


        if (FaxDate == null)
        {
        }
        else
        {

            if (FaxDate.Text == "")
            {
                //Notice.Text = DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss");
                //Notice.Text = DateTime.Now.ToString("dd-MMM-yyyy hh:mm:ss tt");
                FaxDate.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                //Notice.Text = DateTime.Now.ToString();
                //Response.Write("the date is blank");
            }
            else
            {
                //   DateTime.ParseExact(Notice.Text, "dd-MMM-yyyy hh:mm:ss tt", null);
                //string newdate = TextBoxOracleDate(Notice.Text);

                FaxDate.Text = TextBoxOracleDate(FaxDate.Text);
               // Response.Write(FaxDate.Text + "the date is not blank ");
                // do nothing
            }

        }

    }

    
    public static string TextBoxOracleDate(string date)
    {
        DateTime theDate;
        if (DateTime.TryParseExact(date, "dd/MM/yyyy hh:mm:ss tt", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out theDate))
        {
            // the string was successfully parsed into theDate
            return theDate.ToString("dd-MMM-yyyy");
        }
        if (DateTime.TryParseExact(date, "dd-MMM-yyyy", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out theDate))
        {
            // the string was successfully parsed into theDate
            return theDate.ToString("dd-MMM-yyyy");
        }

        if (DateTime.TryParseExact(date, "MM/dd/yyyy hh:mm:ss tt", System.Globalization.CultureInfo.InvariantCulture, System.Globalization.DateTimeStyles.None, out theDate))
        {
            // the string was successfully parsed into theDate
            return theDate.ToString("dd-MMM-yyyy");
        }


        else
        {
            // the parsing failed, return some sensible default value
            //return DateTime.Now.ToString("dd-MMM-yyyy");
            //return theDate.ToString("dd-MMM-yyyy");
            return date;
        }
    }

    protected void MBR_ID_DDL_DataBound(object sender, EventArgs e)
    {
        MBR_ID_DDL.Items.Insert(0, "Select");
    }



    


    protected void MemLinkButton_Click1(object sender, EventArgs e)
    {
        Response.Redirect("update_fm.aspx");
    }

#endregion

    

    

    protected void LOAButton_Click(object sender, EventArgs e)
    {
        TextBox AUTH = FormView1.FindControl("AUTH_TB") as TextBox;
        Response.Redirect("rptviewer.aspx?rpt=LOA.rdlc&authnum=" + AUTH.Text + "");
    }

    protected void ApprovalButton_Click(object sender, EventArgs e)
    {
        TextBox AUTH = FormView1.FindControl("AUTH_TB") as TextBox;
        Response.Redirect("rptviewer.aspx?rpt=Patient_Approval.rdlc&authnum=" + AUTH.Text + "");
    }


    #region Unused Code

    /*
     *   protected void SqlAuthAddSelect()
  {
      DropDownList AuthDDL = FormView1.FindControl("AUTH_DIAG_FAC_DDL") as DropDownList;

     // AuthDDL.Items.Insert(0, new ListItem("Please Select", "Please Select"));
   
  
  }
     * 
     * protected void AUTH_DIAG_FAC_DDL_SelectedIndexChanged(object sender, EventArgs e)
  {
      DropDownList AuthDDL = FormView1.FindControl("AUTH_DIAG_FAC_DDL") as DropDownList;
      TextBox Auth = FormView1.FindControl("AUTH_TB") as TextBox;
      TextBox Fac = FormView1.FindControl("facilities") as TextBox;
      TextBox Dia = FormView1.FindControl("searchdiag") as TextBox;
      Fac.Text = AuthDDL.SelectedItem.ToString();
      Auth.Text = AuthDDL.SelectedValue.ToString();
     // Dia.Text = AuthDDL.SelectedIndex.ToString();
      Dia.Text = ViewState["diaval"].ToString();
      //ViewState["authddl"] = AuthDDL.SelectedIndex;
      
  }
    protected void SqlAuthDataBind(string mbrid)
  {
     //bind gv instead of DDL

      DropDownList AuthDDL = FormView1.FindControl("AUTH_DIAG_FAC_DDL") as DropDownList;

      OracleConnection cn = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString);

      cn.Open();

      String sql = "select m.mbr_dim_id,m.first_name,m.last_name,a.auth_num,a.call_date,a.fac_name,a.dx,d.icd9_desc from pms_ds.rdt_auth_to_dwh a "
                                      + " inner join dwadm.member_dim m on a.src_mbr_id = m.src_mbr_id inner join ETLADM.FTT_ICD9_DIAG_CODES d on a.dx = d.icd9_cd "
                                      + " where m.mbr_dim_id = '" + mbrid + "' and sysdate-60 <= a.call_date group by m.mbr_dim_id,m.first_name,m.last_name,a.auth_num,a.call_date,a.fac_name,a.dx,d.icd9_desc";


      OracleCommand cmd = new OracleCommand(sql, cn);


      try
      {
          OracleDataReader dr1 = cmd.ExecuteReader();

         
              AuthDDL.DataSource = dr1;
              AuthDDL.DataBind();

              AuthDDL.Items.Insert(0, new ListItem("Please Select", "Please Select"));
          
          
          OracleDataReader dr2 = cmd.ExecuteReader();

         while (dr2.Read())
          {
             // dr.Read();
              string diaval = dr2["icd9_desc"].ToString();
              ViewState["diaval"] = diaval;
            
              
          }
         
      }
      catch

      { }
      cn.Close();
  }
     * 
     */
    #endregion






}
