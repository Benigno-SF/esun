using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class CalidadReBL
    {
        CalidadReDAO objc = new CalidadReDAO();

        public DataSet ListAlmacenesCalidad(ReportCalid obj)
        {
            return objc.ListAlmacenesCalidad(obj);
        }

        public DataSet Rep_Certificado_Calidad(ReportCalid obj)
        {
            return objc.Rep_Certificado_Calidad(obj);
        }

        public DataSet CalidadRe()
        {
            return objc.AppCalidadRecepcion();
        }

        public DataSet RepInspeccion(String fecha)
        {
            return objc.ObtenerDataXFecha(fecha);
        }
        public DataSet RepInspeccion_Lote(string ruc,string fecha_)
        {
            return objc.ObtenerLoteXProductor(ruc, fecha_);
        }
        public DataSet MostrargUIAXProveedor(string ruc, string fecha_, string lote_)
        {
            return objc.P_A_MostrargUIAXProveedor(ruc, fecha_, lote_);
        }
        public DataSet Variedad_Calidad()
        {
            return objc.P_A_MostrarVariedadCAL();
        }
        public DataSet Variables_Calidad()
        {
            return objc.P_A_MostrarVariablesCAL();
        }
        public DataSet ReporteBL_Calidad(ReportCalid obj)
        {
            return objc.P_A_MostrarReporteDAO(obj);
        }
        public DataSet ReporteBL_Calidad_Palta(ReportCalid obj)
        {
            return objc.P_A_MostrarReporteDAOPalta(obj);
        }
        
        public DataSet VariedadP_Calidad(string fecha, string productor, string lote)
        {
            return objc.P_A_MostrarVariedadDAO(fecha, productor, lote);
        }
        public string CopiararchivoBL(string p,string name)
        {
            return objc.CopiarData(p,name);
        }
        public DataSet InsertarObservacionesCalidadBL(GBusquedaBE obj)
        {
            return objc.InsertarObservacionesCalidadDAO(obj);
        }
        public int InsertaImagenes(string r1, string r2, string r3)
        {
            return objc.P_A_InsertarImagenesDAO(r1,r2,r3);
        }
        public int SetearImageAfterDelete(BorrarFotoBE objeto)
        {
            return objc.SetearFotoAfterDrop_DAO(objeto);
        }
    }
}
