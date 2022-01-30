//using Dapper.Contrib.Extensions;
using Dapper.Contrib.Extensions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    [Table("ClaseLinea")]
    public class Linea
    {
        [Key]
        [DisplayName("Codigo")]
        public int IdLinea { get; set; }

        [DisplayName("Nombre Linea")]
        public string DescripcionLocal { get; set; }

        public bool? Estado { get; set; }
    }
}
