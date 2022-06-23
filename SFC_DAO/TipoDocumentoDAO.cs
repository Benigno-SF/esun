using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class TipoDocumentoDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListTipoDocumento(TipoDocumentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_TipoDocumento_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDoc", e.vnIdTipoDoc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescTipoDoc", e.vcDescTipoDoc));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiTipoDocumento(TipoDocumentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_TipoDoc_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDoc", e.vnIdTipoDoc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescTipoDoc", e.vcDescTipoDoc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
