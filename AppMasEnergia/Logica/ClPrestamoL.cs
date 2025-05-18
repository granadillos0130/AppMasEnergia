using AppMasEnergia.Datos;
using AppMasEnergia.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppMasEnergia.Logica
{
    public class ClPrestamoL
    {
        ClPrestamoD clPrestamoD = new ClPrestamoD();
        public List<Prestamo> ObtenerPrestamos()
        {
            return clPrestamoD.ObtenerPrestamos();
        }
    }
}