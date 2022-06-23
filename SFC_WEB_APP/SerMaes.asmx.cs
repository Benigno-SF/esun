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
    /// Descripción breve de SerMaes
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
     [System.Web.Script.Services.ScriptService]
    public class SerMaes : System.Web.Services.WebService
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

        SueldoMaesBE EntSueldo = new SueldoMaesBE();
        UpdateExtraBE EntExtra = new UpdateExtraBE();
        DisTarBE EntDistribuir = new DisTarBE();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object AprobReparaciones(ConsHispBE obj)
        {
            EntHisp.vcPeriodo = obj.vcPeriodo;
            EntHisp.vcAccion = obj.vcAccion;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegHisp.AprobarReparaciones(EntHisp);
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

            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;
            if (dsx.Tables[1].Rows.Count > 0)
            {

                DataTable dv = dsx.Tables[1];
                foreach (DataRow ds in dv.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv.Columns)
                    {
                        row2.Add(col.ColumnName, ds[col]);
                    }
                    rows2.Add(row2);
                }

            }
            else
            {
                row2 = new Dictionary<string, object>();
                row2.Add("", "");
                rows2.Add(row2);
            }

            var data = new
            {
                d1 = rows,
                d2 = rows2
            };

            return serializer.Serialize(data);
        }

        [WebMethod]
        public int DistribuirTarifaWbm(DisTarBE objeto)
        {
            EntDistribuir.vcIdEmpresa = objeto.vcIdEmpresa;
            EntDistribuir.vcPeriodo = objeto.vcPeriodo;
            EntDistribuir.vcFecha = objeto.vcFecha;
            EntDistribuir.vcFechaFin = objeto.vcFechaFin;
            EntDistribuir.vcAccion = objeto.vcAccion;
            EntDistribuir.vcUsuario = GetParamCokkie("cd_user");

            int x = NegHisp.DistribuirTarifaBL(EntDistribuir);
            return x;
        }

        [WebMethod]
        public object InformeReparaciones_List(ConsHispBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            EntHisp.vcAccion = obj.vcAccion;
            DataSet dsx = NegHisp.InformeReparaciones_List(EntHisp);
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

            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;
            if (dsx.Tables[1].Rows.Count > 0)
            {

                DataTable dv = dsx.Tables[1];
                foreach (DataRow ds in dv.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv.Columns)
                    {
                        row2.Add(col.ColumnName, ds[col]);
                    }
                    rows2.Add(row2);
                }

            }
            else
            {
                row2 = new Dictionary<string, object>();
                row2.Add("", "");
                rows2.Add(row2);
            }

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;
            if (dsx.Tables[2].Rows.Count > 0)
            {

                DataTable dv = dsx.Tables[2];
                foreach (DataRow ds in dv.Rows)
                {
                    row3 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv.Columns)
                    {
                        row3.Add(col.ColumnName, ds[col]);
                    }
                    rows3.Add(row3);
                }

            }
            else
            {
                row3 = new Dictionary<string, object>();
                row3.Add("", "");
                rows3.Add(row3);
            }

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;
            if (dsx.Tables[3].Rows.Count > 0)
            {

                DataTable dv = dsx.Tables[3];
                foreach (DataRow ds in dv.Rows)
                {
                    row4 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv.Columns)
                    {
                        row4.Add(col.ColumnName, ds[col]);
                    }
                    rows4.Add(row4);
                }

            }
            else
            {
                row4 = new Dictionary<string, object>();
                row4.Add("", "");
                rows4.Add(row4);
            }

            List<Dictionary<string, object>> rows5 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row5;
            if (dsx.Tables[4].Rows.Count > 0)
            {

                DataTable dv = dsx.Tables[4];
                foreach (DataRow ds in dv.Rows)
                {
                    row5 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv.Columns)
                    {
                        row5.Add(col.ColumnName, ds[col]);
                    }
                    rows5.Add(row5);
                }

            }
            else
            {
                row5 = new Dictionary<string, object>();
                row5.Add("", "");
                rows5.Add(row5);
            }

            List<Dictionary<string, object>> rows6 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row6;
            if (dsx.Tables[5].Rows.Count > 0)
            {

                DataTable dw = dsx.Tables[5];
                foreach (DataRow dtt in dw.Rows)
                {
                    row6 = new Dictionary<string, object>();
                    foreach (DataColumn col in dw.Columns)
                    {
                        row6.Add(col.ColumnName, dtt[col]);
                    }
                    rows6.Add(row6);
                }

            }
            else
            {
                row6 = new Dictionary<string, object>();
                row6.Add("", "");
                rows6.Add(row6);
            }

            var data = new
            {
                d1 = rows,
                d2 = rows2,
                d3 = rows3,
                d4 = rows4,
                d5 = rows5,
                d6 = rows6
            };

            return serializer.Serialize(data);
        }

        [WebMethod]
        public object InformeRep_Detalle(ConsHispBE obj)
        {
            EntHisp.vcPeriodo = obj.vcPeriodo;
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            EntHisp.vcAccion = "2";
            DataSet dsx = NegHisp.InformeReparaciones_List_ADL(EntHisp);
            DataTable dt = dsx.Tables[1];
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

        [WebMethod]
        public object CambiarSueldo(SueldoMaesBE obj)
        {
            EntSueldo.periodo = obj.periodo;
            EntSueldo.personal = obj.personal;
            EntSueldo.cargo = obj.cargo;
            EntSueldo.basico = obj.basico;
            EntSueldo.asig_fam = obj.asig_fam;
            EntSueldo.bono = obj.bono;
            EntSueldo.hor_ext = obj.hor_ext;
            EntSueldo.gratif = obj.gratif;
            EntSueldo.cts = obj.cts;
            EntSueldo.vacaciones = obj.vacaciones;
            EntSueldo.essalud = obj.essalud;
            EntSueldo.total = obj.total;

            int x = NegHisp.CambiarSueldoBL(EntSueldo);

            return x;
        }

        [WebMethod]
        public object UpdateExtra(UpdateExtraBE obj)
        {
            EntExtra.periodo = obj.periodo;
            EntExtra.personal = obj.personal;
            EntExtra.cargo = obj.cargo;
            EntExtra.extra = obj.extra;

            int x = NegHisp.UpdateExtraBL(EntExtra);

            return x;
        }

        [WebMethod]
        public object InformeReparaciones_List_ADL(ConsHispBE obj)
        {
            EntHisp.vcPeriodo = obj.vcPeriodo;
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            EntHisp.vcAccion = obj.vcAccion;
            DataSet dsx = NegHisp.InformeReparaciones_List_ADL(EntHisp);
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

            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;
            DataTable dss = dsx.Tables[1];
            foreach (DataRow ds in dss.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dss.Columns)
                {
                    row2.Add(col.ColumnName, ds[col]);
                }
                rows2.Add(row2);
            }

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;
            DataTable dtt = dsx.Tables[2];
            foreach (DataRow dtx in dtt.Rows)
            {
                row3 = new Dictionary<string, object>();
                foreach (DataColumn col in dtt.Columns)
                {
                    row3.Add(col.ColumnName, dtx[col]);
                }
                rows3.Add(row3);
            }

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;
            DataTable dv1 = dsx.Tables[3];
            foreach (DataRow ds in dv1.Rows)
            {
                row4 = new Dictionary<string, object>();
                foreach (DataColumn col in dv1.Columns)
                {
                    row4.Add(col.ColumnName, ds[col]);
                }
                rows4.Add(row4);
            }

            List<Dictionary<string, object>> rows5 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row5;
            DataTable dv2 = dsx.Tables[4];
            foreach (DataRow ds in dv2.Rows)
            {
                row5 = new Dictionary<string, object>();
                foreach (DataColumn col in dv2.Columns)
                {
                    row5.Add(col.ColumnName, ds[col]);
                }
                rows5.Add(row5);
            }

            List<Dictionary<string, object>> rows6 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row6;
            DataTable dw = dsx.Tables[5];
            foreach (DataRow dt3 in dw.Rows)
            {
                row6 = new Dictionary<string, object>();
                foreach (DataColumn col in dw.Columns)
                {
                    row6.Add(col.ColumnName, dt3[col]);
                }
                rows6.Add(row6);
            }

            List<Dictionary<string, object>> rows7 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row7;
            DataTable dw5 = dsx.Tables[6];
            foreach (DataRow dt5 in dw5.Rows)
            {
                row7 = new Dictionary<string, object>();
                foreach (DataColumn col in dw5.Columns)
                {
                    row7.Add(col.ColumnName, dt5[col]);
                }
                rows7.Add(row7);
            }

            List<Dictionary<string, object>> rows8 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row8;
            DataTable dw8 = dsx.Tables[7];
            foreach (DataRow dt5 in dw8.Rows)
            {
                row8 = new Dictionary<string, object>();
                foreach (DataColumn col in dw8.Columns)
                {
                    row8.Add(col.ColumnName, dt5[col]);
                }
                rows8.Add(row8);
            }

            List<Dictionary<string, object>> rows9 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row9;
            DataTable dw9 = dsx.Tables[8];
            foreach (DataRow dt6 in dw9.Rows)
            {
                row9 = new Dictionary<string, object>();
                foreach (DataColumn col in dw9.Columns)
                {
                    row9.Add(col.ColumnName, dt6[col]);
                }
                rows9.Add(row9);
            }

            var data = new
            {
                d1 = rows,
                d2 = rows2,
                d3 = rows3,
                d4 = rows4,
                d5 = rows5,
                d6 = rows6,
                d7 = rows7,
                d8 = rows8,
                d9 = rows9
            };

            return serializer.Serialize(data);
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

    }
}
