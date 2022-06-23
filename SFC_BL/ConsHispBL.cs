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
    public class ConsHispBL
    {
        ConsHispDAO dao = new ConsHispDAO();
        public DataSet ListRiego(ConsHispBE e)
        {
            return dao.ListRiego(e);
        }

        public DataSet ListAplicacion(ConsHispBE e)
        {
            return dao.ListAplicacion(e);
        }

        public DataSet RegiLogReportView(ConsHispBE e)
        {
            return dao.RegiLogReportView(e);
        }
        public DataSet ReqvsExistencia(ConsHispBE e)
        {
            return dao.ReqvsExistencia(e);
        }
        public DataSet InformeTareasCampo(ConsHispBE e)
        {
            return dao.InformeTareasCampo(e);
        }
        public DataSet RequerimientoConsumo(ConsHispBE e)
        {
            return dao.RequerimientoConsumo(e);
        }
        public int FinalizarPartesCampo(ConsHispBE e)
        {
            return dao.FinalizarPartesCampo(e);
        }
        public DataSet ProcesoSincronizacionNHLog(ConsHispBE e)
        {
            return dao.ProcesoSincronizacionNHLog(e);
        }
        public DataSet InfPartCampActSimple(ConsHispBE e)
        {
            return dao.InfPartCampActSimple(e);
        }
        public DataSet ResumenRecepcion(ConsHispBE e)
        {
            return dao.ResumenRecepcion(e);
        }
        public DataSet ResumenRecepcion_nis(ConsHispBE e)
        {
            return dao.ResumenRecepcion_nis(e);
        }
        public DataSet ListProyectadoCampania(ConsHispBE e)
        {
            return dao.ListProyectadoCampania(e);
        }
        public DataSet ListarCampana(string cultivo)
        {
            return dao.ListCampanaSUN(cultivo);
        }

        public DataSet InformeParteTransformacion(ConsHispBE e)
        {
            return dao.InformeParteTransformacion(e);
        }
        public DataSet InformeParteTransformacionComparativo(ConsHispBE e)
        {
            return dao.InformeParteTransformacionComparativo(e);
        }
        public DataSet GetParteTransformacion(ConsHispBE e)
        {
            return dao.GetParteTransformacion(e);
        }
        public int RegiEstadoRequerimiento(ConsHispBE e) {
            return dao.RegiEstadoRequerimiento(e);
        }
        public int RegiEstadoRequerimientoNisira(ConsHispBE e)
        {
            return dao.RegiEstadoRequerimientoNisira(e);
        }
        public int RegiPesoPalet(ConsHispBE e) {
            return dao.RegiPesoPalet(e);
        }
        public DataSet GetInfoPalet(ConsHispBE e){
            return dao.GetInfoPalet(e);
        }
        public DataSet ListRequConsumo(ConsHispBE e)
        {
            return dao.ListRequConsumo(e);
        }

        public DataSet ListRequConsumoNisira(ConsHispBE e)
        {
            return dao.ListRequConsumoNisira(e);
        }

        public DataSet ListPaletsProducidosAbast(ConsHispBE e)
        {
            return dao.ListPaletsProducidosAbast(e);
        }

        public DataSet ListRecepcionMercancia(ConsHispBE e)
        {
            return dao.ListRecepcionMercancia(e);
        }

        public string[] ListProveedoresArray(ConsHispBE e)
        {
            return dao.ListProveedoresArray(e);
        }
        public string[] ClienteListArray(ConsHispBE e)
        {
            return dao.ClienteListArray(e);
        }
        public DataSet ListLocalizacion(ConsHispBE e)
        {
            return dao.ListLocalizacion(e);
        }
        public DataSet ListContactosClientes(ConsHispBE e)
        {
            return dao.ListContactosClientes(e);
        }
        public DataSet ListShipper(ConsHispBE e)
        {
            return dao.ListShipper(e);
        }
        public DataSet ListPeriodosH(ConsHispBE e)
        {
            return dao.ListPeriodosH(e);
        }

        public DataSet ListServer(ConsHispBE e)
        {
            return dao.ListServer(e);
        }
        public DataSet ListConfeccionado_Cpf(ConsHispBE e)
        {
            return dao.ListConfeccionado_Cpf(e);
        }
        
        public DataSet AprobarReparaciones(ConsHispBE e)
        {
            return dao.AprobarReparaciones(e);
        }
        public DataSet InformeReparaciones_List(ConsHispBE e)
        {
            return dao.InformeReparaciones_List(e);
        }

        public DataSet InformeReparaciones_List_ADL(ConsHispBE e)
        {
            return dao.InformeReparaciones_List_ADL(e);
        }

        public DataSet ListTrazabilidadExportacion(ConsHispBE e)
        {
            return dao.ListTrazabilidadExportacion(e);
        }

        public int CambiarSueldoBL(SueldoMaesBE obj)
        {
            return dao.CambiarSueldoDAO(obj);
        }

        public int UpdateExtraBL(UpdateExtraBE obj)
        {
            return dao.UpdateExtraDAO(obj);
        }

        public int DistribuirTarifaBL(DisTarBE objeto)
        {
            return dao.DistribuirTarifaDAO(objeto);
        }


    }
}
