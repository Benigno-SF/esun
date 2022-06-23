using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class IntegranteDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListIntegrante(IntegranteBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Integrante_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nidIntegrante", e.vnidIntegrante));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivel", e.vnIdNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DeleteIntegrante(IntegranteBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Integrante_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nidIntegrante", e.vnidIntegrante));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivel", e.vnIdNivel));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiIntegrante(IntegranteBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Integrante_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nidIntegrante", e.vnidIntegrante));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivel", e.vnIdNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cImg", e.vcImg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescCargo", e.vcDescCargo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
