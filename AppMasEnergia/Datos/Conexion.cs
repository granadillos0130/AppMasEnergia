using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;

namespace AppMasEnergia.Datos
{
    public class Conexion
    {
        SqlConnection conex = null;
        public Conexion () 
        {
            conex = new SqlConnection("Data Source=.;Initial Catalog=dbMasEnergia;Integrated Security=True;");
        }

        public SqlConnection MtdAbrirConexion()
        {
            conex.Open();
            return conex;
        }

        public SqlConnection MtdCerrarConexion()
        {
            conex.Close();
            return conex;
        }
    }
}