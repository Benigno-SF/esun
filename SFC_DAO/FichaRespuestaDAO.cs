using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class FichaRespuestaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet FichaRespuestaRegi(FichaRespuestaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FichaRespuesta_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFichaPregunta", e.vnIdFichaPregunta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFichaMes", e.vnIdFichaMes));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cRespuesta", e.vcRespuesta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObs", e.vcObs));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaNac", e.vcFechaNac));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nEdad", e.vnEdad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDireccion", e.vcDireccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCelular", e.vcCelular));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
