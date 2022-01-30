using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class Repository<T> : IRepository<T> where T : class
    {
        protected string _connectionString;
        public Repository(string connectionString)
        {
            SqlMapperExtensions.TableNameMapper = (type) => { return $"{ type.Name}"; }; //Activar el mapeo de las tablas con respecto a las clases"Entidades"
            _connectionString = connectionString;
        }

        public async Task<int> Agregar(T entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.InsertAsync(entidad);
            }
        }
        public async Task<T> Obtener(T entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.GetAsync<T>(entidad);
            }
        }
        public async Task<T> Obtener(int id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.GetAsync<T>(id);
            }
        }
        public async Task<T> Obtener(string id)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.GetAsync<T>(id);
            }
        }
        public async Task<IEnumerable<T>> Listar()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.GetAllAsync<T>();
            }
        }
        public async Task<bool> Eliminar(T entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.DeleteAsync<T>(entidad);
            }
        }
        public async Task<bool> Modificar(T entidad)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                return await connection.UpdateAsync<T>(entidad);
            }
        }
    }
}
