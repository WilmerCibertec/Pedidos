using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class TiendaRepository:Repository<CO_Tiendas>,ITiendaRepository
    {
        public TiendaRepository(string connectionString) : base(connectionString)
        {
        }

        public CO_Tiendas BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<CO_Tiendas>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
