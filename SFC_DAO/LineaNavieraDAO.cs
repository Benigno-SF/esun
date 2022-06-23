using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class LineaNavieraDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListLineaNaviera(LineaNavieraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LineaNaviera_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLineaNaviera", e.vnIdLineaNaviera));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Actualizar(LineaNavieraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LineaNaviera", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLineaNaviera", e.vnIdLineaNaviera));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescLineaNaviera", e.cDescLineaNaviera));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet OneById(LineaNavieraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LineaNaviera", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLineaNaviera", e.vnIdLineaNaviera));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }


        public DataSet Insertar(LineaNavieraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LineaNaviera", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescLineaNaviera", e.cDescLineaNaviera));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Eliminar(LineaNavieraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LineaNaviera", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLineaNaviera", e.vnIdLineaNaviera));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Merge(LineaNavieraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LineaNaviera", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.nIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLineaNaviera", e.vnIdLineaNaviera));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescLineaNaviera", e.cDescLineaNaviera));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", e.nTipo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
