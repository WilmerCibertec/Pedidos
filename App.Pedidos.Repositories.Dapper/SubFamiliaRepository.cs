using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class SubFamiliaRepository:Repository<SubFamilia>,ISubFamiliaRepository
    {
        public SubFamiliaRepository(string connectionString) : base(connectionString)
        {
        }

        public SubFamilia BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<SubFamilia>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
