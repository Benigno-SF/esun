using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;

namespace SFC_DAO
{
    public class ReporteAnalisisComprasDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet DAO_reporte_analisis_compra(ReporteAnalisisComprasBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_TRAZABILIDAD_COMPRAS]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 3000;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISFECHA_INI", e.REPORTE_FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISFECHA_FIN", e.REPORTE_FECHA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
