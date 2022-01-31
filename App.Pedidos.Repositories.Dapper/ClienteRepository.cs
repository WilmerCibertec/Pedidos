using App.Pedidos.Models;
using Dapper;
using Dapper.Contrib.Extensions;
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
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.GetAll<Cliente>().Where(c => c.Id.Equals(id)).First();
            }
        }

        public Task<int> Eliminar(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return connection.ExecuteAsync("update Comercial.Cliente " +
                                                "set Estado = 0 " +
                                                "where IdPersona = @id", parameters,
                                                commandType: System.Data.CommandType.Text);
            }
        }

        public Task<IEnumerable<Cliente>> Listar(string nombre)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Nombres", nombre);
                return connection.QueryAsync<Cliente>("dbo.usp_ListarClientes", parameters,commandType: System.Data.CommandType.StoredProcedure);
            }
        }
    }
}
