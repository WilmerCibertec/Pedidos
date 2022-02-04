using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models.DTO
{
    public class PedidoDTO
    {
        public int Id { get; set; }
        public string CodPedido { get; set; }
        public string Sucursal { get; set; }
        public string Tienda { get; set; }
        public DateTime FechaPedido { get; set; }
        public decimal MontoTotal { get; set; }
        public int Estado { get; set; }
        public string DesEstado { get; set; }
    }
}
