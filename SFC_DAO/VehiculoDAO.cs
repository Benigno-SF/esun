using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class VehiculoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public string[] ListVehiculo(VehiculoBE e)
        {
            List<string> lstVehiculo = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SE_Vehiculo_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            cmd.Parameters.Add(new SqlParameter("@cPlaca", e.vcPlaca)); 
            cmd.Parameters.Add(new SqlParameter("@cType", e.vcType));
            cmd.Parameters.Add(new SqlParameter("@cDescVehiculo", e.vcDescVehiculo));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            
            while (reader.Read())
            {
                lstVehiculo.Add(string.Format("{0}-{1}-{2}", reader["cPlaca"], reader["nIdVehiculo"], reader["cDescripcion"]));
            }
            cnx.Close();
            return lstVehiculo.ToArray();        
        }
    }
}
