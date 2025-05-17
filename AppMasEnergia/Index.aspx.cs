using AppMasEnergia.Entidad;
using AppMasEnergia.Entidades;
using AppMasEnergia.Logica;
using System;
using System.Web.UI.WebControls;

namespace AppMasEnergia
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Solo limpia mensaje si no es postback
            if (!IsPostBack)
            {
                lblMensaje.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string documento = txtDocumento.Text.Trim();
            string contrasena = txtClave.Text.Trim();

            ClLoginL logica = new ClLoginL();
            Administrador admin = logica.ValidarLogin(documento, contrasena);

            if (admin != null)
            {
                Session["Admin"] = admin;
                Response.Redirect("~/Vista/VerPrestamos.aspx");
            }
            else
            {
                lblMensaje.Text = "Documento o contraseña incorrectos.";
            }
        }
    }
}
