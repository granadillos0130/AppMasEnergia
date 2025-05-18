using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using AppMasEnergia.Entidades;
using AppMasEnergia.Logica;

namespace AppMasEnergia.Vista
{
    public partial class VerPrestamos : Page
    {
        private ClPrestamoL clPrestamoL = new ClPrestamoL(); // Instancia de ClPrestamoL

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPrestamos();
            }
        }

        private void CargarPrestamos()
        {
            try
            {
                // Obtener todos los préstamos desde la lógica
                List<Prestamo> prestamos = clPrestamoL.ObtenerPrestamos(); // Usar la instancia para llamar al método

                if (prestamos != null && prestamos.Count > 0)
                {
                    gvPrestamos.DataSource = prestamos;
                    gvPrestamos.DataBind();
                }
                else
                {
                    gvPrestamos.DataSource = null;
                    gvPrestamos.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Aquí podrías mostrar el error en una etiqueta si deseas
                // lblMensaje.Text = "Error al cargar los préstamos: " + ex.Message;
                throw;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {

        }
    }
}
