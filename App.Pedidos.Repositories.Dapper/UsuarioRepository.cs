using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class UsuarioRepository:Repository<Usuario>,IUsuarioRepository
    {
        public UsuarioRepository(string connectionString) : base(connectionString)
        {
        }

        public Usuario BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Usuario>> Listar(string nombres)
        {
            throw new NotImplementedException();
        }
    }
}
