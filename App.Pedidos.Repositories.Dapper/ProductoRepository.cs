using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class ProductoRepository:Repository<WH_ItemMast>,IProductoRepository
    {
        public ProductoRepository(string connectionString) : base(connectionString)
        {
        }

        public WH_ItemMast BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<WH_ItemMast>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
