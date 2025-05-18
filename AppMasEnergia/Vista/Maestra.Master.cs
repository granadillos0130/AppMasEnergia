using System;
using System.Web.UI;
using AppMasEnergia.Entidades;

namespace AppMasEnergia.Vista
{
    public partial class Maestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificar si el usuario está autenticado
            if (Session["Admin"] == null)
            {
                // Si no hay sesión activa, redirigir al login
                Response.Redirect("~/Index.aspx", false);
                return;
            }

            // Configurar información del usuario si es el primer carga
            if (!IsPostBack)
            {
                ConfigurarInformacionUsuario();
                ConfigurarNavegacion();
            }
        }

        private void ConfigurarInformacionUsuario()
        {
            try
            {
                // Obtener información del administrador de la sesión
                Administrador admin = (Administrador)Session["Admin"];

                if (admin != null)
                {
                    // Configurar nombre completo
                    string nombreCompleto = $"{admin.Nombre} {admin.Apellido}";
                    Session["AdminNombre"] = nombreCompleto;

                    // Configurar rol
                    Session["AdminRol"] = !string.IsNullOrEmpty(admin.Rol) ? admin.Rol : "Administrador";

                    // Configurar ID para uso posterior
                    Session["AdminID"] = admin.AdminID;
                    Session["AdminEmail"] = admin.Email;
                }
            }
            catch (Exception ex)
            {
                // Log del error (opcional)
                System.Diagnostics.Debug.WriteLine($"Error configurando usuario: {ex.Message}");

                // Limpiar sesión en caso de error
                Session.Clear();
                Response.Redirect("~/Index.aspx", false);
            }
        }

        private void ConfigurarNavegacion()
        {
            try
            {
                // Obtener la página actual
                string paginaActual = System.IO.Path.GetFileName(Request.PhysicalPath).ToLower();

                // Personalizar el header según la página
                switch (paginaActual)
                {
                    case "verprestamos.aspx":
                        // Configurar título específico para préstamos
                        break;
                    case "verproductos.aspx":
                        // Configurar título específico para productos
                        break;
                    case "verclientes.aspx":
                        // Configurar título específico para clientes
                        break;
                    default:
                        // Configuración por defecto
                        break;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Error configurando navegación: {ex.Message}");
            }
        }

        //protected void Page_PreRender(object sender, EventArgs e)
        //{
        //    // Registrar scripts necesarios para el funcionamiento
        //    RegistrarScripts();
        //}

        //private void RegistrarScripts()
        //{
        //    // Script para mantener el estado del sidebar
        //    string scriptSidebar = @"
        //        // Mantener estado del sidebar en localStorage
        //        if (localStorage.getItem('sidebarCollapsed') === 'true') {
        //            document.getElementById('sidebar').classList.add('collapsed');
        //            document.getElementById('mainContent').classList.add('expanded');
        //        }
        //    ";

        //    ClientScript.RegisterStartupScript(this.GetType(), "SidebarState", scriptSidebar, true);

        //    // Script para configurar tooltips (si se necesitan)
        //    string scriptTooltips = @"
        //        // Configurar tooltips para elementos con atributo title
        //        document.addEventListener('DOMContentLoaded', function() {
        //            const elementsWithTitle = document.querySelectorAll('[title]');
        //            elementsWithTitle.forEach(function(element) {
        //                element.addEventListener('mouseenter', function() {
        //                    // Lógica para mostrar tooltip personalizado
        //                });
        //            });
        //        });
        //    ";

        //    ClientScript.RegisterStartupScript(this.GetType(), "Tooltips", scriptTooltips, true);
        //}

        // Método público para obtener información del usuario actual
        public Administrador ObtenerUsuarioActual()
        {
            return Session["Admin"] as Administrador;
        }

        // Método público para verificar permisos (extensible)
        public bool VerificarPermiso(string permiso)
        {
            try
            {
                Administrador admin = ObtenerUsuarioActual();
                if (admin == null) return false;

                // Aquí se pueden implementar verificaciones de permisos específicas
                // Por ahora, todos los administradores tienen todos los permisos
                return true;
            }
            catch
            {
                return false;
            }
        }

        // Método para cerrar sesión
        public void CerrarSesion()
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/Index.aspx", false);
        }
    }
}