using App.Pedidos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class FamiliaRepository:Repository<WH_ClaseFamilia>,IFamiliaRepository
    {
        public FamiliaRepository(string connectionString) : base(connectionString)
        {
        }

        public WH_ClaseFamilia BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<WH_ClaseFamilia>> Listar(string nombre)
        {
            throw new NotImplementedException();
        }
    }
}
