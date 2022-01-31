using App.Pedidos.Models;
using App.Pedidos.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace App.UI.WebMVC.Controllers
{
    public class LineaController : Controller
    {
        private IUnitOfWork _unit;

        public LineaController(IUnitOfWork unit)
        {
            _unit = unit;
        }

        // GET: Linea
        [HttpGet]
        public async Task<ActionResult> Index()
        {
            var lista = await _unit.Lineas.Listar();
            return View(lista);
        }


        // GET: Linea/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
           
        }

        // POST: Linea/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(WH_ClaseLinea linea)
        {
            try
            {
                if (ModelState.IsValid) //Si hay resultado no null
                {
                    await _unit.Lineas.Agregar(linea);
                    return RedirectToAction("Index");
                }
                return View(linea);
            }
            catch
            {
                return View(linea);
            }
        }

        // GET: Linea/Edit/5
        [HttpGet]
        public async Task<ActionResult> Edit(int id)
        {
            return View(await _unit.Lineas.Obtener(id));
        }

        // POST: Linea/Edit/5
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

        // GET: Linea/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Linea/Delete/5
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

        // GET: Linea/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

    }
}
