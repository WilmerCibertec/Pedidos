using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace App.UI.WebMVC.Models
{
    public class UserViewModel
    {
        [Required(ErrorMessage = "Debe indicar el correo obligatoriamente.")]
        [DataType(DataType.EmailAddress)]
        //[RegularExpression("^[a-z0-9!#$%&'*",ErrorMessage = "El valor no cumple con la estructura de correo,")]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [StringLength(10, ErrorMessage = "El número de caracteres excede al límite permitido", MinimumLength = 5)]
        public string Password { get; set; }
        public string ReturnUrl { get; set; }
    }
}