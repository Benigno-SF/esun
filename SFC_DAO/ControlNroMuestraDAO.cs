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
    public class ControlNroMuestraDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet ListParamDeta(ControlBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Control_Repo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdControl", e.vnIdControl));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }




        public DataSet ListMuestFoto(ControlNroMuestraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ControlMuestFoto_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdControl", e.vnIdControl));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMuestra", e.vnIdMuestra));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public int RegiMuestra(ControlNroMuestraBE e, List<ControlNroMuestraDetalleObsBE> lst)
        {
            int vnReturn = 0;
            DataTable dt = new DataTable();
            dt.Columns.Add("nIdPar", typeof(int));
            dt.Columns.Add("cValor", typeof(string));
            dt.Columns.Add("cObser", typeof(string));
            foreach (var item in lst)
            {
                if (item.vnIdTiRow == 2)
                {
                    var row = dt.NewRow();
                    row["nIdPar"] = item.vnIdParametro;
                    row["cValor"] = item.vcValor;
                    row["cObser"] = item.vcObseDetalle;
                    dt.Rows.Add(row);
                }
            }
            DataTable dt2 = new DataTable();
            dt2.Columns.Add("nIdFotoDet", typeof(int));
            dt2.Columns.Add("cRutaFoto", typeof(string));
            dt2.Columns.Add("cObseFoto", typeof(string));
            foreach (var item in lst)
            {
                if (item.vnIdTiRow == 3)
                {
                    var row = dt2.NewRow();
                    row["nIdFotoDet"] = item.vnIdFotoDeta;
                    row["cRutaFoto"] = item.vcRutaFoto;
                    row["cObseFoto"] = item.vcObseFoto;
                    dt2.Rows.Add(row);
                }
            }
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdMuestra", e.vnIdMuestra);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_ControlMuestraAll_Reg", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
                cmd.Parameters.Add(new SqlParameter("@nIdControl", e.vnIdControl));
                cmd.Parameters.Add(InOutParam);
                cmd.Parameters.Add(new SqlParameter("@nIdFoto", e.vnIdFoto));
                cmd.Parameters.Add(new SqlParameter("@cRutaFoto", e.vcRutaFoto));
                cmd.Parameters.Add(new SqlParameter("@cModulo", e.vcModulo));
                cmd.Parameters.Add(new SqlParameter("@cObseMuestra", e.vcObseMuestra));
                cmd.Parameters.Add(new SqlParameter("@dFechaMuestra", e.vdFechaMuestra));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@lParam", dt));
                cmd.Parameters.Add(new SqlParameter("@lFotos", dt2));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnReturn = Convert.ToInt32(cmd.Parameters["@nIdMuestra"].Value.ToString());
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
        public DataSet ListMuestra(ControlNroMuestraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Formato_Para_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdControl", e.vnIdControl));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMuestra", e.vnIdMuestra));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
