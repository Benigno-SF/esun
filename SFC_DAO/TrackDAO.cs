using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
namespace SFC_DAO
{
    public class TrackDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListTrack(TrackBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Track_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDispositivo", e.vnIdDispositivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTiempo", e.vnTiempo));
            DataSet ds = new DataSet();
            da.Fill(ds, "TICK");
            cnx.Close();
            return ds;
        }

        public DataSet ListTrackView(TrackBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_TrackView_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFundo", e.vcIdSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDispositivo", e.vnIdDispositivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFechaIni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            DataSet ds = new DataSet();
            da.Fill(ds, "TICK");
            cnx.Close();
            return ds;
        }

        public int RegiTrack(TrackBE e)
        {
            int vvMsje = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdTrack", e.vnIdTrack);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_Track_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@cIP", e.vcIP));
                cmd.Parameters.Add(InOutParam);
                cmd.Parameters.Add(new SqlParameter("@nLatitud", e.vnLatitud));
                cmd.Parameters.Add(new SqlParameter("@nLongitud", e.vnLongitud));
                cmd.Parameters.Add(new SqlParameter("@nTiempo", e.vnTiempo));
                
                cnx.Open();
                cmd.ExecuteNonQuery();
                vvMsje = Convert.ToInt32(cmd.Parameters["@nIdTrack"].Value.ToString());
            }
            catch (Exception d)
            {
                vvMsje = -1;
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
