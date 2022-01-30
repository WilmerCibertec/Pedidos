using App.Pedidos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IClienteRepository:IRepository<Cliente>
    {
        Cliente BuscarPorId(int id);
        Task<IEnumerable<Cliente>> Listar(string nombre);
        Task<int> Eliminar(int id);
    }
}
