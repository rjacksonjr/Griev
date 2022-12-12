using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Text;
//using System.DirectoryServices;

public partial class searchcin : BasePage
{
//Randy 

 


    #region Page Load, run your functions, check postback conditions, etc.

    protected void Page_Load(object sender, EventArgs e)
    {

       

        if (this.Page.IsPostBack)
        {
           // SearchResultsGV.Visible = true;
        }
        else
        {

            //SearchResultsGV.Visible = false;
            ClearSearchResults();
            BindAllObjects();
            
        }

    }
    #endregion

    #region "Button Behavior"

    protected void searchbtn_Click(object sender, EventArgs e)
    {



        try
        {

            if (searchtb.Text.Length == 0)
            {
                searchmsglbl.Text = "You must enter a ID to search.";
                return;
            }
            else
            {
                SearchResultsGV.Visible = false;
                //searchmsglbl.Text = "";
                SearchID(searchtb.Text);
                SearchResultsGVBind();
                SearchResultsGV.Visible = true;

            }


            //SearchResultsGV.DataBind();
            // ResetAllFields();
        }
        catch (OracleException wk)
        {
            //Response.Write(wk.ErrorCode.ToString());
            if (wk.ErrorCode.Equals(54))
            {
                errqryLbl.Text = "Please do not click Search more than one time. SRCB";
               // errqryLbl.Visible = true;

            }

            else
            {
                errqryLbl.Visible = false;
            }
        }
        catch (Exception ex)
        {
            // Response.Write(ex.ErrorCode.ToString());
            if (ex.Message.Contains("0054"))
            {
                errqryLbl.Text = "Please do not click Clear more than one time. SRCB";
                errqryLbl.Visible = true;

            }

            else
            {
              //  errqryLbl.Visible = false;
            }
        }

        // ResetAllFields();
    }

    protected void clear_Click(object sender, EventArgs e)
    {
            ClearSearchResults();
            searchtb.Text = string.Empty;
            searchmsglbl.Text = string.Empty;
            SearchResultsGV.Visible = false;
     
    }

