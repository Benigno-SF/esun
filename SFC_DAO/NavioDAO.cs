using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class NavioDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListNavio(NavioBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Navio_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNavio", e.vnIdNavio));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet OneById(NavioBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Navio", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNavio", e.vnIdNavio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Actualizar(NavioBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Navio", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNavio", e.vnIdNavio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDesNavio", e.vcDescNavio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Insertar(NavioBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Navio", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDesNavio", e.vcDescNavio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
