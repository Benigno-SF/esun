using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;


namespace SFC_DAO
{
    public class RendimientoProcesoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet InicFinProceso(RendimientoProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoObs_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFechaProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObservacion", e.vcObservacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public int BloqueoLinea(RendimientoProcesoBE e)
        {
            int vcReturn = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdProceso", e.vnIdProceso);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SP_BloqueoLinea", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdArea));
                cmd.Parameters.Add(new SqlParameter("@bEstadoUso", e.vbEstado));
                cmd.Parameters.Add(InOutParam);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcReturn = Convert.ToInt32(cmd.Parameters["@nIdProceso"].Value);
            }
            catch (Exception d)
            {
                vcReturn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcReturn;
        }

        public DataSet ListRendimientoProceso(RendimientoProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProceso_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiRendimientoProceso(RendimientoProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProceso_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
