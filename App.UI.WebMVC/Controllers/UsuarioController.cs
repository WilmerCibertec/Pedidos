using App.Pedidos.Models;
using App.Pedidos.Models.DTO;
using App.Pedidos.UnitOfWork;
using App.UI.WebMVC.ActionFilters;
using App.UI.WebMVC.Models;
using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace App.UI.WebMVC.Controllers
{
    [ErrorActionFilter]
    public class UsuarioController : BaseController
    {
        public UsuarioController(ILog log, IUnitOfWork unit) : base(log, unit)
        {
        }

        // GET: Usuario

        public async Task<ActionResult> Index()
        {
            //User.Identity.
            _log.Info("Ejecucion del Controlador Usuario - Index -> OK");
            var lista = await _unit.Usuarios.ListarIndice();
            return View(lista);
        }

        public async Task<ActionResult> Details(int id)
        {
            return View(await _unit.Usuarios.BuscarPorId(id));
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> Create(UsuarioD usuario)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var mensajeRetorno = await _unit.Usuarios.CrearUsuario(usuario);
                    if (mensajeRetorno.Objeto != null) return RedirectToAction("Index", "Home");
                    else
                    {
                        ViewBag.ErrorMessage = mensajeRetorno.Mensaje;
                        return View(usuario);
                    }
                }
                return View(usuario);
            }
            catch
            {
                return View(usuario);
            }
        }

        // GET: Usuario/Edit/5
        [HttpGet]
        public async Task<ActionResult> Edit(int id)
        {
           
            return PartialView("Edit", await _unit.Usuarios.BuscarPorId(id));
        }

        // POST: Usuario/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(WB_Usuario usuario)
        {

                //if (ModelState.IsValid)
                //{
                    await _unit.Usuarios.ModificarUsuario(usuario);
                    return RedirectToAction("Index");
                //}
                //return View(usuario);

        }
        [HttpGet]
        //[ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id)
        {
            //return View(await _unit.Categorias.Obtener(id));
            return PartialView("Delete", await _unit.Usuarios.BuscarPorId(id));
        }

        // POST: Usuario/Delete/5
        [HttpPost]
        [ActionName("Delete")]
        public async Task<ActionResult> DeletePost(int id)
        {
            try
            {
                if ((await _unit.Usuarios.Eliminar(id)) != 0) return RedirectToAction("Index");

                return View(await _unit.Usuarios.Obtener(id));
            }
            catch
            {
                return View(await _unit.Usuarios.Obtener(id));
            }
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            return View(new UserViewModel { ReturnUrl = returnUrl });
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> Login(UserViewModel user)
        {
            if (!ModelState.IsValid) return View(user);

            var usuarioValido = await _unit.Usuarios.ValidarUsuario(/*usuario*/ user.Email, user.Password);

            //var cliente = await _unit.Clientes.BuscarId(usuarioValido.IdCliente);

            if (usuarioValido == null)
            {
                ModelState.AddModelError("Error", "Email o Password inválido");
                return View(user);
            }

            var identity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Email, usuarioValido.Email),
                new Claim(ClaimTypes.Role, usuarioValido.Rol.ToString()),
                //new Claim(ClaimTypes.Name, $"{cliente.Nombres} {cliente.Apellidos}"),
                //new Claim(ClaimTypes.NameIdentifier, usuarioValido.IdUsuario.ToString())
            }, "ApplicationCookie");

            var context = Request.GetOwinContext();
            var authManager = context.Authentication;

            authManager.SignIn(identity);
            return RedirectToLocal(user.ReturnUrl);
        }


        public ActionResult Logout()
        {
            var context = Request.GetOwinContext();
            var authManager = context.Authentication;

            authManager.SignOut("ApplicationCookie");

            return RedirectToAction("Login", "Usuario");
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }


        [Route("ListByFilters/{correoID}")]
        public async Task<PartialViewResult> ListByFilters(string correoID)
        {
            List<WB_Usuario> lstUsuarios = new List<WB_Usuario>();

            if (!correoID.Equals("-"))
            {
                //var categoria = await _unit.Categorias.BuscarPorId(int.Parse(categoriaId));
                var usuario = await _unit.Usuarios.Obtener(int.Parse(correoID));
                lstUsuarios.Add(usuario);
            }
            else
            {
                var resultado = await _unit.Usuarios.Listar();
                lstUsuarios = resultado.ToList();
            }
            return PartialView("_List", lstUsuarios);
        }
        

    
    }
}
