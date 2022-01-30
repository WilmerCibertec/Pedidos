using App.Pedidos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IFamiliaRepository:IRepository<Familia>
    {
        Familia BuscarPorId(int id);
        Task<IEnumerable<Familia>> Listar(string nombre);
        Task<int> Eliminar(int id);
    }
}
