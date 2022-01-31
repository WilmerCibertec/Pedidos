using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

[assembly:OwinStartup(typeof(App.UI.WebMVC.Startup))]

namespace App.UI.WebMVC
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = "ApplicationCookie",
                //LoginPath = new PathString("/Shared/_LayoutBackOffice.cshtml"),
                //ExpireTimeSpan = TimeSpan.FromDays(30)/*,
                //LogoutPath = new PathString("Home/Index")
            });
        }
    }
}