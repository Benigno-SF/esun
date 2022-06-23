using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class PresupuestoUnidadNegDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet RepoPresupCult(PresupuestoUnidadNegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupCult_Repo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            DataSet ds = new DataSet();
            da.TableMappings.Add("EMPR1", "CABE");
            da.TableMappings.Add("EMPR2", "DETA");
            da.Fill(ds, "EMPR");
            cnx.Close();
            return ds;
        }
        public DataSet RepoPresupAll(PresupuestoUnidadNegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Presupuesto_Repo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet RepoPresUnidNeg(PresupuestoUnidadNegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupUnidNeg_Repo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public int RegiPresUnidNeg(PresupuestoUnidadNegBE e)
        {
            int vcReturn = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_PresUnidNegDef_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
                cmd.Parameters.Add(InOutParam);
                cmd.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
                cmd.Parameters.Add(new SqlParameter("@nFRegistro", e.vnFRegistro));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcReturn = Convert.ToInt32(cmd.Parameters["@nIdUnidadNeg"].Value);
            }
            catch (Exception )
            {
                vcReturn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcReturn;
        }
        public DataSet ListPresUnidNeg(PresupuestoUnidadNegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupUnidadNegUser_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFundo", e.vnIdFundo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFormato", e.vnIdFormato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet lista_confi_documentoDAO(Verif_DocumentoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_VALIDAR_CONFIG_PRODUCTOS_001", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@PERIODO", e.VERI_DOC_PERIODO));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
