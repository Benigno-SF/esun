using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Data;
using SFC_BE;
using SFC_BL;
using System.Globalization;
using System.IO;
using System.Net;
using System.Threading;

using System.Text; // for class Encoding
using System.Collections;
using System.Diagnostics;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerCPF
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class SerCPF : System.Web.Services.WebService
    {
        AreaProcesoBE EntProceso = new AreaProcesoBE();
        AreaProcesoBL NegProceso = new AreaProcesoBL();

        UbicacionBE EntUbic = new UbicacionBE();
        UbicacionBL NegUbic = new UbicacionBL();

        PalletMovBE EntPaleMov = new PalletMovBE();
        PalletMovBL NegPale = new PalletMovBL();

        ConsExternaBE EntCons = new ConsExternaBE();
        ConsExternaBL NegCons = new ConsExternaBL();

        OrdenCargaBE EntOrdc = new OrdenCargaBE();
        OrdenCargaBL NegOrdc = new OrdenCargaBL();

        MonitorSubLineaBE EntMoniSl = new MonitorSubLineaBE();
        MonitorSubLineaBL NegMoniSl = new MonitorSubLineaBL();

        CultivoCaracteristicaBE EntCarac = new CultivoCaracteristicaBE();
        CultivoCaracteristicaBL NegCarac = new CultivoCaracteristicaBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        SubLineaBE EntSubL = new SubLineaBE();
        SubLineaBL NegSubL = new SubLineaBL();

        PanelInfoBE EntPaneInfo = new PanelInfoBE();
        PanelInfoBL NegPaneInfo = new PanelInfoBL();

        PersonalBE EntPersonal = new PersonalBE();
        PersonalBL NegPersonal = new PersonalBL();

        RendimientoProcesoBE EntRendProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRendProc = new RendimientoProcesoBL();

        RendimientoProcesoRegistroBE EntRendProcRegi = new RendimientoProcesoRegistroBE();
        RendimientoProcesoRegistroBL NegRendProcRegi = new RendimientoProcesoRegistroBL();

        RendimientoProcesoDetalleBE EntRendProcDeta = new RendimientoProcesoDetalleBE();
        RendimientoProcesoDetalleBL NegRendProcDeta = new RendimientoProcesoDetalleBL();

        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object ListConfeccionado_Cpf(ConsHispBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            EntHisp.vcFechaProc = obj.vcFechaProc;
            DataSet dsx = NegHisp.ListConfeccionado_Cpf(EntHisp);
            DataTable dt = dsx.Tables[0];
            //
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }
    }
}
