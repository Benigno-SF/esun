using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class OrganigramaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListOrganigrama(OrganigramaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Organigrama_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nidOrganigrama", e.vnidOrganigrama));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivel", e.vnIdNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivelMaster", e.vnIdNivelMaster));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DeleteItem(OrganigramaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Organigrama_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nidOrganigrama", e.vnidOrganigrama));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivel", e.vnIdNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivelMaster", e.vnIdNivelMaster));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet REgiOrganigrama(OrganigramaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Organigrama_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nidOrganigrama", e.vnidOrganigrama));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivelMaster", e.vnIdNivelMaster));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNivel", e.vnIdNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNivel", e.vnNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNomOrg", e.vcNomOrg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cImg", e.vcImg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDesOrgItem", e.vcDesOrgItem));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDesInfoItem", e.vcDesInfoItem)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
