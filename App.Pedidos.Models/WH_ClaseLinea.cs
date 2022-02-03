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
    public class WH_ClaseLinea
    {
        [ExplicitKey]
        [DisplayName("CODIGO")]
        public int Linea { get; set; }

        [DisplayName("DESCRIPCION")]
        //[Required(ErrorMessage = "Ingresar valor")]
        //[DataType(DataType.Text, ErrorMessage = "Ingresar valor de tipo texto.")]
        public string DescripcionLocal { get; set; }

        //[DisplayName("ESTADO")]
        public bool? Estado { get; set; }
    }
}
