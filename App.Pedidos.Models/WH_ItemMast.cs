using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App.Pedidos.Models
{
    //[Table("ItemMast")]
    public class WH_ItemMast
    {
        //[Key]
        [DisplayName("CODIGO")]
        public int Item { get; set; }

        [DisplayName("LINEA")]
        public int Linea { get; set; }

        [DisplayName("FAMILIA")]
        public int Familia { get; set; }

        [DisplayName("SUB-FAMILIA")]
        public int SubFamilia { get; set; }

        [DisplayName("DESCRIPCION")]
        [Required(ErrorMessage = "Se debe ingresar valor")]
        public string DescripcionLocal { get; set; }

        [DisplayName("UNIDAD")]
        public string UnidadCodigo { get; set; }

        [DisplayName("ESTADO")]
        [Required(ErrorMessage = "Elegir estado")]
        public bool? Estado { get; set; }
    }
}
