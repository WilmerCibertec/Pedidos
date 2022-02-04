using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using App.Pedidos.Models.DTO;
using System.Data.SqlClient;
using Dapper;

namespace App.Pedidos.Repositories.Dapper
{
    public class PedidoRepository:Repository<PedidoDTO>,IPedidoRepository
    {
        public PedidoRepository(string connectionString) : base(connectionString)
        {
        }

        //public CO_Pedido BuscarPorId(int id)
        //{
        //    throw new NotImplementedException();
        //}

        //public Task<int> Eliminar(int id)
        //{
        //    throw new NotImplementedException();
        //}

        //public Task<IEnumerable<CO_Pedido>> Listar(string Pedido)
        //{
        //    throw new NotImplementedException();
        //}

        public async Task<IEnumerable<PedidoDTO>> ListarPedido()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                //var parameters = new DynamicParameters();
                //parameters.Add("@Nombres", nombre);
                var list = connection.QueryAsync<PedidoDTO>("SELECT Id,CodPedido,Sucursal,b.Descripcion as Tienda,FechaPedido,MontoTotal,Estado,c.Descripcion as DesEstado " +
                                                        " from CO_Pedido a inner join CO_Tiendas b on a.Sucursal = b.CodTienda inner join CO_Estado c on a.Estado = c.IdEstado", 
                                                        "", commandType: System.Data.CommandType.Text);

                return await list;
            }
        }
    }
}
