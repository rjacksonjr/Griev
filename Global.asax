<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Security.Principal" %>


<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        //AuthConfig.RegisterOpenAuth();
        //RouteConfig.RegisterRoutes(RouteTable.Routes);
    }
    
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }
    void Application_AuthenticateRequest(Object sender, EventArgs e)
    {
        String cookieName = FormsAuthentication.FormsCookieName;
        HttpCookie authCookie = Context.Request.Cookies[cookieName];

        if (null == authCookie)
        {//There is no authentication cookie.
            return;
        }

        FormsAuthenticationTicket authTicket = null;

        try
        {
            authTicket = FormsAuthentication.Decrypt(authCookie.Value);
        }
        catch (Exception ex)
        {
            //Write the exception to the Event Log.
            return;
        }

        if (null == authTicket)
        {//Cookie failed to decrypt.
            return;
        }

        //When the ticket was created, the UserData property was assigned a
        //pipe-delimited string of group names.
        String[] groups = authTicket.UserData.Split(new char[] { '|' });

        //Create an Identity.
        GenericIdentity id = new GenericIdentity(authTicket.Name, "LdapAuthentication");

        //This principal flows throughout the request.
        GenericPrincipal principal = new GenericPrincipal(id, groups);

        Context.User = principal;

    }


</script>
