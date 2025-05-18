using AppMasEnergia.Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace AppMasEnergia.Datos
{
    public class ClPrestamoD
    {
        Conexion cn = new Conexion();

        public List<Prestamo> ObtenerPrestamos()
        {
            List<Prestamo> listaPrestamos = new List<Prestamo>();
            try
            {
                using (var connection = cn.MtdAbrirConexion())
                {
                    SqlCommand cmd = new SqlCommand("sp_VerPrestamos", connection);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        while(dr.Read())
                        {
                            listaPrestamos.Add(new Prestamo()
                            {
                                PrestamoID = Convert.ToInt32(dr["PrestamoID"]),
                                Empresa = dr["Empresa"].ToString(),
                                Productos = dr["Productos"].ToString(),
                                CantidadTotalPrestada = Convert.ToInt32(dr["CantidadTotalPrestada"]),
                                FechaPrestamo = Convert.ToDateTime(dr["FechaPrestamo"]),
                                FechaDevolucionPrevista = dr["FechaDevolucionPrevista"] as DateTime?,
                                Estado = dr["Estado"].ToString(),
                                Observaciones = dr["Observaciones"].ToString()
                            });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Manejo de excepciones (opcional)
                System.Diagnostics.Debug.WriteLine($"Error al obtener préstamos: {ex.Message}");
            }
            finally
            {
                cn.MtdCerrarConexion();
            }
            return listaPrestamos;
        }
    }
}