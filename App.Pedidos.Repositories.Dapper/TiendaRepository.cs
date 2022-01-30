using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class TiendaRepository:Repository<Tienda>,ITiendaRepository
    {
        public TiendaRepository(string connectionString) : base(connectionString)
        {
        }

        public Tienda BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Tienda>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
