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
    public class ClienteRepository:Repository<CO_Clientes>,IClienteRepository
    {
        public ClienteRepository(string connectionString) : base(connectionString)
        {
        }

        public CO_Clientes BuscarPorId(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.GetAll<CO_Clientes>().Where(c => c.IdPersona.Equals(id)).First();
            }
        }

        public Task<int> Eliminar(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return connection.ExecuteAsync("update CO_Cliente " +
                                                "set Estado = 0 " +
                                                "where IdPersona = @id", parameters,
                                                commandType: System.Data.CommandType.Text);
            }
        }

        public Task<IEnumerable<CO_Clientes>> Listar(string nombre)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Nombres", nombre);
                return connection.QueryAsync<CO_Clientes>("dbo.usp_ListarClientes", parameters,commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public Task<CO_Clientes> BuscarId(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);
                var user =  connection.QueryFirstOrDefaultAsync<CO_Clientes>("Select IdPersona,Nombres,Apellidos,Documento "+
                                                                                "from CO_Clientes where IdPersona = @id",
                    parameters, commandType: System.Data.CommandType.Text);

                return user;
            }
        }

        public async Task<IEnumerable<CO_Clientes>> ListarClientes()
        {
            using (var connection = new SqlConnection(_connectionString))
            {

                var user = await connection.QueryAsync<CO_Clientes>("select IdPersona,Documento,Nombres,Apellidos" +
                    "from CO_Clientes with(nolock) ",
                     commandType: System.Data.CommandType.Text);

                return user;
            }
        }
    }
}
