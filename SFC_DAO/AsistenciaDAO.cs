using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class AsistenciaDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet RegiAsis(AsistenciaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Asistencia_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNrodocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDispositivo", e.vnIdDispositivo)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipoMarca", e.vnTipoMarca));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListAsistencia(AsistenciaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Asistencia_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaRegistro", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDispositivo", e.vnIdDispositivo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
