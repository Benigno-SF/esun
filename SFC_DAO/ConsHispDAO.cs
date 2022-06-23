using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using SqlUtility;

namespace SFC_DAO
{
    public class ConsHispDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlAccess sqlA = new SqlAccess();
        SqlConnection cnx;
        
        public DataSet ListTrazabilidadExportacion(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_RepTrazabilidadExportacion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@FecIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FecFin", e.vcFechaFin));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet AprobarReparaciones(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_AprobarReparaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@INITABLA", e.vcAccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@usuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet InformeReparaciones_List(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_InformeReparaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Accion", e.vcAccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@usuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet InformeReparaciones_List_ADL(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_InformeReparaciones_2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Fechadesde", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Fechahasta", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Accion", e.vcAccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@usuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public int CambiarSueldoDAO(SueldoMaesBE obj)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_CambiarSueldoMaestranza", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@periodo", obj.periodo));
            cmd.Parameters.Add(new SqlParameter("@personal", obj.personal.Trim()));
            cmd.Parameters.Add(new SqlParameter("@cargo", obj.cargo.Trim()));
            cmd.Parameters.Add(new SqlParameter("@basico", obj.basico));
            cmd.Parameters.Add(new SqlParameter("@asig_fam", obj.asig_fam));
            cmd.Parameters.Add(new SqlParameter("@bono", obj.bono));
            cmd.Parameters.Add(new SqlParameter("@hor_ext", obj.hor_ext));
            cmd.Parameters.Add(new SqlParameter("@gratif", obj.gratif));
            cmd.Parameters.Add(new SqlParameter("@cts", obj.cts));
            cmd.Parameters.Add(new SqlParameter("@vacaciones", obj.vacaciones));
            cmd.Parameters.Add(new SqlParameter("@essalud", obj.essalud));
            cmd.Parameters.Add(new SqlParameter("@total", obj.total));
            int y = cmd.ExecuteNonQuery();
            cnx.Close();
            return y;
        }

        public int UpdateExtraDAO(UpdateExtraBE obj)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_UpdateExtra_SFTI", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@periodo", obj.periodo));
            cmd.Parameters.Add(new SqlParameter("@personal", obj.personal.Trim()));
            cmd.Parameters.Add(new SqlParameter("@cargo", obj.cargo.Trim()));
            cmd.Parameters.Add(new SqlParameter("@hor_ext", obj.extra));
            int y = cmd.ExecuteNonQuery();
            cnx.Close();
            return y;
        }

        public int DistribuirTarifaDAO(DisTarBE objeto)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("SH_InformeReparaciones_2", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Periodo", objeto.vcPeriodo));
            cmd.Parameters.Add(new SqlParameter("@Fechadesde", objeto.vcFecha));
            cmd.Parameters.Add(new SqlParameter("@Fechahasta", objeto.vcFechaFin));
            cmd.Parameters.Add(new SqlParameter("@Accion", objeto.vcAccion));
            cmd.Parameters.Add(new SqlParameter("@usuario", objeto.vcUsuario));
            int y = cmd.ExecuteNonQuery();
            cnx.Close();
            return y;
        }

        public DataSet ListConfeccionado_Cpf(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("Sfe_Confeccionado_Cpf", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@fec_desde", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fec_hasta", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fec_proceso", e.vcFechaProc));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListAplicacion(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_listaAplicaciones_Hispatec", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cOpcion", e.vcAccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipoDato", e.vcTipoDato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListRiego(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_listaRiego_Hispatec", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipoDato", e.vcTipoDato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@riegopor", e.vcRiegoPor));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet RegiLogReportView(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SE_LogViewReport_regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFormato", e.vcTipoDato));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ReqvsExistencia(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_RequerimientovsExistencias_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNumero", e.vcNumero));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet InformeTareasCampo(ConsHispBE e) {
            SqlParameter ParFech = new SqlParameter("@Fecha", e.vcFecha);
            SqlParameter ParUser = new SqlParameter("@Usuario", e.vcUsuario);
            return sqlA.EjecutarDataset(true, "SH_InformeTareasCampo", ParFech, ParUser);
        }

        public DataSet RequerimientoConsumo(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_RequerimientoConsumo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nNumero", e.vcNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodArticulo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescArticulo", e.vcNombre));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ncantidad", e.vcValor));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListServer(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ProcesosDB_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdServidor", e.vnId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@spid", e.vspid));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cBaseDatos", e.vcBaseDatos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cEstatus", e.vcEstatus));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public int FinalizarPartesCampo(ConsHispBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SH_FinalizarPartesPorId", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Valor", e.vcValor));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                vnReturn = -1;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }
        public DataSet ProcesoSincronizacionNHLog(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SHN_ProcesoSincronizacionNHDetalle_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet InfPartCampActSimple(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_InformePartesCampoActuacionesSimple", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Fecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Usuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ListProyectadoCampania(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ProyectadoPorCampania_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet InformeParteTransformacion(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_InformeParteTransformacion_AGC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DesdeFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HastaFecha", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@TipoOperacion", e.vnTipoOperacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@TipoDato", e.vcTipoDato)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCampania", e.vcCampania));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListCampanaSUN(string cultivo)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarCampanaInfParteTransformacion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Cultivo", cultivo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet InformeParteTransformacionComparativo(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_InformeParteTransformacion_Comparativo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@TipoOperacion", e.vnTipoOperacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@TipoDato", e.vcTipoDato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCampania", e.vcCampania));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCampania2", e.vcCampania2));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ResumenRecepcion(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ResumenRecepcionMercancia", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DesdeFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HastaFecha", e.vcFechaFin));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ResumenRecepcion_nis(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ResumenRecepcionMercancia2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DesdeFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HastaFecha", e.vcFechaFin));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet GetParteTransformacion(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ParteTransformacionClasificacion", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DesdeFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HastaFecha", e.vcFechaFin));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public int RegiEstadoRequerimiento(ConsHispBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SH_ActualizaEstadoRequerimiento", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdPedido", e.vnId));
                cmd.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                vnReturn = -1;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }
        public int RegiEstadoRequerimientoNisira(ConsHispBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SN_ActualizaEstadoRequerimiento3_1", cnx);
                //cmd = new SqlCommand("SN_ActualizaEstadoRequerimiento3", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdPedido", e.vnIdc));
                cmd.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
                cmd.Parameters.Add(new SqlParameter("@cTipo", e.vcCodigo)); 
                cmd.Parameters.Add(new SqlParameter("@cEstado", e.vcEstado));
                cmd.Parameters.Add(new SqlParameter("@cAprobacion", e.vcAprobacion));
                cmd.Parameters.Add(new SqlParameter("@cEmpresa", e.vcEmpresa));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                vnReturn = -1;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }
        public int RegiPesoPalet(ConsHispBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SH_ActualizarPesoBrutoNumeroSerie", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Id", e.vnIdc));
                cmd.Parameters.Add(new SqlParameter("@Valor", e.vcValor));
                cmd.Parameters.Add(new SqlParameter("@nCodigo", e.nCodigo));
                cmd.Parameters.Add(new SqlParameter("@nCantidad", e.nCantidad)); 
                cmd.Parameters.Add(new SqlParameter("@nIdIngreso", e.nIdIngreso));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                vnReturn = -1;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }

        public DataSet GetInfoPalet(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ObtenerInformacionNumeroSerie", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListRequConsumo(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ListaRequerimientosPorUsuario", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListRequConsumoNisira(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListaRequerimientosPorUsuario3_1", cnx);
            //da = new SqlDataAdapter("SN_ListaRequerimientosPorUsuario3", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPaletsProducidosAbast(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PaletsProducidosAbast_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cfecha", e.vcFecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListRecepcionMercancia(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RecepcionMercancia_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cfecha", e.vcFecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public string[] ListProveedoresArray(ConsHispBE e)
        {
            List<string> lstVehiculo = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SH_proveedores_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nId", e.vnId));

            cmd.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstVehiculo.Add(string.Format("{0}-{1}-{2}", reader["Id"], reader["Nombre"], reader["Direccion"]));
            }
            cnx.Close();
            return lstVehiculo.ToArray();
        }

        public string[] ClienteListArray(ConsHispBE e)
        {
            List<string> lstVehiculo = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SH_Cliente_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nId", e.vnId));
            cmd.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstVehiculo.Add(string.Format("{0}-{1}-{2}", reader["Id"], reader["Nombre"], reader["Direccion"]));
            }
            cnx.Close();
            return lstVehiculo.ToArray();
        }

        public DataSet ListShipper(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_Shipper_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nId", e.vnId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListPeriodosH(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_PeriodoH_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListLocalizacion(ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_Localizacion_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Id", e.vnId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Nombre", e.vcNombre));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListContactosClientes (ConsHispBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SH_ContactosClientes_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nId", e.vnId));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }



    }
}
