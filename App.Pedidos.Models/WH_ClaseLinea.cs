﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    public class WH_ClaseLinea
    {
        [Key]
        [DisplayName("Codigo")]
        public int Id { get; set; }

        [DisplayName("Descripcion")]
        public string DescripcionLocal { get; set; }

        public bool? Estado { get; set; }
    }
}
