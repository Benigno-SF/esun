using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class FichaMesDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet RegiFichaMes (FichaMesBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FichaMes_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFichaMes", e.vnIdFichaMes));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFicha", e.vnIdFicha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nMes", e.vnMes));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListFichaMes(FichaMesBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FichaMes_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFichaMes", e.vnIdFichaMes));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFicha", e.vnIdFicha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
