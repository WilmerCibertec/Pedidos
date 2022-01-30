using App.Pedidos.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class ClienteRepository:Repository<Cliente>,IClienteRepository
    {
        public ClienteRepository(string connectionString) : base(connectionString)
        {
        }

        public Cliente BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<Cliente>> Listar(string nombre)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Nombres", nombre);
                return await connection.QueryAsync<Cliente>("dbo.usp_ListarClientes", parameters,commandType: System.Data.CommandType.Text);
            }
        }
    }
}
