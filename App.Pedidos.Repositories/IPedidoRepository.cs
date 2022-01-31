using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IPedidoRepository:IRepository<CO_Pedido>
    {
        CO_Pedido BuscarPorId(int id);
        Task<IEnumerable<CO_Pedido>> Listar(string Pedido);
        Task<int> Eliminar(int id);
    }
}
