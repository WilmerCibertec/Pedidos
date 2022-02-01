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
    [RoutePrefix("Cliente")]
    public class ClienteController : Controller
    {
        private IUnitOfWork _unit;

        public ClienteController(IUnitOfWork unit)
        {
            _unit = unit;
        }
        // GET: Cliente
        [HttpGet]
        public async Task<ActionResult> Index()
        {
            var lista = await _unit.Clientes.Listar();
            return View(lista);
        }

        // GET: Cliente/Details/5
        public async Task<ActionResult> Details(int id)
        {
            return View( await _unit.Clientes.Obtener(id));
        }

        // GET: Cliente/Create
        [HttpGet]
        public ActionResult Create()
        {
            return PartialView("_Create");
        }

        // POST: Cliente/Create
        [HttpPost]
        public async Task<ActionResult> Create(CO_Clientes cliente)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    await _unit.Clientes.Agregar(cliente);
                    return RedirectToAction("Index");
                }
                return View(cliente);
            }
            catch
            {
                return View(cliente);
            }
        }

        // GET: Cliente/Edit/5
        [HttpGet]
        public async Task<ActionResult> Edit(int id)
        {
            return View(await _unit.Clientes.Obtener(id));
        }

        // POST: Cliente/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(CO_Clientes cliente)
        {
            try
            {
                // TODO: Add update logic here
                if (ModelState.IsValid)
                {
                    await _unit.Clientes.Modificar(cliente);
                    return RedirectToAction("Index");
                }
                return View(cliente);
            }
            catch
            {
                return View();
            }
        }

        // GET: Cliente/Delete/5
        [HttpGet]
        public async Task<ActionResult> Delete(int id)
        {
            return View(await _unit.Clientes.Obtener(id));
        }

        // POST: Cliente/Delete/5
        [HttpPost]
        [ActionName("Delete")]
        public async Task<ActionResult> DeletePost(int id)
        {
            try
            {
                // TODO: Add delete logic here
                if((await _unit.Clientes.Eliminar(id)) != 0)
                {
                    return RedirectToAction("Index");
                }
                return View(_unit.Clientes.Obtener(id));
                
            }
            catch
            {
                return View();
            }
        }
    }
}
