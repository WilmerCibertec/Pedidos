using App.Pedidos.Models;
using App.Pedidos.UnitOfWork;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;


namespace App.Pedidos.WebApi.Controllers
{
    public class LineaController : BaseController
    {
        public LineaController(IUnitOfWork unit) : base(unit)
        {
        }

        [HttpGet]
        public async Task<IHttpActionResult> Get(string id)
        {
            if (id == null || id.Equals("")) return BadRequest();
            return Ok(await _unit.Lineas.Obtener(int.Parse(id)));
        }

        [HttpPost]
        public async Task<IHttpActionResult> Post(WH_ClaseLinea linea)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            var idLinea = await _unit.Lineas.AgregarLinea(linea);

            return Ok(new { id = idLinea });
        }

        [HttpPut]
        public async Task<IHttpActionResult> Put(WH_ClaseLinea linea)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            if (!await _unit.Lineas.Modificar(linea)) return BadRequest("Operación Incorrecta");

            return Ok(new { status = true });
        }

        [HttpDelete]
        public async Task<IHttpActionResult> Delete(string id)
        {
            if (id == null || id.Equals("")) return BadRequest();

            var result = await _unit.Lineas.Eliminar(int.Parse(id));

            if (result != 0) return Ok(new { status = true });

            return BadRequest("Operación Incorrecta");
        }

        //[HttpGet]
        //public async Task<IHttpActionResult> GetList()
        //{
        //    return Ok(await _unit.Lineas.Listar());
        //}
    }
}