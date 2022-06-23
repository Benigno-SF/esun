using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class OrdenEmbarqueDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet DeleteCorrOrdenEmbarque(OrdenEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenEmabrque_DeleteCorr", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet GenerarOrdenEmbarque(OrdenEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenEmabrqueGenera_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet SaveGenerarOrdenEmbarque(OrdenEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_GeneraOrdenEmabrque_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCShipper", e.vcCShipper));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCCliente", e.vcCCliente));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet RepOrdenEmbarque(OrdenEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenEmbarque_Repo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ListOrdenEmbarqueConsolidado(OrdenEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenEmbarqueConsolidado_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdInstruccion", e.vnIdInstruccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCampana", e.vnIdCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdShipper", e.vnIdShipper));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListOrdenEmbarque(OrdenEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_OrdenEmbarque_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdInstruccion", e.vnIdInstruccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCampana", e.vnIdCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdShipper", e.vnIdShipper));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public int RegiOrdenEmbarque(OrdenEmbarqueBE e)
        {
            int vcReturn = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdOrdenEmbarque", e.vnIdOrdenEmbarque);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SP_OrdenEmbarque_Merge", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdInstruccion", e.vnIdInstruccion));
                cmd.Parameters.Add(new SqlParameter("@nIdCampana", e.vnIdCampana));
                cmd.Parameters.Add(new SqlParameter("@nIdCliente", e.vnIdCliente));
                cmd.Parameters.Add(new SqlParameter("@nIdDestino", e.vnIdDestino));
                cmd.Parameters.Add(new SqlParameter("@nIdConsignee", e.vnIdConsignee));
                cmd.Parameters.Add(new SqlParameter("@nIdNotify", e.vnIdNotify));
                cmd.Parameters.Add(new SqlParameter("@nIdNotify2", e.vnIdNotify2));
                cmd.Parameters.Add(new SqlParameter("@cTipoTranporte", e.vcTipoTranporte));
                cmd.Parameters.Add(new SqlParameter("@nIdOpLogistico", e.vnIdOpLogistico));
                cmd.Parameters.Add(new SqlParameter("@nIdShipper", e.vnIdShipper));
                cmd.Parameters.Add(new SqlParameter("@cFechaEmbarque", e.vcFechaEmbarque));
                cmd.Parameters.Add(new SqlParameter("@cFlete", e.vcFlete));
                cmd.Parameters.Add(new SqlParameter("@cEmisionBL", e.vcEmisionBL));
                cmd.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
                cmd.Parameters.Add(new SqlParameter("@ncajas", e.vncajas));
                cmd.Parameters.Add(new SqlParameter("@nPesoNeto", e.vnPesoNeto));
                cmd.Parameters.Add(new SqlParameter("@nPesoBrutoAprox", e.vnPesoBrutoAprox));
                cmd.Parameters.Add(new SqlParameter("@bCertOrigen", e.vbCertOrigen));
                cmd.Parameters.Add(new SqlParameter("@bCertFrio", e.vbCertFrio));
                cmd.Parameters.Add(new SqlParameter("@bCertFitosanitario", e.vbCertFitosanitario));
                cmd.Parameters.Add(new SqlParameter("@bAPPlanta", e.vbAPPlanta));
                cmd.Parameters.Add(new SqlParameter("@bAcogeDrawback", e.vbAcogeDrawback));
                cmd.Parameters.Add(new SqlParameter("@nIdCultivoTemp", e.vnIdCultivoTemp));
                cmd.Parameters.Add(new SqlParameter("@cAtmosferaControlada", e.vcAtmosferaControlada));
                cmd.Parameters.Add(new SqlParameter("@cTemperatura", e.vcTemperatura));
                cmd.Parameters.Add(new SqlParameter("@cHumedad", e.vcHumedad));
                cmd.Parameters.Add(new SqlParameter("@cVentilacion", e.vcVentilacion));
                cmd.Parameters.Add(new SqlParameter("@nIdOrdenEmbarqueConsolidado", e.vnIdOrdenEmbarqueConsolidado));
                cmd.Parameters.Add(new SqlParameter("@nIdPlanta", e.vnIdPlanta));
                cmd.Parameters.Add(new SqlParameter("@nIdLugarSalida", e.vnIdLugarSalida));
                cmd.Parameters.Add(new SqlParameter("@cFechaSalida", e.vcFechaSalida));
                cmd.Parameters.Add(new SqlParameter("@cFIngresoAlmacen", e.vcFIngresoAlmacen));
                cmd.Parameters.Add(new SqlParameter("@cETD", e.vcETD));
                cmd.Parameters.Add(new SqlParameter("@cETA", e.vcETA));
                cmd.Parameters.Add(new SqlParameter("@nIdVapor", e.vnIdVapor));
                cmd.Parameters.Add(new SqlParameter("@cCodeVapor", e.vcCodeVapor));
                cmd.Parameters.Add(new SqlParameter("@cCIANaviera", e.vcCIANaviera));
                cmd.Parameters.Add(new SqlParameter("@nIdLineaNaviera", e.vnIdLineaNaviera));
                cmd.Parameters.Add(new SqlParameter("@cContainer", e.vcContainer));
                cmd.Parameters.Add(new SqlParameter("@cSVC", e.vcSVC));
                cmd.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(InOutParam);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcReturn = Convert.ToInt32(cmd.Parameters["@nIdOrdenEmbarque"].Value);
            }
            catch (Exception d)
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
    }
}
