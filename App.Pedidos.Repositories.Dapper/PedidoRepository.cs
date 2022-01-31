using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class PedidoRepository:Repository<CO_Pedido>,IPedidoRepository
    {
        public PedidoRepository(string connectionString) : base(connectionString)
        {
        }

        public CO_Pedido BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<CO_Pedido>> Listar(string Pedido)
        {
            throw new NotImplementedException();
        }
    }
}
