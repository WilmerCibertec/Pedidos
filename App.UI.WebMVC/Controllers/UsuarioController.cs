using App.Pedidos.Models;
using App.Pedidos.UnitOfWork;
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
    public class UsuarioController : BaseController
    {
        public UsuarioController(ILog log, IUnitOfWork unit) : base(log, unit)
        {
        }

        // GET: Usuario
        public async Task<ActionResult> Index()
        {
            //User.Identity.
            var lista = await _unit.Usuarios.Listar();
            return View(lista);
        }

        public async Task<ActionResult> Details(int id)
        {
            return View(await _unit.Usuarios.Obtener(id));
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<ActionResult> Create(WB_Usuario usuario)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    //await _unit.Usuarios.Agregar(usuario);
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
        public async Task<ActionResult> Edit(int id)
        {
            return View(await _unit.Usuarios.Obtener(id));
        }

        // POST: Usuario/Edit/5
        [HttpPost]
        public async Task<ActionResult> Edit(WB_Usuario usuario)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    await _unit.Usuarios.Modificar(usuario);
                    return RedirectToAction("Index");
                }
                return View(usuario);
            }
            catch
            {
                return View();
            }
        }


        public ActionResult Delete(int id)
        {
            return View();
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
            /*
            Usuario usuario = new Usuario
            {
                Email = user.Email,
                Password = user.Password
            };
            */
            WB_Usuario usuarioValido = await _unit.Usuarios.ValidarUsuario(/*usuario*/ user.Email, user.Password);

            if (usuarioValido == null)
            {
                ModelState.AddModelError("Error", "Email o Password inválido");
                return View(user);
            }

            var identity = new ClaimsIdentity(new[]
            {
                new Claim(ClaimTypes.Email, usuarioValido.Email),
                new Claim(ClaimTypes.Role, usuarioValido.Rol.ToString()),
                //new Claim(ClaimTypes.Name, $"{usuarioValido.Nombres} {usuarioValido.Apellidos}"),
                //new Claim(ClaimTypes.NameIdentifier, usuarioValido.Id.ToString())
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
    }
}
