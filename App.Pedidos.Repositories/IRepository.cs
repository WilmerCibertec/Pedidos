using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IRepository<T>where T:class
    {
        Task<int> Agregar(T entidad);
        Task<T> Obtener(T entidad);
        Task<T> Obtener(int id);
        Task<T> Obtener(string id);
        Task<IEnumerable<T>> Listar();
        Task<bool> Eliminar(T entidad);
        Task<bool> Modificar(T entidad);
    }
}
