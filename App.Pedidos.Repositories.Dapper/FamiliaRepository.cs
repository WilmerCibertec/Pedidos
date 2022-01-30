using App.Pedidos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class FamiliaRepository:Repository<Familia>,IFamiliaRepository
    {
        public FamiliaRepository(string connectionString) : base(connectionString)
        {
        }

        public Familia BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Familia>> Listar(string nombre)
        {
            throw new NotImplementedException();
        }
    }
}
