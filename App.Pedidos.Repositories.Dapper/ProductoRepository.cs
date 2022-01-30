using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class ProductoRepository:Repository<Producto>,IProductoRepository
    {
        public ProductoRepository(string connectionString) : base(connectionString)
        {
        }

        public Producto BuscarPorId(int id)
        {
            throw new NotImplementedException();
        }

        public Task<int> Eliminar(int id)
        {
            throw new NotImplementedException();
        }

        public Task<IEnumerable<Producto>> Listar(string Descripcion)
        {
            throw new NotImplementedException();
        }
    }
}
