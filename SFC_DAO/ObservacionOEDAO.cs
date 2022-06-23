using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class ObservacionOEDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet RegiObservacionOE(ObservacionOEBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ObservacionOE_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdObservacionOE", e.vnIdObservacionOE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescObservacion", e.vcDescObservacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ObservacionOEList(ObservacionOEBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ObservacionOE_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdObservacionOE", e.vnIdObservacionOE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ObservacionOEDelete(ObservacionOEBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ObservacionOE_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdObservacionOE", e.vnIdObservacionOE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
