using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories.Dapper
{
    public class RolRepository:Repository<Rol>
    {
        public RolRepository(string connectionString) : base(connectionString)
        {
        }
    }
}
