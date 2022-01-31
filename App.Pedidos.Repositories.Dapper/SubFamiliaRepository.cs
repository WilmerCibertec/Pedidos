using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class SubFamiliaRepository:Repository<WH_ClaseSubFamilia>,ISubFamiliaRepository
    {
        public SubFamiliaRepository(string connectionString) : base(connectionString)
        {
        }

        public WH_ClaseSubFamilia BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<WH_ClaseSubFamilia>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
