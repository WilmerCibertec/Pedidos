using System;
using App.Pedidos.Models;
using Dapper;
using Dapper.Contrib.Extensions;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using App.Pedidos.Models.DTO;

namespace App.Pedidos.Repositories.Dapper
{
    public class UsuarioRepository:Repository<WB_Usuario>,IUsuarioRepository
    {
        public UsuarioRepository(string connectionString) : base(connectionString)
        {
        }

        public async Task<WB_Usuario> BuscarPorId(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", id);

                var user =  await connection.QueryFirstOrDefaultAsync<WB_Usuario>("Select IdUsuario,Email,TipoUsuario,IdCLiente,Estado "+
                    "from dbo.WB_Usuario where IdUsuario = @id",
                    parameters, commandType: System.Data.CommandType.Text);

                return user;
            }
        }

        public async Task<IEnumerable<WB_Usuario>> Listar(string nombres)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@nombres", nombres);
                return await connection.QueryAsync<WB_Usuario>("select IdUsuario, [Password],Email,TipoUsuario,FechaCreacion from dbo.WB_Usuario " +
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

        public async Task<MensajeRetorno> CrearUsuario(UsuarioD usuario)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string message = "";
                var parameters = new DynamicParameters();
                parameters.Add("@Nombre", usuario.Nombres);
                parameters.Add("@Apellido", usuario.Apellidos);
                parameters.Add("@Documento", usuario.Documento);
                parameters.Add("@Direccion", usuario.Direccion);
                parameters.Add("@Distrito", usuario.Distrito);
                parameters.Add("@Provincia", usuario.Provincia);
                parameters.Add("@Telefono", usuario.Telefono);
                parameters.Add("@Email", usuario.Email);
                parameters.Add("@Password", usuario.Password);
                parameters.Add("@Error", message, System.Data.DbType.String,
                    System.Data.ParameterDirection.Output);

                var usuarioCreado = await connection.QueryFirstOrDefaultAsync<UsuarioD>("[dbo].[sp_CrearUsuarioWeb]",
                    parameters, commandType: System.Data.CommandType.StoredProcedure);

                message = parameters.Get<string>("@Error");

                //return usuarioCreado;
                return new MensajeRetorno { Objeto = usuarioCreado, Mensaje = message };
            }
        }

        public async Task<IEnumerable<WB_Usuario>> ListarIndice()
        {
            using (var connection = new SqlConnection(_connectionString))
            {

                var user = await connection.QueryAsync<WB_Usuario>("dbo.sp_ListarUsuarios",
                     commandType: System.Data.CommandType.StoredProcedure);

                return user;
            }
        }

        public async Task<int> ModificarUsuario(WB_Usuario entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@id", entidad.IdUsuario);
                parameters.Add("@email",  entidad.Email);
                parameters.Add("@estado", entidad.Estado);

                var user = await connection.ExecuteAsync("dbo.sp_ActualizarUsuario",
                    parameters, commandType: System.Data.CommandType.StoredProcedure);

                return user;
            }
        }
    }
}
