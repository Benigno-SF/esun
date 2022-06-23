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
    public class RecepciontiempoDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Insert(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cRuc", e.cRuc.Substring(0, 11)));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.dFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFregistro", DateTime.Now));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.bEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet InsertReturn(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.dFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cRuc", e.cRuc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 7));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Select(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 2));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Update(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cRuc", e.cRuc));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.dFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFregistro", e.dFregistro));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.bEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Delete(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 4));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet OneById(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 6));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet SeleccionarPorFecha(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.dFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 8));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Reporte1(RecepciontiempoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.dFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 9));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
