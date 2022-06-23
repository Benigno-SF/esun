using SFC_BE;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SFC_DAO
{
    public class RecepciontiempoconfiguracionDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Select(RecepciontiempoconfiguracionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempoconfiguracion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 2));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Update(RecepciontiempoconfiguracionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempoconfiguracion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempoconfiguracion", e.nIdRecepciontiempoconfiguracion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nMaximo", e.nMaximo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nMinimo", e.nMinimo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cColor", e.cColor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.cDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Actualizarminmax(RecepciontiempoconfiguracionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempoconfiguracion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempoconfiguracion", e.nIdRecepciontiempoconfiguracion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nMaximo", e.nMaximo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nMinimo", e.nMinimo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 6));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet OneById(RecepciontiempoconfiguracionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempoconfiguracion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempoconfiguracion", e.nIdRecepciontiempoconfiguracion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
