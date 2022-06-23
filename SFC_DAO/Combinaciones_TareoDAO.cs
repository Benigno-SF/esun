using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;

namespace SFC_DAO
{
    public class Combinaciones_TareoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet DAO_listar_combinaciones(Combinaciones_TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_OBTENER_TABLASTAREO_DINAMICO]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISEMPRESA", e.ID_EMPRESA_COM_LIST));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISBASEDATOS", e.BD_COM_LIST));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.TIPO_COM_LIST));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
