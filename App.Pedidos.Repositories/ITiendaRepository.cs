using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface ITiendaRepository:IRepository<Tienda>
    {
        Tienda BuscarPorId(int id);
        Task<IEnumerable<Tienda>> Listar(string Descripcion);
        Task<int> Eliminar(int id);
    }
}
