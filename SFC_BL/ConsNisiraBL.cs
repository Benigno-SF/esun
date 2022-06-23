using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class ConsNisiraBL
    {
        ConsNisiraDAO dao = new ConsNisiraDAO();

        public DataSet ListFilesNisira_list(ConsNisiraBE e)
        {
            return dao.ListFilesNisira_list(e);
        }
        public DataSet ListInventarios(ConsNisiraBE e)
        {
            return dao.ListInventarios(e);
        }
        public DataSet ListaProductosMovimientos(ConsNisiraBE e)
        {
            return dao.ListaProductosMovimientos(e);
        }
        public DataSet ListFormatosCalidad()
        {
            return dao.ListFormatosCalidad();
        }
        public DataSet ListGrupoTrabajo(ConsNisiraBE e)
        {
            return dao.ListGrupoTrabajo(e);
        }
        public DataSet HistoricoIngresos(ConsNisiraBE e)
        {
            return dao.HistoricoIngresos(e);
        }
        public DataSet ListVacacionesPersonal(ConsNisiraBE e)
        {
            return dao.ListVacacionesPersonal(e);
        }
        public DataSet ListAsistenciaPersonal(ConsNisiraBE e)
        {
            return dao.ListAsistenciaPersonal(e);
        }
        public DataSet ProductosNisUpdate(ConsNisiraBE e, DataTable dtx)
        {
            return dao.ProductosNisUpdate(e, dtx);
        }
        public DataSet ListProductosNis(ConsNisiraBE e)
        {
            return dao.ListProductosNis(e);
        }
        public DataSet ListSubGrupoNis(ConsNisiraBE e)
        {
            return dao.ListSubGrupoNis(e);
        }
        public DataSet ListGrupoNis(ConsNisiraBE e)
        {
            return dao.ListGrupoNis(e);
        }

        public DataSet ListMotivo(ConsNisiraBE e)
        {
            return dao.ListMotivo(e);
        }
        public DataSet RepPesoPalet(ConsNisiraBE e)
        {
            return dao.RepPesoPalet(e);
        }
        public DataSet RepoResumenHorasPersonal(ConsNisiraBE e)
        {
            return dao.RepoResumenHorasPersonal(e);
        }
        public DataSet ListTrazaReqs(ConsNisiraBE e)
        {
            return dao.ListTrazaReqs(e);
        }
        
        public DataSet LogHistorial(ConsNisiraBE e)
        {
            return dao.LogHistorial(e);
        }
        public DataSet DetOrden(ConsNisiraBE e)
        {
            return dao.DetOrden(e);
        }
        
        public DataSet ListDetaReq(ConsNisiraBE e)
        {
            return dao.ListDetaReq(e);
        }
        public DataSet ListDetaIngreso(ConsNisiraBE e)
        {
            return dao.ListDetaIngreso(e);
        }
        
        public DataSet CostosDistribuidos_List(ConsNisiraBE e)
        {
            return dao.CostosDistribuidos_List(e);
        }
        public DataSet GrupoCecoCuenta_Merge(ConsNisiraBE e)
        {
            return dao.GrupoCecoCuenta_Merge(e);
        }
        public DataSet GrupoCecoCuenta_List(ConsNisiraBE e)
        {
            return dao.GrupoCecoCuenta_List(e);
        }
        public DataSet SN_DateNisira_list(ConsNisiraBE e)
        {
            return dao.SN_DateNisira_list(e);
        }
        public DataSet ListSucursal(ConsNisiraBE e)
        {
            return dao.ListSucursal(e);
        }
        public DataSet ListParametrosNis(ConsNisiraBE e)
        {
            return dao.ListParametrosNis(e);
        }
        public DataSet ListTareoJornal(ConsNisiraBE e)
        {
            return dao.ListTareoJornal(e);
        }
        public DataSet ListTareoAdicional(ConsNisiraBE e)
        {
            return dao.ListTareoAdicional(e);
        }
        
        public DataSet RegiTareoJornal(ConsNisiraBE e, DataTable dtx)
        {
            return dao.RegiTareoJornal(e, dtx);
        }

        public DataSet SyncTareasAdicionales(ConsNisiraBE e)
        {
            return dao.SyncTareasAdicionales(e);
        }

        public DataSet RegiCapacitacionesNisira(ConsNisiraBE e)
        {
            return dao.RegiCapacitacionesNisira(e);
        }
        public int RegiEstadoRequerimientoNisira(ConsNisiraBE e)
        {
            return dao.RegiEstadoRequerimientoNisira(e);
        }
        public DataSet ListRequAprobados(ConsNisiraBE e)
        {
            return dao.ListRequAprobados(e);
        }
        public DataSet ListCargos(ConsNisiraBE e)
        {
            return dao.ListCargos(e);
        }
        public DataSet RepUtilidad(ConsNisiraBE e)
        {
            return dao.RepUtilidad(e);
        }
        public DataSet ListGastosxAgrupador(ConsNisiraBE e)
        {
            return dao.ListGastosxAgrupador(e);
        }
        public DataSet RepVentasList(ConsNisiraBE e)
        {
            return dao.RepVentasList(e);
        }
        public DataSet ListRevisionProcesos(ConsNisiraBE e)
        {
            return dao.ListRevisionProcesos(e);
        }

        public DataSet ListCostosMOSemana(ConsNisiraBE e)
        {
            return dao.ListCostosMOSemana(e);
        }

        public DataSet ListPakingListFac(ConsNisiraBE e)
        {
            return dao.ListPakingListFac(e);
        }

        public DataSet ListReporteGerencialCostos(ConsNisiraBE e)
        {
            return dao.ListReporteGerencialCostos(e);
        }

        public DataSet ListPeriodo(ConsNisiraBE e)
        {
            return dao.ListPeriodo(e);
        }

        public DataSet ListCosteo(ConsNisiraBE e)
        {
            return dao.ListCosteo(e);
        }

        public DataSet ListCosteoMensual(ConsNisiraBE e)
        {
            return dao.ListCosteoMensual(e);
        }

        public DataSet ListSaldoAlmacen(ConsNisiraBE e)
        {
            return dao.ListSaldoAlmacen(e);
        }
        public DataSet ListFechaAct(ConsNisiraBE e)
        {
            return dao.ListFechaAct(e);
        }

        public DataSet ListVisualizaTareo(ConsNisiraBE e)
        {
            return dao.ListVisualizaTareo(e);
        }

        public DataSet SyncTareo(ConsNisiraBE e)
        {
            return dao.SyncTareo(e);
        }

        public DataSet Aprobar_Tareo_Nisira(ConsNisiraBE e)
        {
            return dao.Aprobar_Tareo_Nisira(e);
        }
        public DataSet ListCredenciales(ConsNisiraBE e)
        {
            return dao.ListCredenciales(e);
        }
        public DataSet LogEnvioInf(ConsNisiraBE e)
        {
            return dao.LogEnvioInf(e);
        }

        public DataSet ACTUALIZA_CLIE_GUIA(ConsNisiraBE e)
        {
            return dao.ACTUALIZA_CLIE_GUIA(e);
        }
        
        public DataSet ListClienteNis(ConsNisiraBE e)
        {
            return dao.ListClienteNis(e);
        }
        
        public string[] ClienteListArray(ConsNisiraBE e)
        {
            return dao.ClienteListArray(e);
        }

        public string[] ArrayProductoNis(ConsNisiraBE e)
        {
            return dao.ArrayProductoNis(e);
        }

        public DataSet DETALLE_DISTRIBUCION_COSTOS(ConsNisiraBE e)
        {
            return dao.DETALLE_DISTRIBUCION_COSTOS(e);
        }

        public DataSet GrupoCecoCuenta_Merg(ConsNisiraBE e)
        {
            return dao.GrupoCecoCuenta_Merg(e);
        }

        //ResporteCalidad
        public DataSet SN_DataPlanilla_list(ConsNisiraBE e)
        {
            return dao.SN_DataPlanilla_list(e);
        }

        public DataSet Select_Dinamico(ConsNisiraBE e)
        {
            return dao.Select_Dinamico(e);
        }

        public DataSet SN_ObtenerData_list(ConsNisiraBE e)
        {
            return dao.SN_ObtenerData_list(e);
        }


    }
}
