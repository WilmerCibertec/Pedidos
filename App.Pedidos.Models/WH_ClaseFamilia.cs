using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    //[Table("ClaseFamilia")]
    public class WH_ClaseFamilia
    {
        [ExplicitKey]
        [DisplayName("LINEA")]
        public int IdLinea { get; set; }

        [ExplicitKey]
        [DisplayName("FAMILIA")]
        public int IdFamilia { get; set; }

        [DisplayName("DESCRIPCION")]
        public string DescripcioLocal { get; set; }

        public bool? Estado { get; set; }
    }
}
