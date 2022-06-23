using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class SubLineaDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListSubLinea(SubLineaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_SubLinea_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSubLinea", e.vnIdSubLinea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
