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
    public class PresupuestoVersionDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public string RegiPresupVers(PresupuestoVersionBE e)
        {
            string vvMsje = "";
            try
            {   
                cnx = con.conectar();
                cmd = new SqlCommand("SP_PresupVers_Upd", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
                cmd.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
                cmd.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
                cmd.Parameters.Add(new SqlParameter("@nVersion", e.vnVersion));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vvMsje = "ok";
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
        public DataSet ListPresupVersion(PresupuestoVersionBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupVersion_List", cnx);
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
    }
}
