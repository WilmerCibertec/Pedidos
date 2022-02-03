using App.Pedidos.UnitOfWork;
using SimpleInjector;
using SimpleInjector.Integration.WebApi;
using SimpleInjector.Lifestyles;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace App.Pedidos.WebApi
{
    public class DIConfig
    {
        public static void ConfigureInjector(HttpConfiguration config)
        {
            var container = new Container();        
            container.Options.DefaultScopedLifestyle = new AsyncScopedLifestyle();

            container.Register<IUnitOfWork>(() =>
                    new PedidosUnitOfWork(ConfigurationManager.ConnectionStrings["PedidosConnection"].ToString()));

            container.RegisterWebApiControllers(config);
            container.Verify();

            config.DependencyResolver = new SimpleInjectorWebApiDependencyResolver(container);
        }
    }
}
