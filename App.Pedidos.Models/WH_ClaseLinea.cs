using System;
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
        [DisplayName("CODIGO")]
        public int Id { get; set; }

        [DisplayName("DESCRIPCION")]
        [Required(ErrorMessage = "Ingresar Valor")]
        [DataType(DataType.Text, ErrorMessage = "Ingresar texto")]
        public string DescripcionLocal { get; set; }

        [DisplayName("ESTADO")]
        public bool? Estado { get; set; }
    }
}
