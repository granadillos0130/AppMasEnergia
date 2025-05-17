using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMasEnergia.Entidades
{
    public class UsuarioLogin
    {
        public int ID { get; set; }
        public string Rol { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
    }
}