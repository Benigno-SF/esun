using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class Inv_IncidenciaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Regi_Inv_Incidencia(Inv_IncidenciaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProceso_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpr", e.vnIdIncidencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpr", e.vnIdDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProc", e.vnIdArea));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet List_Inv_Incidencia(Inv_IncidenciaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EventoProg_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdIncidencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEventoProg", e.vnIdDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vnIdArea));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
