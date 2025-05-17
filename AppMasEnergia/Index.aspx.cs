using System;
using AppMasEnergia.Entidades;
using AppMasEnergia.Logica;

namespace AppMasEnergia
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string documento = txtDocumento.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();

            LoginLN logica = new LoginLN();
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
