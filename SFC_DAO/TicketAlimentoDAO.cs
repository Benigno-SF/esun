using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class TicketAlimentoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet RegiTicket(TicketAlimentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_TicketAlimentos_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNrodocumento", e.vcIdCodigoGeneral));
            DataSet ds = new DataSet();
            da.Fill(ds, "TICK");
            cnx.Close();
            return ds;
        }

        public DataSet TicketAlimentosList(TicketAlimentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_TicketAlimentos_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoEvento", e.vnIdTipoEvento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public int RegiProvTicket(TicketAlimentoBE e, DataTable dt)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_ProvTicket_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdTipoEvento", e.vnIdTipoEvento));
                cmd.Parameters.Add(new SqlParameter("@dFechaAut", e.vdFechaAut));
                cmd.Parameters.Add(new SqlParameter("@lst", dt));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                string mbox = ed.ToString();
                vnReturn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }


        public DataSet CountProv(TicketAlimentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CountProv", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
