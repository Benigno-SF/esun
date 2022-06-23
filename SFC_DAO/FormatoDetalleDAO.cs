using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class FormatoDetalleDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListFormDeta(FormatoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FormatoDetalle_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNivel", e.vnNivel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParamTitulo", e.vnIdParamTitulo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
