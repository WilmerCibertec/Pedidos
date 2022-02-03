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
        //[Key]
        //[DisplayName("Codigo Usuario")]
        public int IdUsuario { get; set; }

        //[DisplayName("Usuario")]
        //[Required]
        public string UsarName { get; set; }

        //[DisplayName("Contraseña")]
        //[Required]
        public string Password { get; set; }

        //[DisplayName("Correo Electronico")]
        //[Required(ErrorMessage = "Indique la dirección de Email")]
        //[DataType(DataType.EmailAddress,ErrorMessage = "Informe una dirección de Email")]
        public string Email { get; set; }

        //[DisplayName("Tipo Usuario")]
        //[Required]
        public int TipoUsuario { get; set; }

        public bool Estado { get; set; }

        //[DisplayName("Codigo Cliente")]
        //[Required]
        public int IdCliente { get; set; }

        //[DisplayName("Fecha Creacion")]
        //[Required]
        public DateTime? FechaCreacion { get; set; }

        //[DisplayName("Fecha Actualizacion")]
        //[Required]
        public DateTime? FechaActualizacion { get; set; }
        public int Rol { get; set; }
    }
}
