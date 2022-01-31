using App.Pedidos.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.UI.WebMVC.Controllers
{
    //[AllowAnonymous]
    public class HomeController : Controller
    {
        private IUnitOfWork _unit = new PedidosUnitOfWork("");
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}