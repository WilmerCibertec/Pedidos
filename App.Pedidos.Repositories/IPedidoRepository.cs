using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IPedidoRepository:IRepository<Pedido>
    {
        Pedido BuscarPorId(int id);
        Task<IEnumerable<Pedido>> Listar(string Pedido);
        Task<int> Eliminar(int id);
    }
}
