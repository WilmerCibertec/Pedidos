using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    [Table("Tiendas")]
    public class Tienda
    {
        [ExplicitKey]
        [DisplayName("Codigo Pedido")]
        public string CodTienda { get; set; }

        [DisplayName("Tienda")]
        public string Descripcion { get; set; }
        public string Direccion { get; set; }
    }
}
