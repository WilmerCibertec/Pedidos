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

        public async Task<int> AgregarLinea(WH_ClaseLinea entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Descripcion", entidad.DescripcionLocal);
                parameters.Add("@Estado", entidad.Estado);
                return await connection.ExecuteAsync("[dbo].[sp_CrearLinea]", parameters,
                                                commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<int> ModificarLinea(WH_ClaseLinea entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@Descripcion", entidad.DescripcionLocal);
                parameters.Add("@Estado", entidad.Estado);
                parameters.Add("@Id", entidad.Linea);
                return await connection.ExecuteAsync("[dbo].[sp_ModificarLinea]", parameters,
                                                commandType: System.Data.CommandType.StoredProcedure);
            }
        }

        public async Task<int> Eliminar(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return await connection.ExecuteAsync("update dbo.WH_ClaseLinea " +
                                                "set Estado = 0 " +
                                                "where Linea = @id", parameters,
                                                commandType: System.Data.CommandType.Text);
            }
        }

        public async Task<IEnumerable<WH_ClaseLinea>> Listar(string Descripcion)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@descripcion", Descripcion);
                return await connection.QueryAsync<WH_ClaseLinea>("select Linea,DescripcionLocal,Estado from dbo.WH_ClaseLinea " +
                                                        "where DescripcionLocal like '%@descripcion%'", parameters,
                                                        commandType: System.Data.CommandType.Text);
            }
        }

    }
}
