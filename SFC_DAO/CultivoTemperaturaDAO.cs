using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class CultivoTemperaturaDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet ListCultivoTemperatura(CultivoTemperaturaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CultivoTemperatura_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivoTemp", e.vnIdCultivoTemp));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
