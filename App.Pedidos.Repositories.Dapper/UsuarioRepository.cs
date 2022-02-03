using System;
using App.Pedidos.Models;
using Dapper;
using Dapper.Contrib.Extensions;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class UsuarioRepository:Repository<WB_Usuario>,IUsuarioRepository
    {
        public UsuarioRepository(string connectionString) : base(connectionString)
        {
        }

        public WB_Usuario BuscarPorId(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return connection.GetAll<WB_Usuario>().Where(c => c.IdUsuario.Equals(id)).First();
            }
        }

        public async Task<IEnumerable<WB_Usuario>> Listar(string nombres)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@nombres", nombres);
                return await connection.QueryAsync<WB_Usuario>("select IdUsuario, UserName, [Password],Email,TipoUsuario,FechaCreacion from dbo.WB_Usuario " +
                                                        "where UserName like '%@nombres%'", parameters,
                                                        commandType: System.Data.CommandType.Text);
            }
        }

        public async Task<int> Eliminar(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);
                return await connection.ExecuteAsync("update dbo.WB_Usuario " +
                                                "set Estado = 0 " +
                                                "where IdUsuario = @id", parameters,
                                                commandType: System.Data.CommandType.Text);
            }
        }

        public async Task<WB_Usuario> ValidarUsuario(/*Usuario usuario*/ string email, string password)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@email", /*usuario.Email*/ email);
                parameters.Add("@password", /*usuario.Password*/ password);

                var user = await connection.QueryFirstOrDefaultAsync<WB_Usuario>("dbo.[SP_ValidarUsuario]",
                    parameters, commandType: System.Data.CommandType.StoredProcedure);

                return user;
            }
        }

        public async Task<MensajeRetorno> CrearUsuario(WB_Usuario usuario)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string message = "";
                var parameters = new DynamicParameters();
                parameters.Add("@UseName", usuario.UsarName);
                parameters.Add("@Email", usuario.Email);
                parameters.Add("@Password", usuario.Password);
                parameters.Add("OV_message_error", message, System.Data.DbType.String,
                    System.Data.ParameterDirection.Output);

                var usuarioCreado = await connection.QueryFirstOrDefaultAsync<WB_Usuario>("dbo.uspCrearUsuario",
                    parameters, commandType: System.Data.CommandType.StoredProcedure);

                message = parameters.Get<string>("@OV_message_error");

                //return usuarioCreado;
                return new MensajeRetorno { Objeto = usuarioCreado, Mensaje = message };
            }
        }
    }
}
