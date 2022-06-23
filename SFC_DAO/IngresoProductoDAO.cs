using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class IngresoProductoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListIngresoProducto(IngresoProductoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Guias_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet IngresoProductoRegi(IngresoProductoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Guia_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroGuia", e.vcNroGuia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdVariedad", e.vnIdVariedad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nCantProd", e.vnCantProd));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nKiloAproxProd", e.vnKiloAproxProd));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));

            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet IngresoProductoDel(IngresoProductoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_IngresoProdTemp_Del", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProd", e.vnIdProd));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

    }
}
