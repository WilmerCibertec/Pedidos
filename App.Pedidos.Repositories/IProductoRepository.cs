﻿using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface IProductoRepository:IRepository<WH_ItemMast>
    {
        WH_ItemMast BuscarPorId(int id);
        Task<IEnumerable<WH_ItemMast>> Listar(string Descripcion);
        Task<int> Eliminar(int id);
    }
}
