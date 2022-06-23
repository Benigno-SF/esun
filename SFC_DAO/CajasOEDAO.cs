using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class CajasOEDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet RegiCajasOE(CajasOEBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CajasOE_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCajasOE", e.vnIdCajasOE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdVariedad", e.vnIdVariedad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nCajas", e.vnCajas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bPorConfirmar", e.vbPorConfirmar));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet CajasOEList(CajasOEBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CajasOE_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCajasOE", e.vnIdCajasOE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdVariedad", e.vnIdVariedad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public DataSet CajasOEDelete(CajasOEBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CajasOE_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCajasOE", e.vnIdCajasOE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
