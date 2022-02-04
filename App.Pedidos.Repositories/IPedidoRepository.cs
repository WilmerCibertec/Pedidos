using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using App.Pedidos.Models.DTO;

namespace App.Pedidos.Repositories
{
    public interface IPedidoRepository:IRepository<PedidoDTO>
    {
        //CO_Pedido BuscarPorId(int id);
        //Task<IEnumerable<CO_Pedido>> Listar(string Pedido);
        //Task<int> Eliminar(int id);
        Task<IEnumerable<PedidoDTO>> ListarPedido();
    }
}
