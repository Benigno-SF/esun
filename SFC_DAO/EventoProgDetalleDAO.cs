using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class EventoProgDetalleDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet EventoProgDetalleList(EventoProgDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EventoProgDeta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public string RegiEventoDetalleProg(EventoProgDetalleBE e)
        {
            string vvMsje = "REGISTRO EXITOSO";
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_EventoProgDetalle_Merge", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdEventoProg", e.vnIdEventoProg));
                cmd.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
                cmd.Parameters.Add(new SqlParameter("@nIdTipoEvento", e.vnIdTipoEvento));
                cmd.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
                cmd.Parameters.Add(new SqlParameter("@dFechaInicio", e.vdFechaInicio));
                cmd.Parameters.Add(new SqlParameter("@dFechaFin", e.vdFechaFin));
                cmd.Parameters.Add(new SqlParameter("@nIdEstado", e.vnIdEstado));
                cmd.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuarioCrea));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception d)
            {
                vvMsje = d.ToString();
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vvMsje;
        }
    }
}
