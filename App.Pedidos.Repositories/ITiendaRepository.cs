using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface ITiendaRepository:IRepository<CO_Tiendas>
    {
        CO_Tiendas BuscarPorId(int id);
        Task<IEnumerable<CO_Tiendas>> Listar(string Descripcion);
        Task<int> Eliminar(int id);
    }
}
