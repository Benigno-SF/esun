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
    public class RendimientoProcesoRegistroBL
    {
        RendimientoProcesoRegistroDAO dao = new RendimientoProcesoRegistroDAO();


        public DataSet Comparaciontickets(RendimientoProcesoRegistroBE e) 
        {
            return dao.Comparaciontickets(e);
        }

        public int DelRendimientoProcesoRegistro(RendimientoProcesoRegistroBE e){
            return dao.DelRendimientoProcesoRegistro(e);
        }
        public DataSet ReporteRendimiento(RendimientoProcesoRegistroBE e)
        {
            return dao.ReporteRendimiento(e);
        }

        public DataSet RegiRendProcRegistro(RendimientoProcesoRegistroBE e)
        {
            return dao.RegiRendProcRegistro(e);
        }

        public DataSet RegiRendProcRegistro_Mod(RendimientoProcesoRegistroBE e)
        {
            return dao.RegiRendProcRegistro_Mod(e);
        }

        public DataSet RegiAnularEtiqueta(RendimientoProcesoRegistroBE e)
        {
            return dao.RegiAnularEtiqueta(e);
        }
        

        public DataSet RegiRendProcLectura(RendimientoProcesoRegistroBE e)
        {
            return dao.RegiRendProcLectura(e);
        }
        public DataSet ListTicketPrint(RendimientoProcesoRegistroBE e)
        {
            return dao.ListTicketPrint(e);
        }
        public DataSet ListMonitorRendimiento(RendimientoProcesoRegistroBE e)
        {
            return dao.ListMonitorRendimiento(e);
        }
        public DataSet ListMonitorRendimiento_Mod(RendimientoProcesoRegistroBE e)
        {
            return dao.ListMonitorRendimiento_Mod(e);
        }
        public DataSet ListRendimientoProcesoDetalle(RendimientoProcesoRegistroBE e)
        {
            return dao.ListRendimientoProcesoDetalle(e); 
        }
        
        public DataSet RendimientoProcesoRegistroList(RendimientoProcesoRegistroBE e)
        {
            return dao.RendimientoProcesoRegistroList(e);
        }
        public DataSet RendimientoProcesoRegistroAvanceUser(RendimientoProcesoRegistroBE e)
        {
            return dao.RendimientoProcesoRegistroAvanceUser(e);
        }
        public DataSet RendimientoProcesoRegistroListUser(RendimientoProcesoRegistroBE e)
        {
            return dao.RendimientoProcesoRegistroListUser(e);
        }
        
        public DataSet ConsultaRendimientoPersonal(RendimientoProcesoRegistroBE e)
        {
            return dao.ConsultaRendimientoPersonal(e);
        }
        public DataSet RendimientoProcesoRegistroListRT(RendimientoProcesoRegistroBE e)
        {
            return dao.RendimientoProcesoRegistroListRT(e);
        }
        public DataSet AvanceProcesoDetalle(RendimientoProcesoRegistroBE e)
        {
            return dao.AvanceProcesoDetalle(e);
        }
        public DataSet RendimientoCastigo_Regi(RendimientoProcesoRegistroBE e)
        {
            return dao.RendimientoCastigo_Regi(e);
        }
        public DataSet ListGrupoRendimiento(RendimientoProcesoRegistroBE e)
        {
            return dao.ListGrupoRendimiento(e);
        }
    }
}
