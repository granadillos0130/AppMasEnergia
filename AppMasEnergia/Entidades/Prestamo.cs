using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMasEnergia.Entidades
{
    public class Prestamo
    {
        public int PrestamoID { get; set; }
        public string Empresa { get; set; }
        public string Productos { get; set; }
        public int CantidadTotalPrestada { get; set; }
        public DateTime FechaPrestamo { get; set; }
        public DateTime? FechaDevolucionPrevista { get; set; }
        public string Estado { get; set; }
        public string Observaciones { get; set; }
    }
}