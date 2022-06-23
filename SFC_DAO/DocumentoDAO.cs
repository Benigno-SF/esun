using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class DocumentoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListDocumento(DocumentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Documento_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDocumento", e.vnIdDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDoc", e.vnIdTipoDoc));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DeleteDocumento(DocumentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Documento_Del", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDocumento", e.vnIdDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDoc", e.vnIdTipoDoc));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiDocumento(DocumentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Documento_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDocumento", e.vnIdDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDoc", e.vnIdTipoDoc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTitulo", e.vcTitulo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNumero", e.vnNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSerie", e.vnSerie));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cReferencia", e.vcReferencia));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFilename", e.vcFilename));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bDownload", e.vbDownload));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bPublico", e.vbPublico));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuarioCrea));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


    }
}
