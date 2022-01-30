using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class PedidoDetalleRepository:Repository<PedidoDetalle>,IPedidoDetalleRepository
    {
        public PedidoDetalleRepository(string connectionString) : base(connectionString)
        {
        }

        public Linea BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Linea>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
