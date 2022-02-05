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
    //[Table("ClaseSubFamilia")]
    public class WH_ClaseSubFamilia
    {
        //[ExplicitKey]
        [DisplayName("LINEA")]
        public int IdLinea { get; set; }

        //[ExplicitKey]
        [DisplayName("FAMILIA")]
        public int IdFamilia { get; set; }

        //[ExplicitKey]
        [DisplayName("SUB-FAMILIA")]
        public int IdSubFamilia { get; set; }
        
        [DisplayName("DESCRIPCION")]
        [Required(ErrorMessage = "Se debe ingresar valor")]
        public string DescripcionLocal { get; set; }

        [DisplayName("ESTADO")]
        [Required(ErrorMessage = "Elegir estado")]
        public bool Estado { get; set; }

    }
}
