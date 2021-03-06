using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class Inv_UbicacionDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Regi_Inv_Ubicacion(Inv_UbicacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProceso_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdUbicacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vbEstado));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet List_Inv_Ubicacion(Inv_UbicacionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Inv_Ubicacion_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdUbicacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUbicacion", e.vnIdUbicacion));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
