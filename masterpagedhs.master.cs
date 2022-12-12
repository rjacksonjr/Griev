using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.HtmlControls;

public partial class MasterPageDHS : System.Web.UI.MasterPage {

    /*
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        Page.Header.DataBind();
    }

  */

    protected void Page_Load(object sender, System.EventArgs e) {

        if (BasePage.DataMode == "DEV")
        { 
            envlbl.Text = "DEVELOPMENT" ;
        }
        else if (BasePage.DataMode == "PROD")
        {
            envlbl.Text = "PRODUCTION";
        }
        else
        {
            envlbl.Text = "CONF ERROR: CHECK WEB.CONFIG";
        }
        
        
        //Response.Write(HttpContext.Current.User.Identity.Name);
        //Response.Write(GetFullName(HttpContext.Current.User.Identity.Name).ToString());
        Login_Event();

        
    }
    
    private void cmdSignOut_ServerClick(object sender, System.EventArgs e) {
        FormsAuthentication.SignOut();
        Response.Redirect("login.aspx", true);
    }


    #region Login Event
    protected void Login_Event()
    {


        LoginName loginName = loginview1.FindControl("LoginName1") as LoginName;
        if (loginName != null)
        {
            loginName.FormatString = BasePage.GetFullLoginName(HttpContext.Current.User.Identity.Name) + " {0}";
        }


    }
    #endregion

 

    

 
}

