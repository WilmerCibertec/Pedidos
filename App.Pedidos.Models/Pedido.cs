using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    public class Pedido
    {
        //[Key]
        //[DisplayName("Codigo Pedido")]
        public int Id { get; set; }

        //[DisplayName("N° Pedido")]
        public string CodPedido { get; set; }

        //[DisplayName("Tienda")]
        public string Sucursal { get; set; }
        public int IdCliente { get; set; }

        //[DisplayName("Fecha Pedido")]
        public DateTime? FechaPedido { get; set; }
        public decimal MontoTotal { get; set; }
        public bool Estado { get; set; }
    }
}
