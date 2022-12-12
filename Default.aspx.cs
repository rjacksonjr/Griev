using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Text;
//using System.DirectoryServices;

public partial class _Default : BasePage
{

  

    #region Page Load, run your functions, check postback conditions, etc.
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CheckRoles().Equals(false))
        {
            FormsAuthentication.SignOut();
        }

        else

        {
         
        }

   
     
    }
    #endregion

    #region Roles


    //unused
    private bool CheckRoles()
    {
        string[] roles = Roles.GetRolesForUser();

        if (roles.Length < 1)
        {
            return false;
        }

        else
        {
            return true;
        }
        
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
