using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    public class WB_Usuario
    {
        [ExplicitKey]
        [DisplayName("CODIGO")]
        public int IdUsuario { get; set; }

        [DisplayName("CONTRASEÑA")]
        [Required]
        public string Password { get; set; }

        [DisplayName("CORREO ELECTRONICO")]
        [Required(ErrorMessage = "Indique la dirección de Email")]
        public string Email { get; set; }

        [DisplayName("TIPO USUARIO")]
        [Required]
        public int TipoUsuario { get; set; }

        [DisplayName("ESTADO")]
        [Required]
        public bool Estado { get; set; }

        [DisplayName("CODIGO CLIENTE")]
        [Required]
        public int IdCliente { get; set; }

        [DisplayName("Fecha Creacion")]
        [Required]
        public DateTime? FechaCreacion { get; set; }

        [DisplayName("Fecha Actualizacion")]
        [Required]
        public DateTime? FechaActualizacion { get; set; }
        public int Rol { get; set; }
    }
}
