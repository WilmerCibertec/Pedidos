using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace App.UI.WebMVC.Controllers
{
    public class SubFamiliaController : Controller
    {
        // GET: SubFamilia
        public ActionResult Index()
        {
            return View();
        }

        // GET: SubFamilia/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: SubFamilia/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SubFamilia/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SubFamilia/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: SubFamilia/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: SubFamilia/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: SubFamilia/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
