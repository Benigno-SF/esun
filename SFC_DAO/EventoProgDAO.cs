using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class EventoProgDAO
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;


        public string RegiEventosProg(EventoProgBE e)
        {
            string vvMsje = "";
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_EventoProg_Merge", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdEventoProg", e.vnIdEventoProg));
                cmd.Parameters.Add(new SqlParameter("@nIdTipoEvento", e.vnIdTipoEvento));
                cmd.Parameters.Add(new SqlParameter("@dFechaEvento", e.vdFechaEvento));
                cmd.Parameters.Add(new SqlParameter("@bConcluido", e.vbConcluido));
                cmd.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
                cmd.Parameters.Add(new SqlParameter("@cMenu", e.vcMenu));
                cmd.Parameters.Add(new SqlParameter("@cDieta", e.vcDieta));
                cmd.Parameters.Add(new SqlParameter("@cMensaje", e.vcMensaje));
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


        public DataSet EventoProgList(EventoProgBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_EventoProg_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEventoProg", e.vnIdEventoProg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }


    }
}
