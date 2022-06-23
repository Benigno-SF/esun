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
    public class PresupuestoIndirectoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        
        public DataSet ListPresupIndiDeta(PresupuestoIndirectoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupIndiDeta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public int RegiPresuIndi(PresupuestoIndirectoBE e, List<PresupuestoIndirectoDetalleBE> lst)
        {
            int vnReturn = 0;
            DataTable dt = new DataTable();
            dt.Columns.Add("nIdFundo", typeof(int));
            dt.Columns.Add("nIdCultivo", typeof(int));
            dt.Columns.Add("nIdParametro", typeof(int));
            dt.Columns.Add("cIdPeriodo", typeof(string));
            dt.Columns.Add("cDriver", typeof(string));
            dt.Columns.Add("nImporte", typeof(decimal));
            dt.Columns.Add("nIdParamTitulo", typeof(int));
            foreach (var item in lst)
            {
                if (item.vnIdTiRow == 2)
                {
                    var row = dt.NewRow();
                    row["nIdFundo"] = item.vnIdFundo;
                    row["nIdCultivo"] = item.vnIdCultivo;
                    row["nIdParametro"] = item.vnIdParametro;
                    row["cIdPeriodo"] = item.vcIdPeriodo;
                    row["cDriver"] = item.vcDriver;
                    row["nImporte"] = item.vnImporte;
                    row["nIdParamTitulo"] = item.vnIdParamTitulo;
                    dt.Rows.Add(row);
                }
            }
            try
            {   
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_PresupuestoIndiDeta_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
                cmd.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
                cmd.Parameters.Add(new SqlParameter("@bTerminado", e.vbTerminado));
                cmd.Parameters.Add(new SqlParameter("@lPres", dt));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnReturn = 1;
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
       
        public DataSet ListPresupIndi(PresupuestoIndirectoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupIndirecto_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
