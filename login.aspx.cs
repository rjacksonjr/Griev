using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Runtime.InteropServices;
using System.DirectoryServices.AccountManagement;

public partial class Login : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Roles.GetRolesForUser().Length < 1)
        {
            FormsAuthentication.SignOut();
        }


    }


    public bool ValidateUser(string username, string password)
    {
        bool result = false;

        try
        {
            using (var context =
                new PrincipalContext(ContextType.Domain, "HOSTED"))
            {
                result = context.ValidateCredentials(username, password);
            }
        }
        catch (Exception ex)
        {
            // TODO: log exception
        }

        return result;
    }


    public static string GetDomainName(string usernameDomain)
    {
        if (string.IsNullOrEmpty(usernameDomain))
        {
            //  throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
            Label errLogin = new Label();
            errLogin.Text = "You must supply a username and a password";
        }
        if (usernameDomain.Contains("\\"))
        {
            int index = usernameDomain.IndexOf("\\");
            return usernameDomain.Substring(0, index);
        }
        else if (usernameDomain.Contains("@"))
        {
            int index = usernameDomain.IndexOf("@");
            return usernameDomain.Substring(index + 1);
        }
        else
        {
            return "HOSTED";
        }
    }

    public static string GetUsername(string usernameDomain)
    {
        if (string.IsNullOrEmpty(usernameDomain))
        {
            //       throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
            Label errLogin = new Label();
            errLogin.Text = "You must supply a username and a password";

        }
        if (usernameDomain.Contains("\\"))
        {
            int index = usernameDomain.IndexOf("\\");
            return usernameDomain.Substring(index + 1);
        }
        else if (usernameDomain.Contains("@"))
        {
            int index = usernameDomain.IndexOf("@");
            return usernameDomain.Substring(0, index);
        }
        else
        {
            return usernameDomain;
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //string domainName = GetDomainName(txtUserName.Text); // Extract domain name 
        string domainName = "HOSTED"; // Extract domain name 
        //form provide DomainUsername e.g Domainname\Username
        string userName = GetUsername(txtUserName.Text);  // Extract user name 
        //string userName = txtUserName.Text;  // Extract user name 
        //from provided DomainUsername e.g Domainname\Username
        IntPtr token = IntPtr.Zero;

        //using the old method
        // bool result = LogonUser(userName, domainName, txtPassword.Text, 2, 0, ref token);


        //let's use our own!
        bool result = ValidateUser(userName, txtPassword.Text);
        if (result)
        {
            //If Successfully authenticated

            //When an unauthenticated user try to visit any page of your 
            //application that is only allowed to view by authenticated users then,
            //ASP.NET automatically redirect the user to login form and add 
            //ReturnUrl query string parameter that contain the URL of a page that 
            //user want to visit, So that we can redirect the user to that page after 
            //authenticated. FormsAuthentication.RedirectFromLoginPage() method 
            //not only redirect the user to that page but also generate an 
            //authentication token for that user.
            if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {

                //FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
                FormsAuthentication.RedirectFromLoginPage(userName, false);
            }
            //If ReturnUrl query string parameter is not present, 
            //then we need to generate authentication token and redirect 
            //the user to any page ( according to your application need). 
            //FormsAuthentication.SetAuthCookie() 
            //method will generate Authentication token 
            else
            {
                //FormsAuthentication.SetAuthCookie(txtUserName.Text, false);
                FormsAuthentication.SetAuthCookie(userName, false);
                Response.Redirect("default.aspx");
            }


        }
        else
        {
            //If not authenticated then display an error message
            //Response.Write("Invalid username or password.");
            errLogin.Text = "Invalid username or password.";
        }
    }

    private bool CheckRoles()
    {
        string[] roles = Roles.GetRolesForUser();


        if (Roles.GetRolesForUser().Length < 0)
        {
            return false;
        }

        else
        {
            return true;
        }

    }

}