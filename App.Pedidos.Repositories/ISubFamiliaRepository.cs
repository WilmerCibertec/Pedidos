using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface ISubFamiliaRepository:IRepository<WH_ClaseSubFamilia>
    {
        WH_ClaseSubFamilia BuscarPorId(int id);
        Task<IEnumerable<WH_ClaseSubFamilia>> Listar(string Descripcion);
        Task<int> Eliminar(int id);
    }
}
