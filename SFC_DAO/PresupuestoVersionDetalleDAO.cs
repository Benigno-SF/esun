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
    public class PresupuestoVersionDetalleDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        
        public int RegiPresupVersCopy(PresupuestoVersionBE e, List<PresupuestoVersionDetalleBE> lst)
        {
            int vnReturn = 0;
            DataTable dt = new DataTable();
            dt.Columns.Add("nIdPara", typeof(int));
            dt.Columns.Add("nImport", typeof(decimal));
            foreach (var item in lst)
            {
                if (item.vnIdTiRow == 2)
                {
                    var row = dt.NewRow();
                    row["nIdPara"] = item.vnIdParametro;
                    row["nImport"] = 0;
                    dt.Rows.Add(row);
                }
            }
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nCount", e.vnVersion);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_PresupuestoUnidNegCopy", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
                cmd.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
                cmd.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
                cmd.Parameters.Add(new SqlParameter("@nVersion", e.vnVersion));
                cmd.Parameters.Add(new SqlParameter("@bTerminado", e.vbTerminado));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@lPresVer", dt));
                cmd.Parameters.Add(InOutParam);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnReturn = Convert.ToInt32(cmd.Parameters["@nCount"].Value.ToString());
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

        public DataSet ListPresupVersionDeta(PresupuestoVersionDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupVersionDeta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nVersion", e.vnVersion));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public int RegiPresupVers(PresupuestoVersionBE e, List<PresupuestoVersionDetalleBE> lst)
        {
            int vnReturn = 0;
            DataTable dt = new DataTable();
            dt.Columns.Add("nIdPara", typeof(int));
            dt.Columns.Add("nImport", typeof(decimal));
            DataTable dt2 = new DataTable();
            dt2.Columns.Add("nIdPara", typeof(int));
            dt2.Columns.Add("cIdPeri", typeof(string));
            dt2.Columns.Add("nCantid", typeof(decimal));
            foreach (var item in lst)
            {
                if (item.vnIdTiRow == 2)
                {
                    var row = dt.NewRow();
                    row["nIdPara"] = item.vnIdParametro;
                    row["nImport"] = item.vnImporte;
                    dt.Rows.Add(row);
                }
                if (item.vnIdTiRow == 3)
                {
                    var row = dt2.NewRow();
                    row["nIdPara"] = item.vnIdParametro;
                    row["cIdPeri"] = item.vcIdPeriodo;
                    row["nCantid"] = item.vnImporte;
                    dt2.Rows.Add(row);
                }
            }
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nVersion", e.vnVersion);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_PresupVersionDeta_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
                cmd.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
                cmd.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
                cmd.Parameters.Add(InOutParam);
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@lPresVer", dt));
                cmd.Parameters.Add(new SqlParameter("@lPresVerDeta", dt2));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnReturn = Convert.ToInt32(cmd.Parameters["@nVersion"].Value.ToString());
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
