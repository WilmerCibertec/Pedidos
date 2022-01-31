using App.Pedidos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IClienteRepository:IRepository<CO_Clientes>
    {
        CO_Clientes BuscarPorId(int id);
        Task<IEnumerable<CO_Clientes>> Listar(string nombre);
        Task<int> Eliminar(int id);
    }
}