    protected void NonMemLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("update_fm.aspx?view=1");
    }


    #endregion

    #region Bind All Objects
    protected void BindAllObjects()
    {
        //SearchResultsGVBind();
        //IHSSSearchDDLSQL();
        //top15gvsql();
        

    }
    #endregion


    #region SQL Data Sources

    protected void SearchResultsGVBind()
    {

      OracleConnection cn = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString);
                
        cn.Open();

        String sql = " select * from GRIEV_SEARCH_" + DataMode;
                

        OracleCommand cmd = new OracleCommand(sql, cn);


                try
                {
                    OracleDataReader dr = cmd.ExecuteReader();
                    SearchResultsGV.DataSource = dr;
                    SearchResultsGV.DataBind();
                }
                catch (OracleException wk)
                {
                    if (wk.ErrorCode.Equals(54))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. IDDL";
                        errqryLbl.Visible = true;
                    }
                    else
                    {
                        errqryLbl.Text = wk.ToString();
                    }
                }
                catch (Exception ex)
                {
                    if (ex.Message.Contains("0054"))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. IDDL";
                        errqryLbl.Visible = true;
                    }
                    else
                    {
                        errqryLbl.Text = ex.ToString();
                    }
                }
            cn.Close();
    }

    
    //protected void top15gvsql()
    //{

    //    using (OracleCommand cmd = new OracleCommand())
    //    {
    //        using (cmd.Connection = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString))
    //        {
    //            cmd.CommandText = "SELECT first_name||' '||last_name Mbr_name, a.* FROM griev_req_form_" + DataMode + " a order by create_date desc, form_id desc";
    //            cmd.CommandType = CommandType.Text;
    //            //cmd.Parameters.Add(new OracleParameter("cin_param", OracleDbType.NVarchar2)).Value = cin;



    //            try
    //            {
    //                //   cn.Open();   
    //                cmd.Connection.Open();
    //                OracleDataReader dr = cmd.ExecuteReader();


    //                Top5GridView1.DataSource = dr;
    //                Top5GridView1.DataBind();

    //                cmd.Connection.Close();
    //            }
    //            catch (OracleException wk)
    //            {                //Response.Write(wk.ErrorCode.ToString());
    //                if (wk.ErrorCode.Equals(54))
    //                {
    //                    errqryLbl.Text = "Please do not click Search more than one time. T15";
    //                    errqryLbl.Visible = true;

    //                }

    //                else
    //                {
    //                    errqryLbl.Text = wk.ToString();
    //                    //errqryLbl.Visible = false;
    //                } 
    //            }
    //            catch (Exception ex)
    //            {
    //                // Response.Write(ex.ErrorCode.ToString());
    //                if (ex.Message.Contains("0054"))
    //                {
    //                    errqryLbl.Text = "Please do not click Search more than one time. T15";
    //                    errqryLbl.Visible = true;

    //                }

    //                else
    //                {
    //                    errqryLbl.Text = ex.ToString();
    //                    //errqryLbl.Visible = false;
    //                }
    //            }
    //            cmd.Connection.Close();
    //        }
    //    }
        

    //}

  
    //protected void SqlDataSourceCINSelect()
    //{


    //    SqlDataSourcePCP.SelectCommand =
    //       " select * from "
    //     + " MS_UMLOG_SEARCH_" + DataMode;

    //}

    //protected void SqlDataSourceCINSearch()
    //{
    //    // SqlDataSourcePCP.SelectParameters.Add(":SRC", searchtb.Text);
    //    SqlDataSourcePCP.SelectCommand =
    //     " select * from "
    //     + " MS_UMLOG_SEARCH_" + DataMode;

    //}


    //protected void CinIHSSgvsql()
    //{

    //    using (OracleCommand cmd = new OracleCommand())
    //    {
    //        using (cmd.Connection = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString))
    //        {
    //            //string cinihss_parm = CinIHSS_DDL.SelectedValue.ToString();
    //            string cinihss_parm = CFLName.Value.ToString();
    //            cmd.CommandText = "SELECT * FROM VW_UMLOG_MAIN_" + DataMode + " a where mbr_id = '" + cinihss_parm + "'order by log_id desc" ;
    //            cmd.CommandType = CommandType.Text;
    //            //cmd.Parameters.Add(new OracleParameter("cin_param", OracleDbType.NVarchar2)).Value = cin;



    //            try
    //            {
    //                //   cn.Open();   
    //                cmd.Connection.Open();
    //                OracleDataReader dr = cmd.ExecuteReader();


    //                CinIHSS_GridView.DataSource = dr;
    //                CinIHSS_GridView.DataBind();

    //                cmd.Connection.Close();

    //                //Response.Write(cmd.CommandText);
    //            }
    //            catch (OracleException wk)
    //            {                //Response.Write(wk.ErrorCode.ToString());
    //                if (wk.ErrorCode.Equals(54))
    //                {
    //                    errqryLbl.Text = "Please do not click Search more than one time. IHS";
    //                    errqryLbl.Visible = true;

    //                }

    //                else
    //                {
    //                    errqryLbl.Text = wk.ToString();
    //                    //errqryLbl.Visible = false;
    //                }
    //            }
    //            catch (Exception ex)
    //            {
    //                // Response.Write(ex.ErrorCode.ToString());
    //                if (ex.Message.Contains("0054"))
    //                {
    //                    errqryLbl.Text = "Please do not click Search more than one time. IHS";
    //                    errqryLbl.Visible = true;

    //                }

    //                else
    //                {
    //                    errqryLbl.Text = ex.ToString();
    //                    //errqryLbl.Visible = false;
    //                }
    //            }
    //        }
    //    }
    //    //cn.Close();

    //}

  #endregion

    #region ID Grid Search Events

    protected void SearchID(string cin)
    {

        using (OracleCommand cmd = new OracleCommand())
        {
            using (cmd.Connection = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString))
            {
                cmd.CommandText = "SP_GRIEV_SEARCH_" + DataMode;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("ID_param", OracleDbType.NVarchar2)).Value = cin;
                

                try
                {
                    //   cn.Open();   
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
                catch (OracleException wk)
                {
                 
          
                    if (wk.ErrorCode.ToString().Equals(54))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. SRC";
                        errqryLbl.Visible = true;

                    }

                    else

                    {
                        errqryLbl.Visible = false;
                    }
                    //errqryLbl.Text = wk.ErrorCode.ToString();
                    
                    //                Response.Write(sql);
                }
                catch (Exception ex)
                {

                   // Response.Write(ex.ErrorCode.ToString());
                    if (ex.Message.Contains("0054"))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. SRC";
                        errqryLbl.Visible = true;

                    }

                    else
                    {
                        errqryLbl.Visible = false;
                    }
                }
            }
        }
        

    }
  
   
    #endregion

    #region Import Search Results 
    
    protected void SearchResultsGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        ViewState["membername"] = null;
        // searchmsglbl.Text = e.CommandArgument.ToString() + e.CommandName.ToString() + e.CommandSource.ToString();
        // checkmethod();
        // CrossClinicRadio.SelectedValue = "No";
        // moretargetsradio.SelectedValue = "One";
        //CheckCrossTargetClinic();
        // CheckTargetCount();

        foreach (GridViewRow rows in SearchResultsGV.Rows)
        {
            rows.BackColor = SearchResultsGV.BackColor;
        }
        //  methodtbl.Visible = false;

        if (e.CommandName.Equals("Import"))
        {

            string id = e.CommandArgument.ToString();
            ViewState["id"] = id;

            //  Response.Write(cin);

            try
            {
                ImportSearchResults(id);
                //Response.Redirect("msumupdate.aspx");
                searchmsglbl.Text = "Import clicked";



            }
            catch (Exception ex)
            {
                
                searchmsglbl.Text = "Import not succesful. " + ex ;
            }



            //searchmsglbl.Text = "Import Completed, Clear the Search and Click Update Data.";

        }

    }

    
    protected void ImportSearchResults(string id)
    {
        

        using (OracleCommand cmd = new OracleCommand())
        {
            using (cmd.Connection = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString))
            {
                cmd.CommandText = "SP_GRIEV_IMPORT_" + DataMode;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new OracleParameter("ID_param", OracleDbType.NVarchar2)).Value = id;
                cmd.Parameters.Add(new OracleParameter("user_param", OracleDbType.NVarchar2)).Value = CurrentUser;

                try
                {
                    //   cn.Open();   
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
                catch (OracleException wk)
                {

                    Response.Write("Errors in Import: " + wk.ToString());
                    if (wk.ErrorCode.ToString().Equals(54))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. IMP";
                        errqryLbl.Visible = true;
                    }

                    else
                    {
                        errqryLbl.Visible = false;
                    }
                    //errqryLbl.Text = wk.ErrorCode.ToString();

                    //                Response.Write(sql);
                }
                catch (Exception ex)
                {

                    Response.Write("Exception in Import: " + ex.ToString());
                    if (ex.Message.Contains("0054"))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. IMP";
                        errqryLbl.Visible = true;

                    }

                    else
                    {
                        errqryLbl.Visible = false;
                    }
                }
            }
        }
        //cn.Close();

        //Top5GridView1.DataBind();
        //TOP5Sql.DataBind();
        BindAllObjects();

    }


    protected void ClearSearchResults()
    {


        using (OracleCommand cmd = new OracleCommand())
        {
            using (cmd.Connection = new OracleConnection(ConfigurationManager.ConnectionStrings["OraConnectionStringMS"].ConnectionString))
            {
                cmd.CommandText = "truncate table GRIEV_SEARCH_" + DataMode;
                //cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandType = CommandType.Text;
                

                try
                {
                    //   cn.Open();   
                    cmd.Connection.Open();
                    cmd.ExecuteNonQuery();
                    cmd.Connection.Close();
                }
                catch (OracleException wk)
                {

                    //Response.Write(wk.ErrorCode.ToString());
                    if (wk.ErrorCode.ToString().Equals(54))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. CLR";
                        errqryLbl.Visible = true;

                    }

                    else
                    {
                        errqryLbl.Visible = false;
                    }
                    //errqryLbl.Text = wk.ErrorCode.ToString();

                    //                Response.Write(sql);
                }
                catch (Exception ex)
                {

                    // Response.Write(ex.ErrorCode.ToString());
                    if (ex.Message.Contains("0054"))
                    {
                        errqryLbl.Text = "Please do not click Search more than one time. CLR";
                        errqryLbl.Visible = true;

                    }

                    else
                    {
                        errqryLbl.Visible = false;
                    }
                }
            }
        }
        //cn.Close();

    }

    #endregion

    #region Drop Down Events
    //protected void CinIHSS_DDL_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    //CinIHSS_TB.Text = CinIHSS_DDL.SelectedValue.ToString();
    //    CinIHSSgvsql();
    //    SearchResultsGV.Visible = false;
    //}

    [System.Web.Services.WebMethod]
    protected void CinIHSS_TB_CINSubmit()
    {
        //CinIHSSgvsql();
        SearchResultsGV.Visible = false;
    }
    #endregion



    


    #region CIN Grid Events


   
  
         protected void SearchResultsGV_Load(object sender, EventArgs e)
    {
        if (IsPostBack && searchtb.Text != "")
        {
            //SqlDataSourceCINSearch();
            return;
        }
        if (IsPostBack && searchtb.Text.Equals(""))
        {
           // SqlDataSourceCINSelect();
            return;
        }

        
    }


    

    #endregion

         protected void cflbtn_Click(object sender, EventArgs e)
         {
             //CinIHSSgvsql();
             SearchResultsGV.Visible = false;
         }

    

}

  

    

