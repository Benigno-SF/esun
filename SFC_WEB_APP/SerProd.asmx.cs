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
    /// Descripción breve de SerProd
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerProd : System.Web.Services.WebService
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

        CultivoPackingBE EntCultivoPacking = new CultivoPackingBE();
        CultivoPackingBL NegCultivoPacking = new CultivoPackingBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        SubLineaBE EntSubL = new SubLineaBE();
        SubLineaBL NegSubL = new SubLineaBL();

        EmbalajeBE EntEmbalaje = new EmbalajeBE();
        EmbalajeBL NegEmbalaje = new EmbalajeBL();

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

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        ParadasProcesoBE EntParada = new ParadasProcesoBE();
        ParadasProcesoBL NegParada = new ParadasProcesoBL();

        UtilBL negUtil = new UtilBL();
        
        [WebMethod]
        public object ParadasProcesoDelete(ParadasProcesoBE obj)
        {
            EntParada.vnIdProceso = obj.vnIdProceso;
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            DataSet dsx = NegParada.ParadasProcesoDelete(EntParada);
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
        [WebMethod]
        public object ParadasProcesoUpdate(ParadasProcesoBE obj)
        { 
            EntParada.vnIdProceso = obj.vnIdProceso;
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            EntParada.vnIdMotivo = obj.vnIdMotivo;
            EntParada.vnIdCultivo = obj.vnIdCultivo;
            EntParada.vcObservacion = obj.vcObservacion;
            DataSet dsx = NegParada.ParadasProcesoUpdate(EntParada);
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

        [WebMethod]
        public object UpdateParadasProceso(ParadasProcesoBE obj)
        {
            EntParada.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntParada.vnIdProceso = obj.vnIdProceso;
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            EntParada.vnIdMotivo = obj.vnIdMotivo;
            EntParada.vnIdCultivo = obj.vnIdCultivo;
            EntParada.vcFechaIni = obj.vcFechaIni;
            EntParada.vcFechaFin = obj.vcFechaFin;
            EntParada.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegParada.UpdateParadasProceso(EntParada);
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

        [WebMethod]
        public object RegiParadasProceso(ParadasProcesoBE obj)
        {
            EntParada.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntParada.vnIdProceso = obj.vnIdProceso;
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            EntParada.vnIdMotivo = obj.vnIdMotivo;
            EntParada.vnIdCultivo = obj.vnIdCultivo;
            EntParada.vcFechaIni = obj.vcFechaIni;
            EntParada.vcFechaFin = obj.vcFechaFin;
            EntParada.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegParada.RegiParadasProceso(EntParada);
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
        
        [WebMethod]
        public object ListParadasProcesoRepo(ParadasProcesoBE obj)
        {
            EntParada.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            EntParada.vcFechaProc = obj.vcFechaProc;
            DataSet dsx = NegParada.ListParadasProcesoRep(EntParada);
            DataTable dt = dsx.Tables[0];
            DataTable dv = dsx.Tables[1];
            //Serializacion
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
            foreach (DataRow ds in dv.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dv.Columns)
                {
                    row2.Add(col.ColumnName, ds[col]);
                }
                rows2.Add(row2);
            }
            var data = new
            {
                dh = rows,
                dd = rows2
            };
            return serializer.Serialize(data);
        }

        [WebMethod]
        public object ListParadasProcesoRep(ParadasProcesoBE obj)
        {
            EntParada.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntParada.vnIdProceso = obj.vnIdProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            EntParada.vcFecha = obj.vcFecha;
            DataSet dsx = NegParada.ListParadasProcesoRep(EntParada);
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

        [WebMethod]
        public object InicFinParadas(ParadasProcesoBE obj)
        {   
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vnIdArea = obj.vnIdArea;
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            EntParada.vnIdMotivo = obj.vnIdMotivo;
            EntParada.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegParada.InicFinParadas(EntParada);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object ListParadasProceso(ParadasProcesoBE obj)
        {
            EntParada.vnIdParadasProceso = obj.vnIdParadasProceso;
            EntParada.vcUsuario = GetParamCokkie("cd_user");
            EntParada.vnIdGrupo = obj.vnIdGrupo;
            DataSet dsx = NegParada.ListParadasProceso(EntParada);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object MotivoList(ConsNisiraBE obj)
        {
            EntNis.vnId = obj.vnId;
            DataSet dsx = NegNis.ListMotivo(EntNis);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object CultivoList(CultivoPackingBE obj)
        {
            EntCultivoPacking.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntCultivoPacking.vnIdCultivo = obj.vnIdCultivo;
            DataSet dsx = NegCultivoPacking.ListCultivoPacking(EntCultivoPacking);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object AvanceProcesoDetalle(RendimientoProcesoRegistroBE obj)
        {
            EntRendProcRegi.vnIdEmpresa = 1;
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcFecha = obj.vcFecha;
            DataSet dsx = NegRendProcRegi.AvanceProcesoDetalle(EntRendProcRegi);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object RepPesoPalet(ConsNisiraBE obj)
        {
            EntNis.vnIdEmpresa = 1;
            EntNis.vcFecha = obj.vcFecha;
            EntNis.vcFechaFin = obj.vcFechaFin;
            EntNis.vcNumero = obj.vcNumero;
            DataSet dsx = NegNis.RepPesoPalet(EntNis);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object VolcadoProceso_List(RendimientoProcesoDetalleBE obj)
        {
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcDeta.vcFecha = obj.vcFecha;
            DataSet dsx = NegRendProcDeta.ListVolcadoProceso(EntRendProcDeta);
            DataTable dt = dsx.Tables[0];
            DataTable dv = dsx.Tables[1];
            //Serializacion
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
            foreach (DataRow ds in dv.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dv.Columns)
                {
                    row2.Add(col.ColumnName, ds[col]);
                }
                rows2.Add(row2);
            }
            var data = new
            {
                dh = rows,
                dd = rows2
            };
            return serializer.Serialize(data);
        }

        [WebMethod]
        public object ListRendimientoProcesoDetalle_update(RendimientoProcesoDetalleBE obj)
        {
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcDeta.vnIdProceso = obj.vnIdProceso;
            EntRendProcDeta.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            EntRendProcDeta.vnIdArea = obj.vnIdArea;
            EntRendProcDeta.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcDeta.vnIdSupervisor = obj.vnIdSupervisor;
            EntRendProcDeta.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntRendProcDeta.vnIdCultivo = obj.vnIdCultivo;
            EntRendProcDeta.vnIdVariedad = obj.vnIdVariedad;
            EntRendProcDeta.vnIdClieProv = obj.vnIdClieProv;
            DataSet dsx = NegRendProcDeta.ListRendimientoProcesoDetalle_update(EntRendProcDeta);
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

        [WebMethod]
        public object ReadRendimientoProcesoDetalle(RendimientoProcesoDetalleBE obj)
        {
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcDeta.vnIdProceso = obj.vnIdProceso;
            EntRendProcDeta.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            EntRendProcDeta.vnIdArea = obj.vnIdArea;
            EntRendProcDeta.vnIdGrupo = obj.vnIdGrupo;
            DataSet dsx = NegRendProcDeta.ReadRendimientoProcesoDetalle(EntRendProcDeta);
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

        [WebMethod]
        public object ListRendimientoProcesoDetalle(RendimientoProcesoDetalleBE obj)
        {
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcDeta.vnIdProceso = obj.vnIdProceso;
            EntRendProcDeta.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            EntRendProcDeta.vnIdArea = obj.vnIdArea;
            EntRendProcDeta.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcDeta.vcFecha = obj.vcFecha;
            DataSet dsx = NegRendProcDeta.ListRendimientoProcesoDetalle(EntRendProcDeta);
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

        [WebMethod]
        public object ListRendimientoProcesoDetalleRepo(RendimientoProcesoDetalleBE obj)
        {
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcDeta.vnIdProceso = obj.vnIdProceso;
            EntRendProcDeta.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            EntRendProcDeta.vnIdArea = obj.vnIdArea;
            EntRendProcDeta.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcDeta.vcFecha = obj.vcFecha;
            DataSet dsx = NegRendProcDeta.ListRendimientoProcesoDetalle(EntRendProcDeta);
            DataTable dt = dsx.Tables[0];
            DataTable dv = dsx.Tables[1];
            //Serializacion
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
            foreach (DataRow ds in dv.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dv.Columns)
                {
                    row2.Add(col.ColumnName, ds[col]);
                }
                rows2.Add(row2);
            }
            var data = new
            {
                dh = rows,
                dd = rows2
            };
            return serializer.Serialize(data);
        }

        [WebMethod]
        public object ValidarProceso(RendimientoProcesoBE obj)
        {
            EntRendProc.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProc.vnIdProceso = 0;
            EntRendProc.vnIdArea = obj.vnIdArea;
            DataSet dsx = NegRendProc.ListRendimientoProceso(EntRendProc);
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

        [WebMethod]
        public object ListProyectadoCampania(ConsHispBE obj)
        {
            EntHisp.vnIdEmpresa = 1;
            DataSet dsx = NegHisp.ListProyectadoCampania(EntHisp);
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

        //
        [WebMethod]
        public object InformeParteTransformacion(ConsHispBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            EntHisp.vnTipoOperacion = obj.vnTipoOperacion;
            EntHisp.vcTipoDato = obj.vcTipoDato;
            EntHisp.vcCampania = obj.vcCampania;
            DataSet dsx = NegHisp.InformeParteTransformacion(EntHisp);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;

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


                DataTable dv2 = dsx.Tables[2];
                foreach (DataRow dr in dv2.Rows)
                {
                    row3 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv2.Columns)
                    {
                        row3.Add(col.ColumnName, dr[col]);
                    }
                    rows3.Add(row3);
                }

                if (EntHisp.vnTipoOperacion != 2)
                {
                    DataTable dv3 = dsx.Tables[3];
                    foreach (DataRow dr in dv3.Rows)
                    {
                        row4 = new Dictionary<string, object>();
                        foreach (DataColumn col in dv3.Columns)
                        {
                            row4.Add(col.ColumnName, dr[col]);
                        }
                        rows4.Add(row4);
                    }
                }


            }
            else
            {
                row2 = new Dictionary<string, object>();
                row2.Add("", "");
                rows2.Add(row2);
                row3 = new Dictionary<string, object>();
                row3.Add("", "");
                rows3.Add(row3);
                row4 = new Dictionary<string, object>();
                row4.Add("", "");
                rows4.Add(row4);
            }

            var data = new
            {
                dh = rows3,
                dd = rows2,
                df = rows,
                dc = rows4
            };


            return serializer.Serialize(data);
        }

        //
        [WebMethod]
        public object InformeParteTransformacionComparativo(ConsHispBE obj)
        {
            EntHisp.vnTipoOperacion = obj.vnTipoOperacion;
            EntHisp.vcTipoDato = obj.vcTipoDato;
            EntHisp.vcCampania = obj.vcCampania;
            EntHisp.vcCampania2 = obj.vcCampania2;
            DataSet dsx = NegHisp.InformeParteTransformacionComparativo(EntHisp);
            DataTable dt1 = dsx.Tables[0];
            DataTable dd1 = dsx.Tables[1];
            DataTable dt2 = dsx.Tables[2];
            DataTable dd2 = dsx.Tables[3];
            DataTable dtt = dsx.Tables[4];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt1.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt1.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }

            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;
            foreach (DataRow ds in dd1.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dd1.Columns)
                {
                    row2.Add(col.ColumnName, ds[col]);
                }
                rows2.Add(row2);
            }

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;
            foreach (DataRow dr in dt2.Rows)
            {
                row3 = new Dictionary<string, object>();
                foreach (DataColumn col in dt2.Columns)
                {
                    row3.Add(col.ColumnName, dr[col]);
                }
                rows3.Add(row3);
            }

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;
            foreach (DataRow ds in dd2.Rows)
            {
                row4 = new Dictionary<string, object>();
                foreach (DataColumn col in dd2.Columns)
                {
                    row4.Add(col.ColumnName, ds[col]);
                }
                rows4.Add(row4);
            }

            List<Dictionary<string, object>> rows5 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row5;
            foreach (DataRow ds in dtt.Rows)
            {
                row5 = new Dictionary<string, object>();
                foreach (DataColumn col in dtt.Columns)
                {
                    row5.Add(col.ColumnName, ds[col]);
                }
                rows5.Add(row5);
            }

            var data = new
            {
                dt1 = rows,
                dd1 = rows2,
                dt2 = rows3,
                dd2 = rows4,
                dtt = rows5,
            };
            return serializer.Serialize(data);
        }

        [WebMethod]
        public object ResumenRecepcion(ConsHispBE obj) {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            DataSet dsx = NegHisp.ResumenRecepcion(EntHisp);
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

        [WebMethod]
        public object ResumenRecepcion_nis(ConsHispBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            DataSet dsx = NegHisp.ResumenRecepcion_nis(EntHisp);
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



        [WebMethod]
        public object ConsultaMarcas(ConsExternaBE obj)
        {
            EntCons.vcFechaIni = obj.vcFechaIni;
            EntCons.vcFechaFin = obj.vcFechaFin;
            DataSet dsx = NegCons.ConsultaMarcasList(EntCons);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object AGrupoList(AreaGrupoBE obj)
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntArGr.vnIdArea = obj.vnIdArea;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = 0;
            DataSet dsx = NegArGr.ListAreaGrupo(EntArGr);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object EmbalajeListc(EmbalajeBE obj)
        {
            EntEmbalaje.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntEmbalaje.vnIdCultivo = obj.vnIdCultivo;
            EntEmbalaje.VnIdEmbalaje = obj.VnIdEmbalaje;
            EntEmbalaje.vnIdTipoc = obj.vnIdTipoc;
            DataSet dsx = NegEmbalaje.ListEmbalajec(EntEmbalaje);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public List<int> RegiRendimientoProcesoDetalle(RendimientoProcesoDetalleBE obj)
        {
            List<int> lstRtrn = new List<int>();
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcDeta.vnIdArea = obj.vnIdArea;
            EntRendProcDeta.vnIdProceso = obj.vnIdProceso;
            EntRendProcDeta.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            EntRendProcDeta.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcDeta.vnIdSupervisor = obj.vnIdSupervisor;
            EntRendProcDeta.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntRendProcDeta.vnIdCultivo = obj.vnIdCultivo;
            EntRendProcDeta.vnIdVariedad = obj.vnIdVariedad;
            EntRendProcDeta.vnIdClieProv = obj.vnIdClieProv;
            EntRendProcDeta.vnIdSupervisor = obj.vnIdSupervisor;
            RendimientoProcesoDetalleBE clMsje = NegRendProcDeta.RegiRendimientoProcesoDetalle(EntRendProcDeta);
            //
            EntRendProc.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProc.vnIdArea = obj.vnIdArea;
            EntRendProc.vbEstado = obj.vbEstado;
            clMsje.vbEstado = Convert.ToBoolean(NegRendProc.BloqueoLinea(EntRendProc));
            //
            lstRtrn.Add(clMsje.vnIdProceso);
            lstRtrn.Add(clMsje.vnIdProcesoDetalle);
            return lstRtrn;
        }

        [WebMethod]
        public object RegiAnularEtiqueta(RendimientoProcesoRegistroBE obj)
        {
            DataTable dt = new DataTable();
            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vcLabor = obj.vcLabor;
            EntRendProcRegi.vcAnio = obj.vcAnio;
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            EntRendProcRegi.vnIdRendPack = obj.vnIdRendPack;
            EntRendProcRegi.vnIdProceso = obj.vnIdProceso;
            EntRendProcRegi.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            //
            DataSet dsx = new DataSet();
            //DataTable dt = new DataTable();
            Thread th = new Thread(delegate ()
            {
                dsx = NegRendProcRegi.RegiAnularEtiqueta(EntRendProcRegi);
            });
            th.Start();
            th.Join();
            dt = dsx.Tables[0];
            //Serializacion

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
        public object RegiRendProcRegistro(RendimientoProcesoRegistroBE obj)
        {
            DataTable dt = new DataTable();
            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vcLabor = obj.vcLabor;
            EntRendProcRegi.vcAnio = obj.vcAnio;
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            EntRendProcRegi.vnIdRendPack = obj.vnIdRendPack;
            EntRendProcRegi.vnIdProceso = obj.vnIdProceso;
            EntRendProcRegi.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            //
            DataSet dsx = new DataSet();
            //DataTable dt = new DataTable();
            Thread th = new Thread(delegate ()
            {
                dsx = NegRendProcRegi.RegiRendProcRegistro(EntRendProcRegi);
            });
            th.Start();
            th.Join();
            dt = dsx.Tables[0];
            //Serializacion

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
        public object LecturaCode(RendimientoProcesoRegistroBE obj)
        {
            DataTable dt = new DataTable();
            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vnIdProceso = obj.vnIdProceso;
            EntRendProcRegi.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vnIdSupervisor = obj.vnIdSupervisor;
            EntRendProcRegi.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntRendProcRegi.vnIdCultivo = obj.vnIdCultivo;
            EntRendProcRegi.vnIdVariedad = obj.vnIdVariedad;
            EntRendProcRegi.vnIdClieProv = obj.vnIdClieProv;
            EntRendProcRegi.vcAnio = obj.vcAnio;
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            EntRendProcRegi.vnIdRendPack = obj.vnIdRendPack;
            //
            DataSet dsx = new DataSet();
            //DataTable dt = new DataTable();
            Thread th = new Thread(delegate ()
            {
                dsx = NegRendProcRegi.RegiRendProcLectura(EntRendProcRegi);
            });
            th.Start();
            th.Join();
            dt = dsx.Tables[0];
            //Serializacion

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
        public object RegiPesoPalet(ConsHispBE obj)
        {
            return NegHisp.RegiPesoPalet(obj);
        }

        [WebMethod]
        public object GetInfoPalt(ConsHispBE obj)
        {
            DataSet dsx = NegHisp.GetInfoPalet(obj);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object GetConteoTicketsPendientes(object algo)
        {
            /*
            DataSet dsx = NegHisp.GetInfoPalet(obj);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
            return serializer.Serialize(rows);*/
            return null;
        }






        /***********************************************************************************/
        //ANGEL GONZALES CASTILLA - TI
        [WebMethod]
        public string ListarCampana_SUN(PTComboCultivo pt)
        {
            PTComboCultivo objp = pt;
            string cultivo = objp.cultivo;
            DataSet dsx = NegHisp.ListarCampana(cultivo);
            DataTable dt = dsx.Tables[0];

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
        /***********************************************************************************/



        public class Data
        {
            public string numero { get; set; }
            public string nombre_completo { get; set; }
            public string nombres { get; set; }
            public string apellido_paterno { get; set; }
            public string apellido_materno { get; set; }
            public string direccion { get; set; }
            public string direccion_completa { get; set; }
            public string departamento { get; set; }
            public string provincia { get; set; }
            public string distrito { get; set; }
            public string nombre_o_razon_social { get; set; }
            public int codigo_verificacion { get; set; }
            public string ubigeo_reniec { get; set; }
            public List<string> ubigeo { get; set; }
        }

        public class Root
        {
            public bool success { get; set; }
            public Data data { get; set; }
        }

        [WebMethod]
        public object GetPersonExt(PersonalBE obj)
        {
            string url = "http://204.199.164.92/reniec/index.php?dni=" + obj.vcNroDocumento;
            ServicePointManager.CertificatePolicy = new MyPolicy();

            // DataTable ds = dsx.Tables[0];
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            string nom = "";
            int estadod = 6;
            string dFechaRegistro = "";
            string cNombresApellidos = "";
            string nEstado = "";
            int nIdp = 0;

            var jsonObject = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.KeepAlive = false;
                request.Method = "GET";
                request.ReadWriteTimeout = 5000;
                request.Timeout = 10;
                request.ContentType = "text/html;charset=UTF-8";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream myResponseStream = response.GetResponseStream();
                StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));

                // devolver contenido
                jsonObject = myStreamReader.ReadToEnd();

                List<Root> listRegistro = serializer.Deserialize<List<Root>>(jsonObject);
                if (listRegistro[0].data != null)
                {
                    EntPersonal.vnIdPersonal = nIdp;
                    EntPersonal.vcNroDocumento = obj.vcNroDocumento;
                    EntPersonal.vcApPaterno = listRegistro[0].data.apellido_paterno;
                    EntPersonal.vcApMaterno = listRegistro[0].data.apellido_materno;
                    EntPersonal.vcNombres = listRegistro[0].data.nombres;
                    cNombresApellidos = listRegistro[0].data.nombre_completo;
                    estadod = 1;

                }
                else
                {
                    cNombresApellidos = "PERSONA NO ENCONTRADO - VERIFIQUE DNI";
                    estadod = 6;
                }
            }
            catch (Exception ee)
            {

            }

            row = new Dictionary<string, object>();
            row.Add("dFechaRegistro", dFechaRegistro);
            row.Add("cNombresApellidos", cNombresApellidos);
            row.Add("nEstado", estadod);
            row.Add("nIdp", nIdp);
            rows.Add(row);
            return serializer.Serialize(rows);
        }

        public class MyPolicy : ICertificatePolicy
        {
            public bool CheckValidationResult(ServicePoint srvPoint,
              System.Security.Cryptography.X509Certificates.X509Certificate certificate, WebRequest request,
              int certificateProblem)
            {
                //Return True to force the certificate to be accepted.
                return true;
            }
        }

        [WebMethod]
        public object InicFinProceso(RendimientoProcesoBE obj)
        {
            EntRendProc.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProc.vnIdArea = obj.vnIdArea;
            EntRendProc.vnIdProceso = obj.vnIdProceso;
            EntRendProc.vcFechaProceso = obj.vcFechaProceso;
            EntRendProc.vcObservacion = obj.vcObservacion;
            EntRendProc.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegRendProc.InicFinProceso(EntRendProc);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object RendimientoCastigo_Regi(RendimientoProcesoRegistroBE obj)
        {

            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcFecha = obj.vcFecha;
            EntRendProcRegi.vcIdCodigoGeneral = obj.vcIdCodigoGeneral;
            EntRendProcRegi.vnCastigo = obj.vnCastigo;
            DataSet dsx = NegRendProcRegi.RendimientoCastigo_Regi(EntRendProcRegi);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object RendimientoProcesoRegistroAvanceUser(RendimientoProcesoRegistroBE obj)
        {

            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vcFecha = obj.vcFecha;
            EntRendProcRegi.vnIdProceso = obj.vnIdArea;
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            EntRendProcRegi.vcNombres = obj.vcNombres;

            DataSet dsx = NegRendProcRegi.RendimientoProcesoRegistroAvanceUser(EntRendProcRegi);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object RendimientoProcesoRegistroListUser(RendimientoProcesoRegistroBE obj)
        {

            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vcFecha = obj.vcFecha;
            EntRendProcRegi.vnIdProceso = obj.vnIdArea;
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            EntRendProcRegi.vcNombres = obj.vcNombres;

            DataSet dsx = NegRendProcRegi.RendimientoProcesoRegistroListUser(EntRendProcRegi);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object RendimientoProcesoRegistroList(RendimientoProcesoRegistroBE obj)
        {

            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vnIdProceso = obj.vnIdArea;
            EntRendProcRegi.vcFecha = obj.vcFecha;
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcLabor = obj.vcLabor;
            EntRendProcRegi.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntRendProcRegi.vnIdPersonal = obj.vnIdPersonal;

            DataSet dsx = NegRendProcRegi.RendimientoProcesoRegistroList(EntRendProcRegi);
            DataTable dt = dsx.Tables[0];
            //Serializacion

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
        public object BloqueoLinea(RendimientoProcesoBE obj)
        {
            EntRendProc.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProc.vnIdArea = obj.vnIdArea;
            EntRendProc.vbEstado = obj.vbEstado;
            int vvMsje = NegRendProc.BloqueoLinea(EntRendProc);
            return vvMsje;
        }

        [WebMethod]
        public int UpdPanelInfo(PanelInfoBE obj)
        {
            EntPaneInfo.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPaneInfo.vnIdArea = obj.vnIdArea;
            EntPaneInfo.vcUsuario = GetParamCokkie("cd_user");
            return NegPaneInfo.UpdPanelInfo(EntPaneInfo);
        }

        [WebMethod]
        public object ListRendimientoProcesoRegistroRT(RendimientoProcesoRegistroBE obj)
        {
            EntRendProcRegi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcFecha = obj.vcFecha;
            DataSet dsx = NegRendProcRegi.RendimientoProcesoRegistroListRT(EntRendProcRegi);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public object ListPanelInfo(PanelInfoBE obj)
        {
            EntPaneInfo.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPaneInfo.vnIdArea = obj.vnIdArea;
            EntPaneInfo.vnIdSubLinea = obj.vnIdSubLinea;
            EntPaneInfo.vnIdPanelInfo = obj.vnIdPanelInfo;
            DataSet dsx = NegPaneInfo.LisPanelInfo(EntPaneInfo);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public int RegiPanelInfo(PanelInfoBE obj)
        {
            EntPaneInfo.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPaneInfo.vnIdSubLinea = obj.vnIdSubLinea;
            EntPaneInfo.vnIdPanelInfo = obj.vnIdPanelInfo;
            EntPaneInfo.vnIdCultivo = obj.vnIdCultivo;
            EntPaneInfo.vnIdCategoria = obj.vnIdCategoria;
            EntPaneInfo.vnIdCalibre = obj.vnIdCalibre;
            EntPaneInfo.vbPlu = obj.vbPlu;
            EntPaneInfo.vbEstado = obj.vbEstado;
            EntPaneInfo.vcUsuario = GetParamCokkie("cd_user");
            return NegPaneInfo.RegiPanelInfo(EntPaneInfo);
        }

        [WebMethod]
        public object ListSubLinea(SubLineaBE obj)
        {
            EntSubL.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntSubL.vnIdSubLinea = 0;
            EntSubL.vnIdArea = obj.vnIdArea;
            EntSubL.vnIdGrupo = 0;
            DataSet dsx = NegSubL.ListSubLinea(EntSubL);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public object ListAreaGrupo(AreaGrupoBE obj)
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntArGr.vnIdArea = obj.vnIdArea;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            DataSet dsx = NegArGr.ListAreaGrupo(EntArGr);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public object ListMonitor(MonitorSubLineaBE obj)
        {
            EntMoniSl.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntMoniSl.vnIdArea = obj.vnIdArea;
            DataSet dsx = NegMoniSl.ListMonitor(EntMoniSl);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public object ListSubLineArea(MonitorSubLineaBE obj)
        {
            EntMoniSl.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntMoniSl.vnIdMonitor = obj.vnIdMonitor;
            DataSet dsx = NegMoniSl.ListSubLineArea(EntMoniSl);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public object ListCultivoCaracteristica(CultivoCaracteristicaBE obj)
        {
            EntCarac.vnIdCultivo = obj.vnIdCultivo;
            EntCarac.vcTipo = obj.vcTipo;
            DataSet dsx = NegCarac.ListCultivoCarcteristica(EntCarac);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public object ListMonitorSubLinea(MonitorSubLineaBE obj)
        {
            EntMoniSl.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntMoniSl.vnIdMonitor = obj.vnIdMonitor;
            DataSet dsx = NegMoniSl.ListMonitorSubLinea(EntMoniSl);
            DataTable dt = dsx.Tables[0];
            //Serializacion
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
        public string RegiPalletMov(PalletMovBE obj)
        {
            EntPaleMov.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPaleMov.vcIdRegistroPaleta = obj.vcIdRegistroPaleta;
            EntPaleMov.vcIdCampana = obj.vcNroPaleta.Substring(0, 4);
            EntPaleMov.vcNroPaleta = obj.vcNroPaleta;
            EntPaleMov.vnIdMov = obj.vnIdMov;
            EntPaleMov.vcUsuario = GetParamCokkie("cd_user"); ;
            EntPaleMov.vcMovObs = "";
            EntPaleMov.vcTipoMovi = obj.vcTipoMovi;
            EntPaleMov.vcCodUbic = obj.vcCodUbic.ToUpper();
            EntPaleMov.vnCodUbicDet = 0;
            EntPaleMov.vcMensaje = "";
            string vvMsje = NegPale.RegiPalletMov(EntPaleMov);
            return vvMsje;
        }

        [WebMethod]
        public object ListPallet(string vsCdPale)
        {
            EntPaleMov.vnIdEmpresa = 1;
            EntPaleMov.vcIdCampana = vsCdPale.Substring(0, 4);
            EntPaleMov.vcNroPaleta = vsCdPale;
            DataSet ds = NegPale.ListPalletEx(EntPaleMov);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public object ListUbicacion(UbicacionBE obj)
        {
            EntUbic.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntUbic.vcCodUbic = obj.vcCodUbic;
            EntUbic.vnTipoUbic = 0;
            DataSet ds = NegUbic.ListUbicacion(EntUbic);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public object ListUbicPale(int vnLen)
        {
            EntUbic.vnIdEmpresa = 1;
            EntUbic.vnTipoUbic = vnLen;
            DataSet ds = NegUbic.ListUbicPale(EntUbic);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public object ListProvClie(string ctipo)
        {
            EntCons.vnIdEmpresa = 1;
            EntCons.vnSistema = 1;
            EntCons.vctipo = ctipo;
            DataSet ds = NegCons.ListProvClie(EntCons);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public object ListVariedad(string ctipo)
        {
            EntCons.vnIdEmpresa = 1;
            EntCons.vnSistema = 1;
            EntCons.vctipo = ctipo;
            DataSet ds = NegCons.ListVariedad(EntCons);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public object ListStockPallet(string IdCliente, string IdCultivo, string IdVariedad, int vnIdCarga)
        {
            EntCons.vnIdEmpresa = 1;
            EntCons.vnSistema = 1;
            EntCons.vcIdCliente = IdCliente;
            EntCons.vcIdCultivo = IdCultivo;
            EntCons.vcIdVariedad = IdVariedad;
            EntCons.vcFecha = "";
            EntCons.vnIdOrdCarga = vnIdCarga;
            DataSet ds = NegCons.ListStockPallet(EntCons);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public string RegiOrdenCarga(List<ConsExternaBE> List)
        {
            List<ConsExternaBE> lt = new List<ConsExternaBE>();
            string formats = "dd/MM/yyyy HH:mm";
            EntOrdc.vnIdEmpresa = 1;
            DataTable dt = new DataTable();
            dt.Columns.Add("cIdRegistroPaleta", typeof(string));
            dt.Columns.Add("cIdCampana", typeof(string));
            dt.Columns.Add("cNroPaleta", typeof(string));
            dt.Columns.Add("desc_cliente", typeof(string));
            dt.Columns.Add("desc_productor", typeof(string));
            dt.Columns.Add("grower_code", typeof(string));
            dt.Columns.Add("desc_variedad", typeof(string));
            dt.Columns.Add("desc_envase", typeof(string));
            dt.Columns.Add("desc_condicion", typeof(string));
            dt.Columns.Add("desc_talla", typeof(string));
            dt.Columns.Add("desc_color", typeof(string));
            dt.Columns.Add("talla_equiv", typeof(string));
            dt.Columns.Add("desc_embalaje", typeof(string));
            dt.Columns.Add("desc_parihuela", typeof(string));
            dt.Columns.Add("desc_etiqueta", typeof(string));
            dt.Columns.Add("desc_etiqueta2", typeof(string));
            dt.Columns.Add("fechaproc", typeof(string));
            dt.Columns.Add("desc_motivopaleta", typeof(string));
            dt.Columns.Add("nromanual", typeof(string));
            dt.Columns.Add("desc_sucursal", typeof(string));
            foreach (var item in List)
            {
                if (item.vnIdTiRow == 1)
                {
                    EntOrdc.vnIdOrdCarga = item.vnIdOrdCarga;
                    EntOrdc.vnNoCarga = item.vnNoCarga;
                    EntOrdc.vcDescCarga = item.vcDescCarga;
                    EntOrdc.vcDestino = item.vcDestino;
                    EntOrdc.vdHoraCarga = DateTime.ParseExact(item.vcFecha + " " + item.vcHora, formats, System.Globalization.CultureInfo.InvariantCulture);
                    EntOrdc.vcBooking = item.vcBooking;
                    EntOrdc.vcIdProvLote = item.vcIdProvLote.Trim();
                    EntOrdc.vcIdCultivo = item.vcIdCultivo.Trim();
                }
                else
                {
                    var row = dt.NewRow();
                    row["cIdRegistroPaleta"] = item.vcIdRegistroPaleta;
                    row["cIdCampana"] = item.vcIdCampana;
                    row["cNroPaleta"] = item.vcNroPaleta;
                    row["desc_cliente"] = item.desc_cliente;
                    row["desc_productor"] = item.desc_productor;
                    row["grower_code"] = item.grower_code;
                    row["desc_variedad"] = item.desc_variedad;
                    row["desc_envase"] = item.desc_envase;
                    row["desc_condicion"] = item.desc_condicion;
                    row["desc_talla"] = item.desc_talla;
                    row["desc_color"] = item.desc_color;
                    row["talla_equiv"] = item.talla_equiv;
                    row["desc_embalaje"] = item.desc_embalaje;
                    row["desc_parihuela"] = item.desc_parihuela;
                    row["desc_etiqueta"] = item.desc_etiqueta;
                    row["desc_etiqueta2"] = item.desc_etiqueta2;
                    row["fechaproc"] = item.vcFecha;
                    row["desc_motivopaleta"] = item.desc_motivopaleta;
                    row["nromanual"] = item.nromanual;
                    row["desc_sucursal"] = item.desc_sucursal;
                    dt.Rows.Add(row);
                }
            }
            string vcIdOrdCarga = NegOrdc.RegiOrdenCarga(EntOrdc, dt);
            return vcIdOrdCarga;
        }

        [WebMethod]
        public object ListUbicInfo(string vcCodUbic)
        {
            EntUbic.vnIdEmpresa = 1;
            EntUbic.vcCodUbic = vcCodUbic;
            DataSet ds = NegUbic.ListUbicInfo(EntUbic);
            DataTable dt = ds.Tables[0];
            //Serializacion
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
        public string RegiPersonal(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcApPaterno = obj.vcApPaterno;
            EntPersonal.vcApMaterno = obj.vcApMaterno;
            EntPersonal.vcNombres = obj.vcNombres;
            EntPersonal.vcCodigoControl = obj.vcCodigoControl;
            EntPersonal.vcIdPlanilla = obj.vcIdPlanilla;
            EntPersonal.vcGrupoTrabajo = obj.vcGrupoTrabajo;
            EntPersonal.vcIdCodigoGeneral = obj.vcIdCodigoGeneral;
            EntPersonal.vcCodigoLabor = obj.vcCodigoLabor;
            EntPersonal.vbEstado = obj.vbEstado;
            EntPersonal.vnEstado = obj.vnEstado;
            EntPersonal.vcSexo = obj.vcSexo;
            var frx = DateTime.ParseExact(obj.vcFechaNacimiento, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntPersonal.vdFechaNacimiento = frx.Date;
            var fry = DateTime.ParseExact(obj.vcFechaRegistro, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntPersonal.vdFechaRegistro = fry.Date;
            String vvMsje = NegPersonal.RegiPersonal(EntPersonal);
            return vvMsje;
        }

        [WebMethod]
        public int MostrarPresentacion(int canal) 
        {
            // Buscar el canal en todas los registros de presentación.
            // 
            EspecificacionBL ebl = new EspecificacionBL();

            EspecificacionMonitorBE monitor = new EspecificacionMonitorBE();
            monitor.nIdCanal = 0;
            monitor.nIdEspecificacion = 0;
            monitor.nIdEspecificacionMonitor = 0;
            /*
            DataSet ds = em.Canal(canal);
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                monitor.nIdEspecificacion = Convert.ToInt32(item.ItemArray[2].ToString());
            }*/

            DataSet ds = ebl.CanalesEnPresentacion(canal.ToString());
            DataTable dt = ds.Tables[0];
            foreach (DataRow item in dt.Rows)
            {
                monitor.nIdEspecificacion = Convert.ToInt32(item.ItemArray[0].ToString());
                break;
            }
            return monitor.nIdEspecificacion;
        }

        [WebMethod]
        public object RegImagen(EspecificacionDetalleBE obj) 
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            if (obj.Imagen.Equals(string.Empty) || obj.Imagen.Equals(null))
            {
                obj.Imagen = Guid.NewGuid().ToString();
            }

            if (obj.ImagenBase64.Contains("data:image/png;base64,") && obj.ImagenBase64 != "")
            {
                string carpeta = Server.MapPath("~/Img/EspEmbalaje/");
                string narchivo = obj.Imagen;
                if (narchivo.Contains(".jpg"))
                {
                    narchivo = obj.Imagen;
                }
                else
                {
                    narchivo = obj.Imagen + ".jpg";
                }
                string ruta = Path.Combine(carpeta, narchivo);

                if (File.Exists(ruta))
                {
                    File.Delete(ruta);
                }

                string base64StringData = obj.ImagenBase64;
                string cleandata = base64StringData.Replace("data:image/png;base64,", "");
                byte[] data = Convert.FromBase64String(cleandata);
                MemoryStream ms = new MemoryStream(data);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
                img.Save(ruta, System.Drawing.Imaging.ImageFormat.Jpeg);
            }

            var rpta = new
            {
                rpta = 1
            };

            return serializer.Serialize(rpta);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int Especificacion_Guardar(object objs)
        {
            int resp = 0;

            try
            {
                EspecificacionBE especificacionBE = new EspecificacionBE();
                Dictionary<string, object> parametro = (Dictionary<string, object>)objs;
                especificacionBE.Id = parametro["cab_id"].ToString();
                especificacionBE.Productor = parametro["productor"].ToString();
                especificacionBE.Categoria = parametro["categoria"].ToString();
                especificacionBE.Monitor = parametro["monitor"].ToString();
                especificacionBE.Empaque = parametro["empaque"].ToString();

                var detalle = ((IEnumerable)parametro["detalle"]).Cast<object>().ToList();
                List<EspecificacionDetalleBE> especificacionDetallesBE = new List<EspecificacionDetalleBE>();
                int pos = 0;
                foreach (Dictionary<string, object> fila in detalle)
                {
                    pos++;
                    EspecificacionDetalleBE especificacionDetalleBE = new EspecificacionDetalleBE();
                    especificacionDetalleBE.Id = fila["det_id"].ToString();
                    especificacionDetalleBE.Titulo = fila["titulo"].ToString();
                    especificacionDetalleBE.Descripcion = fila["descripcion"].ToString();
                    especificacionDetalleBE.Imagen = fila["imagen"].ToString();
                    especificacionDetalleBE.ImagenBase64 = fila["imagenbase64"].ToString();
                    especificacionDetalleBE.Posicion = pos;
                    especificacionDetallesBE.Add(especificacionDetalleBE);
                    RegImagen(especificacionDetalleBE);
                }
                especificacionBE.Imagenes = especificacionDetallesBE;

                EspecificacionBL especificacionBL = new EspecificacionBL();
                especificacionBL.Registrar(especificacionBE);
                resp = 1;
            }
            catch (Exception)
            {
                resp = 0;
            }
            return resp;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int Especificacion_Eliminar(int objs)
        {
            int respuesta = 0;
            try
            {
                EspecificacionDetalleBL especificacionDetalleBL = new EspecificacionDetalleBL();
                especificacionDetalleBL.Eliminar(objs);
                respuesta = 1;
            }
            catch (Exception)
            {
                respuesta = 0;
            }
            return respuesta;
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }
    }
}
