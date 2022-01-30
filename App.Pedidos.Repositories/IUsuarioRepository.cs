using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IUsuarioRepository:IRepository<Usuario>
    {
        Usuario BuscarPorId(int id);
        Task<IEnumerable<Usuario>> Listar(string nombres);
        Task<int> Eliminar(int id);
    }
}
