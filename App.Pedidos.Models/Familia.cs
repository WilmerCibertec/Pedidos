using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    [Table("ClaseFamilia")]
    public class Familia
    {
        [ExplicitKey]
        [DisplayName("Linea")]
        public int IdLinea { get; set; }

        [ExplicitKey]
        [DisplayName("Familia")]
        public int IdFamilia { get; set; }

        [DisplayName("Descripcion")]
        public string DescripcioLocal { get; set; }

        public bool? Estado { get; set; }
    }
}
