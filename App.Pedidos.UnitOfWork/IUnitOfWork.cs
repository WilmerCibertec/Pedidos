using App.Pedidos.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.UnitOfWork
{
    public interface IUnitOfWork
    {
        IClienteRepository Clientes { get; }
        IFamiliaRepository Familias { get; }
        ILineaRepository Lineas { get; }
        IPedidoDetalleRepository PedidoDetalles { get; }
        IPedidoRepository Pedidos { get; }
        IProductoRepository Productos { get; }
        IRolRepository Roles { get; }
        ISubFamiliaRepository SubFamilias { get; }
        ITiendaRepository Tiendas { get; }
        IUsuarioRepository Usuarios { get; }
    }
}
