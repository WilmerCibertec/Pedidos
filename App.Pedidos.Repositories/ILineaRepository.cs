﻿using System;
using App.Pedidos.Models;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Repositories
{
    public interface ILineaRepository:IRepository<WH_ClaseLinea>
    {
        WH_ClaseLinea BuscarPorId(int id);
        Task<IEnumerable<WH_ClaseLinea>> Listar(string Descripcion);
        Task<int> Eliminar(int id);
    }
}