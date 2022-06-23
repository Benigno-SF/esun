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
    public class ConsNisiraDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        //
        //DataPlanilla Asistencia
        public DataSet SN_DataPlanilla_list(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_SubPlanilla_v2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@type", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P1", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P2", e.vcSucursal));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        //Select Dinamico Calidad
        public DataSet Select_Dinamico(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_NSR_BUSCADORINTERNODINAMICOCALIDAD", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDBUSCADOR", e.IDBUSCADOR));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ITEMBUSCADOR", e.ITEMBUSCADOR));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        //ObtenerData Calidad Cítrico
        public DataSet SN_ObtenerData_list(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_NSR_DDETALLECETIFICADOCALIDAD", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDCERTIFICADO", e.vidcertificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDVARIABLE", e.vidvariable));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet ListFilesNisira_list(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListFilesNisira_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListaProductosMovimientos(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListaProductosMovimientos", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdAlmacen", e.vcIdAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSubGrupo", e.vnIdSubGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListInventarios(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListInventarios", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdSucursal", e.vcSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdAlmacen", e.vcIdAlmacen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListFormatosCalidad()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListFormatosCalidad", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListGrupoTrabajo(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_GrupoTrabajo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet HistoricoIngresos(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_RPT_PERSONAL_INGRESOS_CESES_01", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcEmpresa));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public DataSet ListVacacionesPersonal(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Rep_Vacaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListAsistenciaPersonal(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ReporteMarcaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cEmpresa", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ProductosNisUpdate(ConsNisiraBE e, DataTable dtx)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ProductosNis_Update", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cBaseDatos", e.vcBaseDatos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@lst", dtx));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListProductosNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ProductosNis_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cBaseDatos", e.vcBaseDatos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSubGrupo", e.vnIdSubGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListSubGrupoNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_SubGrupos_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cBaseDatos", e.vcBaseDatos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSubGrupo", e.vnIdSubGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListGrupoNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Grupos_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cBaseDatos", e.vcBaseDatos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion)); 
             DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListMotivo(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Motivo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMotivo", e.vnId));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RepoResumenHorasPersonal(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("Sfe_PLAN_RESUMEN_HORAS", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@xDesde", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@xHasta", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idPlanilla", e.vnIdPlanilla));
            da.SelectCommand.Parameters.Add(new SqlParameter("@detalladofechas", e.vPorFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dato", e.vcIdActividad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dato2", e.vcCecos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@detallado", e.vPorConcepto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@resumen", e.vResumen));
            da.SelectCommand.Parameters.Add(new SqlParameter("@subplanilla", e.vcIdTipoPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@para1", e.vPara1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@para2", e.vPara2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@para3", e.vPara3));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public DataSet RepPesoPalet(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_RegistroPaleta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNumero", e.vcNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaInicio", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaFin", e.vcFechaFin));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet LogHistorial(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_LogRequerimientos", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cEmpresa", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cType", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cId", e.vcId));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet DetOrden(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_RequerimientosDet", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cEmpresa", e.vcEmpresa)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cType", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cId", e.vcId));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListTrazaReqs(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("Sfe_Transformacion_Requerimientos_CABECERA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 10200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcPeriodo));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@dato", e.vcDato));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vcTipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fechadesde", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fechahasta", e.vcFechaFin));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@area", e.vcArea));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@estadoreq", e.vcestadoreq));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@estadoped", e.vcestadoped));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@estadoos", e.vcestadoos));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListDetaReq(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("Sfe_Transformacion_Requerimientos_detalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            //da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@id", e.vcId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@empresa", e.vcIdEmpresa));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet ListDetaIngreso(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SF_SEGUIMIENTO_ORDENCOMPRA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@EMPRESA", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDCOMPRA", e.vcId));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet CostosDistribuidos_List(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_CostosDistribuidos_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DESDE", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HASTA", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLCC", e.vcXMLCC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLCCO", e.vcXMLCCO));

            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLPC", e.vcXMLPC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@AGRUP_CC", e.vcAGRUP_CC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@AGRUP_CTA", e.vcAGRUP_CTA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@C_TIPO_CC", e.vcC_TIPO_CC));

            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet GrupoCecoCuenta_Merge(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_GrupoCecoCuenta_Merg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vcId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCeco", e.vcCecos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCuenta", e.vcCuenta));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet GrupoCecoCuenta_List(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_GrupoCecoCuenta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vcType)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet SN_DateNisira_list(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_DateNisira_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@type", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P1", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P2", e.vcSucursal));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListSucursal(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Sucursal_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@type", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P1", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P2", e.vcSucursal));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListParametrosNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ParametrosNis_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@type", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P1", e.vcId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@P2", e.vnIdc));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        

        public DataSet ListCredenciales(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SE_Credenciales_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cType", e.vcType));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet LogEnvioInf(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Log_EnvioInformacion_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ctipo", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cEstado", e.vcEstado));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ACTUALIZA_CLIE_GUIA(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("NSP_ACTUALIZA_CLIE_GUIA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@SERIE", e.vcSerie));
            da.SelectCommand.Parameters.Add(new SqlParameter("@NUMERO", e.vcNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDCLIEPROV", e.vcIdCliente));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public DataSet ListTareoAdicional(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_TareoXJornal_Cabe", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@semana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idfundo", e.vcValor)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@idplanilla", e.vnIdPlanilla));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListTareoJornal(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_TareoXJornal_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@semana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idfundo", e.vcValor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idplanilla", e.vnIdPlanilla));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet SyncTareasAdicionales(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_TareoAdicional_Trans", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdplanilla", e.vnIdPlanilla));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSemana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdFundo", e.vcIdFundo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdConcepto", e.vcIdConcepto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiTareoJornal(ConsNisiraBE e, DataTable dtx)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_TareoAdicional_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@periodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@semana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idfundo", e.vcValor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@planilla", e.vnIdPlanilla));
            da.SelectCommand.Parameters.Add(new SqlParameter("@lst", dtx));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet Aprobar_Tareo_Nisira(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_synctareo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@PERIODO", e.vcPeriodo)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@SEMANA", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ACCION", e.vcAccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDTAREO", e.vcId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDREQUERIMIENTO", e.vcIdConcepto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RepUtilidad(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sn_Reporte_Utilidad", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDPLANILLA", e.vcAmbito));
            da.SelectCommand.Parameters.Add(new SqlParameter("@PERIODO", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@SEMANA", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CODIGO", e.vcCodigo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet RegiCapacitacionesNisira(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ImportarCapacitaciones", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cType", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cLugar", e.vcLugar));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombre", e.vcNombre));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDetalle", e.vcDetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cExpositor", e.vcExpositor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cEstado", e.vcEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDuracion", e.vcDuracion));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public int RegiEstadoRequerimientoNisira(ConsNisiraBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SN_ActualizaEstadoRequerimiento3", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdPedido", e.vnIdc));
                cmd.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
                cmd.Parameters.Add(new SqlParameter("@cTipo", e.vcCodigo));
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
        public DataSet ListRequAprobados(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ListaRequerimientosAprobados", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListCargos(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Cargos_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        //
        public DataSet RepVentasList(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_ReporteVenta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdEmpresa", e.vcIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCampana", e.vcCampana));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListGastosxAgrupador(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_InformeGastosAgrupadoPorCC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodoDesde", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodoHasta", e.vcPeriodoHasta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IdAgrupadorCC", e.vcAgrupadorCC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IdAgrupadorCta", e.vcAgrupadorCTA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bApertura", e.vbEstado));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        //
        public DataSet ListRevisionProcesos(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sp_revision_procesos", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSemana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nDetalle", e.vnDetalle));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListVisualizaTareo(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("hn_visualiza_tareo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSemana", e.vcSemana));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet SyncTareo(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("hn_genera_tareo_01", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSemana", e.vcSemana));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListCostosMOSemana(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_COSTOS_MO_X_SEMANA_v1", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Anio", e.vcAnio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@SEMANA", e.vcSemana));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPakingListFac(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SHN_PCK_FACT", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nFormato", e.vnFormato));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx; 
        }

        public DataSet ListReporteGerencialCostos(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sp_costos_det", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAmbito", e.vcAmbito));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPeriodo(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Periodo_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPlanilla", e.vnIdPlanilla));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSemana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cType", e.vcType));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ListCosteo(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sp_conta_vs_dist_mensual", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAmbito", e.vcAmbito));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListSaldoAlmacen(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sp_saldo_alm", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSucursal", e.vcSucursal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.vdFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nFormato", e.vnDetalle));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListCosteoMensual(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sp_costos_mensual", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPeriodo", e.vcPeriodo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ListFechaAct(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("sp_fechaproc", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.vdFecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ListClienteNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Clientes_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdCliente", e.vcIdCliente));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ListResponsableNis(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Responsable_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIdCliente", e.vcIdCliente));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet DETALLE_DISTRIBUCION_COSTOS(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("DETALLE_DISTRIBUCION_COSTOS", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDEMPRESA", e.vcEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DESDE", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HASTA", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLCC", e.vcXMLCC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLCCO", e.vcXMLCCO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XMLPC", e.vcXMLPC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@AGRUP_CC", e.vcAGRUP_CC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@AGRUP_CTA", e.vcAGRUP_CTA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@C_TIPO_CC", e.vcC_TIPO_CC));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet GrupoCecoCuenta_Merg(ConsNisiraBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_GrupoCecoCuenta _Merg", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vcId));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vcType));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCeco", e.vcXMLCC));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCuenta", e.vcXMLPC));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }



        public string[] ArrayProductoNis(ConsNisiraBE e)
        {
            List<string> lstCliente = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SN_Productos_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cId", e.vcId));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {

                lstCliente.Add(string.Format("{0}-{1}-{2}", reader["IDPRODUCTO"], reader["IDMEDIDA"], reader["DESCRIPCION"]));
            }
            cnx.Close();
            return lstCliente.ToArray();
        }

        public string[] ClienteListArray(ConsNisiraBE e)
        {
            List<string> lstCliente = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SN_Clientes_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cIdCliente", e.vcIdCliente));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                  
                lstCliente.Add(string.Format("{0}|{1}|{2}", reader["IDCLIEPROV"], reader["RUC"], reader["RAZON_SOCIAL"]));
            }
            cnx.Close();
            return lstCliente.ToArray();
        }
    }
}
