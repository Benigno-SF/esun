using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class IncidenciaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListIncidencia(IncidenciaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Incidencia_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdIncidencia", e.vnIdIncidencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFechaIni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet IncidenciaRegi(IncidenciaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Incidencia_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdIncidencia", e.vnIdIncidencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFundo", e.vnIdFundo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipo", e.vnIdTipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescIncidencia", e.vcDescIncidencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));

            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
