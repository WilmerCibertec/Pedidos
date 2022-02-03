using App.Pedidos.Models;
using App.Pedidos.UnitOfWork;
using App.UI.WebMVC.ActionFilters;
using log4net;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace App.UI.WebMVC.Controllers
{
    [ErrorActionFilter]
    //[RoutePrefix("Linea")]
    public class LineaController : BaseController
    {
        public LineaController(ILog log, IUnitOfWork unit) : base(log, unit)
        {
        }

        public ActionResult Error()
        {
            throw new System.Exception("Prueba de error para validar ActionFilter");
        }

        // GET: Linea
        [HttpGet]
        public async Task<ActionResult> Index()
        {
            _log.Info("Ejecucion del Controlador Linea - Index -> OK");
            var lista = await _unit.Lineas.Listar();
            return View(lista);
        }


        // GET: Linea/Create
        [HttpGet]
        public ActionResult Create()
        {
            return PartialView("_Create");
        }

        // POST: Linea/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(WH_ClaseLinea entidad)
        {

            if (ModelState.IsValid) //Si hay resultado no null
            {
                //await _unit.Lineas.AgregarLinea(entidad);
                //return RedirectToAction("Index");
                var httpClient = new HttpClient();
                
                var content = JsonConvert.SerializeObject(entidad);
                var buffer = Encoding.UTF8.GetBytes(content);
                var byteContent = new ByteArrayContent(buffer);
                byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                var response = await httpClient.PostAsync("https://localhost:44361/api/linea", byteContent);
                var result = response.Content.ReadAsStringAsync().Result;
                var contentResult = JsonConvert.DeserializeObject<Dictionary<string, int>>(result);

                return RedirectToAction("Index");
            }
            return View(entidad);
        }

        // GET: Linea/Edit/5
        [HttpGet]
        public async Task<ActionResult> Edit(int id)
        {
           return PartialView("_Edit", await _unit.Lineas.Obtener(id));
        }

        // POST: Linea/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(WH_ClaseLinea linea)
        {
            if (ModelState.IsValid)
            {
                //await _unit.Lineas.Modificar(linea);
                //return RedirectToAction("Index");
                var httpClient = new HttpClient();

                var content = JsonConvert.SerializeObject(linea);
                var buffer = Encoding.UTF8.GetBytes(content);
                var byteContent = new ByteArrayContent(buffer);
                byteContent.Headers.ContentType = new MediaTypeHeaderValue("application/json");

                var response = await httpClient.PutAsync("https://localhost:44361/api/linea", byteContent);
                var result = response.Content.ReadAsStringAsync().Result;
                var contentResult = JsonConvert.DeserializeObject<Dictionary<string, int>>(result);

                return RedirectToAction("Index");
            }
            return View(linea);
        }

        // GET: Linea/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            return PartialView("_Delete", await _unit.Lineas.Obtener(id));
        }

        // POST: Linea/Delete/5
        [HttpPost]
        [ActionName("Delete")]
        public async Task<ActionResult> DeletePost(int id)
        {
            if ((await _unit.Lineas.Eliminar(id)) != 0) return RedirectToAction("Index");

            return View(await _unit.Lineas.Obtener(id));
        }

        // GET: Linea/Details/5
        [HttpGet]
        public async Task<ActionResult> Details(int id)
        {
            return PartialView("_Details", await _unit.Lineas.Obtener(id));
        }

    }
}
