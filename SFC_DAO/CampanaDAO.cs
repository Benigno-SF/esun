using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class CampanaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListCampana(CampanaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Campana_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCampana", e.vnIdCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cultivo", e.cultivo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListCampanaBefore(CmbCampanaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Campana_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.idCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCampana", e.campNombre));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cultivo", e.cultivo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }


    }
}
