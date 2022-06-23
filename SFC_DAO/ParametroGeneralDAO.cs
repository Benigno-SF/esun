using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class ParametroGeneralDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListParametroGeneral(ParametroGeneralBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParametroGeneral_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoMaster", e.vcCodigoMaster));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet OneById(ParametroGeneralBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParametroGeneral", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet Insertar(ParametroGeneralBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParametroGeneral", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoMaster", e.vcCodigoMaster));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcCodigoMaster));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodHisp", e.vcCodigoMaster));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.vcCodigoMaster));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet Actualizar(ParametroGeneralBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParametroGeneral", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
