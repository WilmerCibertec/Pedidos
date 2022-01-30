using App.Pedidos.Repositories;
using App.Pedidos.Repositories.Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.UnitOfWork
{
    public class PedidosUnitOfWork : IUnitOfWork
    {
        public PedidosUnitOfWork(string connectionString)
        {
            Clientes = new ClienteRepository(connectionString);
            Familias = new FamiliaRepository(connectionString);
            Lineas = new LineaRepository(connectionString);
            PedidoDetalles = new PedidoDetalleRepository(connectionString);
            Pedidos = new PedidoRepository(connectionString);
            Productos = new ProductoRepository(connectionString);
            //Roles = new RolRepository(connectionString);
            SubFamilias = new SubFamiliaRepository(connectionString);
            Tiendas = new TiendaRepository(connectionString);
            Usuarios = new UsuarioRepository(connectionString);
        }

        public IClienteRepository Clientes
        {
            get;
            private set;
        }
        public IFamiliaRepository Familias
        {
            get;
            private set;
        }
        public ILineaRepository Lineas
        {
            get;
            private set;
        }
        public IPedidoDetalleRepository PedidoDetalles
        {
            get;
            private set;
        }
        public IPedidoRepository Pedidos
        {
            get;
            private set;
        }
        public IProductoRepository Productos
        {
            get;
            private set;
        }
        public IRolRepository Roles
        {
            get;
            private set;
        }
        public ISubFamiliaRepository SubFamilias
        {
            get;
            private set;
        }
        public ITiendaRepository Tiendas
        {
            get;
            private set;
        }
        public IUsuarioRepository Usuarios
        {
            get;
            private set;
        }
    }
}
