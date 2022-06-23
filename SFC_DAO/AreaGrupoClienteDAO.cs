using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class AreaGrupoClienteDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet InfoAreaGrupoCliente(AreaGrupoClienteBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_InfoAreaGrupoCliente_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
