using AppMasEnergia.Datos;
using AppMasEnergia.Entidades;

namespace AppMasEnergia.Logica
{
    public class ClLoginL
    {
        ClLoginD loginDao = new ClLoginD();

        public Administrador ValidarLogin(string documento, string contrasena)
        {
            return loginDao.Login(documento, contrasena);
        }
    }
}
