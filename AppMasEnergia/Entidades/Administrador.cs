﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMasEnergia.Entidades
{
    public class Administrador
    {
        public int AdminID { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public string Rol { get; set; }
    }
}
