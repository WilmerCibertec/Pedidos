using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    //[Table("ClaseSubFamilia")]
    public class SubFamilia
    {
        //[ExplicitKey]
        //[DisplayName("Linea")]
        public int IdLinea { get; set; }

        //[ExplicitKey]
        //[DisplayName("Familia")]
        public int IdFamilia { get; set; }

        //[ExplicitKey]
        //[DisplayName("SubFamilia")]
        public int IdSubFamilia { get; set; }
        
        //[DisplayName("Descripcion")]
        public string DescripcionLocal { get; set; }
        public bool? Estado { get; set; }

    }
}
