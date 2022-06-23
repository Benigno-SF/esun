using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class OrdenCargaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet LitOrdenCarga(OrdenCargaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenCarga_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenCarga", e.vnIdOrdCarga));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public string RegiOrdenCarga(OrdenCargaBE e, DataTable dt)
        {
            string vcReturn = "";
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdOrdCarga", e.vnIdOrdCarga);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_OrdnCarga_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(InOutParam);
                cmd.Parameters.Add(new SqlParameter("@nNoCarga", e.vnNoCarga));
                cmd.Parameters.Add(new SqlParameter("@cDescCarga", e.vcDescCarga));
                cmd.Parameters.Add(new SqlParameter("@cDestino", e.vcDestino));
                cmd.Parameters.Add(new SqlParameter("@dHoraCarga", e.vdHoraCarga));
                cmd.Parameters.Add(new SqlParameter("@cBooking", e.vcBooking));
                cmd.Parameters.Add(new SqlParameter("@cIdProvLote", e.vcIdProvLote));
                cmd.Parameters.Add(new SqlParameter("@cIdCultivo", e.vcIdCultivo));
                cmd.Parameters.Add(new SqlParameter("@lt", dt));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcReturn = cmd.Parameters["@nIdOrdCarga"].Value.ToString();
            }
            catch (Exception ed)
            {
                vcReturn = ed.ToString();
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcReturn;
        }
        public DataSet ListOrdenCarga(OrdenCargaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenCarga_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenCarga", e.vnIdOrdCarga));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
