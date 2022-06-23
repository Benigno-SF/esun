using SFC_BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_DAO
{
    public class PiscinaRegDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Crear(PiscinaRegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PiscinaReg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPiscina", e.nIdPiscina));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFhregistro", e.dFhregistro));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nCaudalEnt", e.nCaudalEnt));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nCaudalSal", e.nCaudalSal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNivelxCQ", e.nNivelxCQ));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNivelxCM", e.nNivelxCM));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Listado()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PiscinaReg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 2));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListadoEntreFechas(DateTime dFechaInicio, DateTime dFechaFin, int nIdPiscina)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PiscinaReg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 6));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinicio", dFechaInicio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFfin", dFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPiscina", nIdPiscina));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Actualizar(PiscinaRegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PiscinaReg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPiscinaReg", e.nIdPiscinaReg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPiscina", e.nIdPiscina));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFhregistro", e.dFhregistro));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nCaudalEnt", e.nCaudalEnt));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nCaudalSal", e.nCaudalSal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNivelxCQ", e.nNivelxCQ));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNivelxCM", e.nNivelxCM));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Eliminar(PiscinaRegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PiscinaReg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPiscinaReg", e.nIdPiscinaReg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 4));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet OneById(PiscinaRegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PiscinaReg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPiscinaReg", e.nIdPiscinaReg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
