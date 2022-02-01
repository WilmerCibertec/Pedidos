
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    //[Table("Clientes")]
    public class CO_Clientes
    {
        [Key]
        //[DisplayName("IdPersona")]
        public int IdPersona { get; set; }

        public string Nombres { get; set; }

        public string Apellidos { get; set; }

        public string Documento { get; set; }

        public string Direccion { get; set; }
        public string Distrito { get; set; }
        public string Provincia { get; set; }
        public string Telefono { get; set; }
        public bool Estado { get; set; }

        //[DisplayName("Fecha Creacion")]
        public DateTime? FechaCreacion { get; set; }

        //[DisplayName("Fecha Actualizacion")]
        public DateTime? FechaActualizacion { get; set; }

    }
}
