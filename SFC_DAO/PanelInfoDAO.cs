using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class PanelInfoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public int UpdPanelInfo(PanelInfoBE e)
        {
            int vnReturn = 0;
            try
            {   
                cnx = con.conectar();
                cmd = new SqlCommand("SP_PanelInfo_Upd", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
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

        public DataSet LisPanelInfo(PanelInfoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PanelInfo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSubLinea", e.vnIdSubLinea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPanelInfo", e.vnIdPanelInfo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public int RegiPanelInfo(PanelInfoBE e)
        {
            int vnReturn = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdPanelInfo", e.vnIdPanelInfo);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SP_PanelInfo_Merge", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdSubLinea", e.vnIdSubLinea));
                cmd.Parameters.Add(InOutParam);
                cmd.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
                cmd.Parameters.Add(new SqlParameter("@nIdCategoria", e.vnIdCategoria));
                cmd.Parameters.Add(new SqlParameter("@nIdCalibre", e.vnIdCalibre));
                cmd.Parameters.Add(new SqlParameter("@bPlu", e.vbPlu));
                cmd.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnReturn = Convert.ToInt32(cmd.Parameters["@nIdPanelInfo"].Value);
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
    }
}
