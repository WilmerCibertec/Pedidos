using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    //[Table("ItemMast")]
    public class Producto
    {
        //[Key]
        public int Item { get; set; }

        //[ExplicitKey]
        public int Linea { get; set; }

        //[ExplicitKey]
        public int Familia { get; set; }

        //[ExplicitKey]
        public int SubFamilia { get; set; }

        //[DisplayName("Descripcion")]
        public string DescripcionLocal { get; set; }

        public string UnidadCodigo { get; set; }

        public bool? Estado { get; set; }
    }
}
