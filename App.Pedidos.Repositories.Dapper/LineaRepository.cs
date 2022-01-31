using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dapper.Contrib.Extensions;
using Dapper;

namespace App.Pedidos.Repositories.Dapper
{
    public class LineaRepository:Repository<WH_ClaseLinea>,ILineaRepository
    {
        public LineaRepository(string connectionString) : base(connectionString)
        {
        }

        public WH_ClaseLinea BuscarPorId(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.GetAll<WH_ClaseLinea>().Where(c => c.Id.Equals(id)).First();
            }
        }

        public Task<int> Eliminar(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return connection.ExecuteAsync("update dbo.CO_ClaseLinea " +
                                                "set Estado = 0 " +
                                                "where Linea = @id", parameters,
                                                commandType: System.Data.CommandType.Text);
            }
        }

        public Task<IEnumerable<WH_ClaseLinea>> Listar(string Descripcion)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@descripcion", Descripcion);
                return connection.QueryAsync<WH_ClaseLinea>("select Linea,DescripcionLocal,Estado from dbo.CO_ClaseLinea " +
                                                        "where DescripcionLocal like '%@descripcion%'", parameters,
                                                        commandType: System.Data.CommandType.Text);
            }
        }
    }
}
