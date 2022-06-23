using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class RecepcionDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        //public DataSet ListRecepcion(RecepcionBE e)
        //{
        //    cnx = con.conectar();
        //    da = new SqlDataAdapter("SP_Recepcion_List", cnx);
        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cRemitente", e.vcRemitente));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cUserDest", e.vcUserDest));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cRutaFoto", e.vcRutaFoto));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cObser", e.vcObser));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
        //DataSet ds = new DataSet();
        //    da.Fill(ds, "get");
        //    cnx.Close();
        //    return ds;
        //}

        public string RegiRecepcion(RecepcionBE e)
        {
            string vvMsje = "REGISTRO EXITOSO";
            try
            {
            SqlParameter InOutParam = new SqlParameter("@nIdRecepcion", e.vnIdRecepcion);
            cnx = con.conectar();
            cmd = new SqlCommand("SPP_ControlMuestraAll_Reg", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            cmd.Parameters.Add(new SqlParameter("@cRemitente", e.vcRemitente));
            cmd.Parameters.Add(new SqlParameter("@cUserDest", e.vcUserDest));
            cmd.Parameters.Add(new SqlParameter("@cRutaFoto", e.vcRutaFoto));
            cmd.Parameters.Add(new SqlParameter("@cObser", e.vcObser));
            cmd.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
            cmd.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
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
