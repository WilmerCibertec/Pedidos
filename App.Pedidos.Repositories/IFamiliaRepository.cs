using App.Pedidos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IFamiliaRepository:IRepository<WH_ClaseFamilia>
    {
        WH_ClaseFamilia BuscarPorId(int id);
        Task<IEnumerable<WH_ClaseFamilia>> Listar(string nombre);
        Task<int> Eliminar(int id);
    }
}
