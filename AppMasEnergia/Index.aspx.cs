using AppMasEnergia.Entidades;
using AppMasEnergia.Logica;
using System;
using System.Web.UI;

namespace AppMasEnergia
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                
                lblMensaje.Text = "";
                errorContainer.Style["display"] = "none";

               
                txtDocumento.Focus();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
               
                string documento = txtDocumento.Text.Trim();
                string contrasena = txtClave.Text.Trim();

                
                if (string.IsNullOrEmpty(documento))
                {
                    MostrarError("Por favor, ingrese su documento.");
                    txtDocumento.Focus();
                    return;
                }

                if (string.IsNullOrEmpty(contrasena))
                {
                    MostrarError("Por favor, ingrese su contraseña.");
                    txtClave.Focus();
                    return;
                }

                
                if (documento.Length < 6)
                {
                    MostrarError("El documento debe tener al menos 6 caracteres.");
                    txtDocumento.Focus();
                    return;
                }

                if (contrasena.Length < 4)
                {
                    MostrarError("La contraseña debe tener al menos 4 caracteres.");
                    txtClave.Focus();
                    return;
                }

                
                ClLoginL logica = new ClLoginL();
                Administrador admin = logica.ValidarLogin(documento, contrasena);

                if (admin != null)
                {
                    
                    Session["Admin"] = admin;
                    Session["AdminID"] = admin.AdminID;
                    Session["AdminNombre"] = admin.Nombre + " " + admin.Apellido;
                    Session["AdminRol"] = admin.Rol;

                  
                    txtDocumento.Text = "";
                    txtClave.Text = "";

                    
                    Response.Redirect("~/Vista/VerPrestamos.aspx", false);
                }
                else
                {
                
                    MostrarError("Documento o contraseña incorrectos. Verifique sus credenciales e intente nuevamente.");
                    txtClave.Text = "";
                    txtClave.Focus();
                }
            }
            catch (Exception ex)
            {
               
                MostrarError("Error del sistema: No se pudo procesar la solicitud. Intente nuevamente.");

            
                System.Diagnostics.Debug.WriteLine($"Error en Login: {ex.Message}");
            }
        }

        private void MostrarError(string mensaje)
        {
            lblMensaje.Text = mensaje;
            errorContainer.Style["display"] = "block";

            // Agregar script para mostrar animación
            string script = @"
                setTimeout(function() {
                    var errorContainer = document.getElementById('" + errorContainer.ClientID + @"');
                    if (errorContainer) {
                        errorContainer.classList.add('show');
                    }
                }, 100);
            ";
            ClientScript.RegisterStartupScript(this.GetType(), "ShowError", script, true);
        }
    }
}