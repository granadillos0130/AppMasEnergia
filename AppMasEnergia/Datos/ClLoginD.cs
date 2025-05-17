using System.Data;
using System.Data.SqlClient;
using AppMasEnergia.Entidades;

namespace AppMasEnergia.Datos
{
    public class ClLoginD
    {
        Conexion cn = new Conexion();

        public Administrador Login(string documento, string contrasena)
        {
            using (SqlConnection con = cn.MtdAbrirConexion())
            {
                SqlCommand cmd = new SqlCommand("sp_LoginAdministrador", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Documento", documento);
                cmd.Parameters.AddWithValue("@Contrasena", contrasena);

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Administrador admin = new Administrador
                    {
                        AdminID = (int)dr["AdminID"],
                        Nombre = dr["Nombre"].ToString(),
                        Apellido = dr["Apellido"].ToString(),
                        Email = dr["Email"].ToString(),
                        Rol = dr["NombreRol"].ToString()
                    };
                    return admin;
                }
                return null;
            }
        }
    }
}
