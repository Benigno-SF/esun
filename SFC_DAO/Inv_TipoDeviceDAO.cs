using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class Inv_TipoDeviceDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Regi_Inv_TipoDevice(Inv_TipoDeviceBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProceso_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpr", e.vnIdTipoDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpr", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProc", e.vbEstado));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet List_Inv_TipoDevice(Inv_TipoDeviceBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Inv_TipoDevice_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdTipoDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDevice", e.vnIdTipoDevice));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
