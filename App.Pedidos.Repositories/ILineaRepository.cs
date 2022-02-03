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
        Task<IEnumerable<WH_ClaseLinea>> Listar(string Descripcion);
        Task<int> Eliminar(int id);
        Task<int> AgregarLinea(WH_ClaseLinea entidad);

        Task<int> ModificarLinea(WH_ClaseLinea entidad);
    }
}
