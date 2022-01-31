using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IUsuarioRepository:IRepository<WB_Usuario>
    {
        WB_Usuario BuscarPorId(int id);
        Task<IEnumerable<WB_Usuario>> Listar(string nombres);
        Task<int> Eliminar(int id);
    }
}
