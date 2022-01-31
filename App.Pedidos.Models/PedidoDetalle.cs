using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    public class PedidoDetalle
    {
        //[Key]
        //[DisplayName("Codigo Pedido")]
        public int IdPedido { get; set; }
        //[DisplayName("Item Codigo")]
        public int Item { get; set; }
        public decimal Cantidad { get; set; }
        public decimal Total { get; set; }
    }
}
