using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;
using System.IO;

using System.Net;
using Newtonsoft.Json;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerComex
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class 
        SerComex : System.Web.Services.WebService
    {
        PersonalBE EntPersonal = new PersonalBE();
        PersonalBL NegPersonal = new PersonalBL();

        CajasOEBE EntCajasOE = new CajasOEBE();
        CajasOEBL NegCajasOE = new CajasOEBL();

        ClienteProdBE EntCliente = new ClienteProdBE();
        ClienteProdBL NegCliente = new ClienteProdBL();

        ObservacionOEBE EntObservacionOE = new ObservacionOEBE();
        ObservacionOEBL NegObservacionOE = new ObservacionOEBL();

        InstruccionEmbarqueBE EntInstruccion = new InstruccionEmbarqueBE();
        InstruccionEmbarqueBL NegInstruccion = new InstruccionEmbarqueBL();

        OrdenEmbarqueBE EntOrdenEmbarque = new OrdenEmbarqueBE();
        OrdenEmbarqueBL NegOrdenEmbarque = new OrdenEmbarqueBL();

        ConsHispBE EntConsHisp = new ConsHispBE();
        ConsHispBL NegConsHisp = new ConsHispBL();


        ConsNisiraBE EntConsNisira = new ConsNisiraBE();
        ConsNisiraBL NegConsNisira = new ConsNisiraBL();

        CultivoPackingVariedadBE EntCultivoVariedad = new CultivoPackingVariedadBE();
        CultivoPackingVariedadBL NegCultivoVariedad = new CultivoPackingVariedadBL();

        EmbalajeBE EntEmbalaje = new EmbalajeBE();
        EmbalajeBL NegEmbalaje = new EmbalajeBL();

        CultivoTemperaturaBE EntCultivoTemp = new CultivoTemperaturaBE();
        CultivoTemperaturaBL NegCultivoTemp = new CultivoTemperaturaBL();

        NavioBE EntNavio = new NavioBE();
        NavioBL NegNavio = new NavioBL();

        UtilBL negUtil = new UtilBL();

        CampanaBE EntCampana = new CampanaBE();
        CampanaBL NegCampana = new CampanaBL();

        CmbCampanaBE EntCombo = new CmbCampanaBE();

        [WebMethod]
        public object NavioList(NavioBE obj)
        {
            EntNavio.vnIdEmpresa = 1;
            EntNavio.vnIdNavio = 0;
            DataSet dsx = NegNavio.ListNavio(EntNavio);
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
        public object LugarSalidaList(OrdenEmbarqueBE obj)
        {
            EntConsHisp.vnId = 0;
            EntConsHisp.vcNombre = "";
            DataSet dsx = NegConsHisp.ListLocalizacion(EntConsHisp);
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
        public object OrdenEmbarqueConsolidadoList(OrdenEmbarqueBE obj)
        {
            EntOrdenEmbarque.vnIdEmpresa = 1;
            EntOrdenEmbarque.vnIdOrdenEmbarque = 0;
            EntOrdenEmbarque.vnIdInstruccion = 0;
            EntOrdenEmbarque.vnIdCampana = 0;
            EntOrdenEmbarque.vnIdShipper = 0;
            EntOrdenEmbarque.vnIdCultivo = 0;
            DataSet dsx = NegOrdenEmbarque.ListOrdenEmbarqueConsolidado(EntOrdenEmbarque);
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
        public object ACTUALIZA_CLIE_GUIAS(ConsNisiraBE obj)
        {
            EntConsNisira.vcEmpresa = obj.vcEmpresa;
            EntConsNisira.vcSerie = obj.vcSerie;
            EntConsNisira.vcNumero = obj.vcNumero;
            EntConsNisira.vcIdCliente = obj.vcIdCliente;
            DataSet dsx = NegConsNisira.ACTUALIZA_CLIE_GUIA(EntConsNisira);
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
        public object DeleteCorrOrdenEmbarque(OrdenEmbarqueBE obj)
        {
            EntOrdenEmbarque.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrdenEmbarque.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            DataSet dsx = NegOrdenEmbarque.DeleteCorrOrdenEmbarque(EntOrdenEmbarque);
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
        public string[] ArrayClienteNis(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcIdCliente = obj.vcIdCliente;
            return NegConsNisira.ClienteListArray(EntConsNisira);
        }

        [WebMethod]
        public string[] ArrayProductoNis(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcId = obj.vcId;
            return NegConsNisira.ArrayProductoNis(EntConsNisira);
        }
        

        [WebMethod]
        public object GenerarOrdenEmbarque(OrdenEmbarqueBE obj)
        {
            EntOrdenEmbarque.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrdenEmbarque.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            DataSet dsx = NegOrdenEmbarque.GenerarOrdenEmbarque(EntOrdenEmbarque);
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
        public object SaveGenerarOrdenEmbarque(OrdenEmbarqueBE obj)
        {
            EntOrdenEmbarque.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrdenEmbarque.vcCShipper = obj.vcCShipper;
            EntOrdenEmbarque.vcCCliente = obj.vcCCliente;
            EntOrdenEmbarque.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            DataSet dsx = NegOrdenEmbarque.SaveGenerarOrdenEmbarque(EntOrdenEmbarque);
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
        public object CultivoTemperaturaList(CultivoTemperaturaBE obj)
        {
            EntCultivoTemp.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntCultivoTemp.vnIdCultivo = obj.vnIdCultivo;
            EntCultivoTemp.vnIdCultivoTemp = obj.vnIdCultivoTemp;
            DataSet dsx = NegCultivoTemp.ListCultivoTemperatura(EntCultivoTemp);
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
        public object VariedadList(CultivoPackingVariedadBE obj)
        {
            EntCultivoVariedad.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntCultivoVariedad.vnIdCultivo = obj.vnIdCultivo;
            EntCultivoVariedad.vnIdVariedad = obj.vnIdVariedad;
            DataSet dsx = NegCultivoVariedad.ListCultivoVariedad(EntCultivoVariedad);
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
        public object EmbalajeList(EmbalajeBE obj)
        {
            EntEmbalaje.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntEmbalaje.vnIdCultivo = obj.vnIdCultivo;
            EntEmbalaje.VnIdEmbalaje = obj.VnIdEmbalaje;
            DataSet dsx = NegEmbalaje.ListEmbalaje(EntEmbalaje);
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
        public string combocampana(CmbCampanaBE objp)
        { 

            EntCombo.idCampana = objp.idCampana;
            EntCombo.campNombre = objp.campNombre;
            EntCombo.cultivo = objp.cultivo;

            DataSet dsx = NegCampana.ListCampanaBefore(EntCombo);

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

        [WebMethod]
        public object OrdenEmbarqueList(OrdenEmbarqueBE obj)
        {
            EntOrdenEmbarque.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrdenEmbarque.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            EntOrdenEmbarque.vnIdInstruccion = obj.vnIdInstruccion;
            EntOrdenEmbarque.vnIdCampana = obj.vnIdCampana;
            EntOrdenEmbarque.vnIdShipper = obj.vnIdShipper;
            EntOrdenEmbarque.vnIdCultivo = obj.vnIdCultivo;
            DataSet dsx = NegOrdenEmbarque.ListOrdenEmbarque(EntOrdenEmbarque);
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
        public object OrdenEmbarqueRegi(OrdenEmbarqueBE obj, List<CajasOEBE> arrayCoe, List<ObservacionOEBE> arrayObs)
        {
            EntOrdenEmbarque.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrdenEmbarque.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            EntOrdenEmbarque.vnIdInstruccion = obj.vnIdInstruccion;
            EntOrdenEmbarque.vnIdCampana = obj.vnIdCampana;
            EntOrdenEmbarque.vnIdCliente = obj.vnIdCliente;
            EntOrdenEmbarque.vnIdDestino = obj.vnIdDestino;
            EntOrdenEmbarque.vnIdConsignee = obj.vnIdConsignee;
            EntOrdenEmbarque.vnIdNotify = obj.vnIdNotify;
            EntOrdenEmbarque.vnIdNotify2 = obj.vnIdNotify2;
            EntOrdenEmbarque.vcTipoTranporte = obj.vcTipoTranporte;
            EntOrdenEmbarque.vnIdOpLogistico = obj.vnIdOpLogistico;
            EntOrdenEmbarque.vnIdShipper = obj.vnIdShipper;
            EntOrdenEmbarque.vcFechaEmbarque = obj.vcFechaEmbarque;
            EntOrdenEmbarque.vcFlete = obj.vcFlete;
            EntOrdenEmbarque.vcEmisionBL = obj.vcEmisionBL;
            EntOrdenEmbarque.vnIdCultivo = obj.vnIdCultivo;
            EntOrdenEmbarque.vncajas = obj.vncajas;
            EntOrdenEmbarque.vnPesoNeto = obj.vnPesoNeto;
            EntOrdenEmbarque.vnPesoBrutoAprox = obj.vnPesoBrutoAprox;
            EntOrdenEmbarque.vbCertOrigen = obj.vbCertOrigen;
            EntOrdenEmbarque.vbCertFrio = obj.vbCertFrio;
            EntOrdenEmbarque.vbCertFitosanitario = obj.vbCertFitosanitario;
            EntOrdenEmbarque.vbAPPlanta = obj.vbAPPlanta;
            EntOrdenEmbarque.vbAcogeDrawback = obj.vbAcogeDrawback;
            EntOrdenEmbarque.vnIdCultivoTemp = obj.vnIdCultivoTemp;
            EntOrdenEmbarque.vcAtmosferaControlada = obj.vcAtmosferaControlada;

            EntOrdenEmbarque.vcTemperatura = obj.vcTemperatura;
            EntOrdenEmbarque.vcHumedad = obj.vcHumedad;
            EntOrdenEmbarque.vcVentilacion = obj.vcVentilacion;

            EntOrdenEmbarque.vnIdOrdenEmbarqueConsolidado = obj.vnIdOrdenEmbarqueConsolidado;
            EntOrdenEmbarque.vnIdPlanta = obj.vnIdPlanta;
            EntOrdenEmbarque.vnIdLugarSalida = obj.vnIdLugarSalida;
            EntOrdenEmbarque.vcFechaSalida = obj.vcFechaSalida;
            EntOrdenEmbarque.vcFIngresoAlmacen = obj.vcFIngresoAlmacen;
            EntOrdenEmbarque.vcETD = obj.vcETD;
            EntOrdenEmbarque.vcETA = obj.vcETA;
            EntOrdenEmbarque.vnIdVapor = obj.vnIdVapor;
            EntOrdenEmbarque.vcCodeVapor = obj.vcCodeVapor;
            EntOrdenEmbarque.vcCIANaviera = obj.vcCIANaviera;
            EntOrdenEmbarque.vnIdLineaNaviera = obj.vnIdLineaNaviera;
            EntOrdenEmbarque.vcContainer = obj.vcContainer;
            EntOrdenEmbarque.vcSVC = obj.vcSVC;
            EntOrdenEmbarque.vnIdPersonal = obj.vnIdPersonal;
            EntOrdenEmbarque.vcUsuario = GetParamCokkie("cd_user");
            
            int IdOE = NegOrdenEmbarque.RegiOrdenEmbarque(EntOrdenEmbarque);

            foreach (var i in arrayCoe)
            {
                EntCajasOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
                EntCajasOE.vnIdOrdenEmbarque = IdOE;
                EntCajasOE.vnIdCajasOE = i.vnIdCajasOE;
                EntCajasOE.vnIdCultivo = i.vnIdCultivo;
                EntCajasOE.vnIdVariedad = i.vnIdVariedad;
                EntCajasOE.vnIdEmbalaje = i.vnIdEmbalaje;
                EntCajasOE.vnCajas = i.vnCajas;
                EntCajasOE.vbPorConfirmar = i.vbPorConfirmar;
                EntCajasOE.vcUsuario = GetParamCokkie("cd_user");
                DataSet dsy = NegCajasOE.RegiCajasOE(EntCajasOE);
                var dv = dsy.Tables[0];
            }

            foreach (var i in arrayObs)
            {
                EntObservacionOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
                EntObservacionOE.vnIdOrdenEmbarque = IdOE;
                EntObservacionOE.vnIdObservacionOE = i.vnIdObservacionOE;
                EntObservacionOE.vcDescObservacion = i.vcDescObservacion;
                EntObservacionOE.vcUsuario = GetParamCokkie("cd_user");
                DataSet dsy = NegObservacionOE.RegiObservacionOE(EntObservacionOE);
                var dw = dsy.Tables[0];
            }

            return "";
        }

        [WebMethod]
        public object InstruccionRegi(InstruccionEmbarqueBE obj)
        {
            EntInstruccion.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntInstruccion.vnIdInstruccion = obj.vnIdInstruccion;
            EntInstruccion.vnIdCampana = obj.vnIdCampana;
            EntInstruccion.vnIdCliente = obj.vnIdCliente;
            EntInstruccion.vnIdLocalizacion = obj.vnIdLocalizacion;
            EntInstruccion.vnIdConsignee = obj.vnIdConsignee;
            EntInstruccion.vnIdNotify = obj.vnIdNotify;
            EntInstruccion.vnIdNotify2 = obj.vnIdNotify2;
            EntInstruccion.vdFechaIni = Convert.ToDateTime(obj.vcFechaIni);
            EntInstruccion.vdFechaFin = Convert.ToDateTime(obj.vcFechaFin);
            EntInstruccion.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegInstruccion.RegiInstruccionEmbarqueE(EntInstruccion);
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
        public object ProveedorListArray(ConsHispBE obj)
        {
            EntConsHisp.vnId = obj.vnId;
            EntConsHisp.vcNombre = obj.vcNombre;
            return NegConsHisp.ListProveedoresArray(EntConsHisp);
        }

        [WebMethod]
        public object ClienteListArray(ConsHispBE obj)
        {
            EntConsHisp.vnId = obj.vnId;
            EntConsHisp.vcNombre = obj.vcNombre;
            return NegConsHisp.ClienteListArray(EntConsHisp);
        }

        [WebMethod]
        public object ListContactosClientes(ConsHispBE obj)
        {
            EntConsHisp.vnId = obj.vnId;
            DataSet dsx = NegConsHisp.ListContactosClientes(EntConsHisp);
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
        public object InstruccionEmbarqueDelete(InstruccionEmbarqueBE obj)
        {
            EntInstruccion.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntInstruccion.vnIdInstruccion = obj.vnIdInstruccion;
            EntInstruccion.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegInstruccion.InstruccionEmbarqueDelete(EntInstruccion);
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
        public object InstruccionList(InstruccionEmbarqueBE obj)
        {
            EntInstruccion.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntInstruccion.vnIdInstruccion = obj.vnIdInstruccion;
            EntInstruccion.vnIdCampana = obj.vnIdCampana;
            EntInstruccion.vnIdCliente = obj.vnIdCliente;
            EntInstruccion.vnIdLocalizacion = obj.vnIdLocalizacion;
            EntInstruccion.vnIdConsignee = obj.vnIdConsignee;
            EntInstruccion.vnIdNotify = obj.vnIdNotify;
            EntInstruccion.vnIdNotify2 = obj.vnIdNotify2;
            DataSet dsx = NegInstruccion.InstruccionEmbarqueList(EntInstruccion);
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
        public object ObservacionOERegi(ObservacionOEBE obj)
        {
            EntObservacionOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntObservacionOE.vnIdObservacionOE = obj.vnIdObservacionOE;
            EntObservacionOE.vcDescObservacion = obj.vcDescObservacion;
            EntObservacionOE.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegObservacionOE.RegiObservacionOE(EntObservacionOE);
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
        public object ObservacionOEDelete(ObservacionOEBE obj)
        {
            EntObservacionOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntObservacionOE.vnIdObservacionOE = obj.vnIdObservacionOE;
            EntObservacionOE.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegObservacionOE.ObservacionOEDelete(EntObservacionOE);
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
        public object ObservacionOEList(ObservacionOEBE obj)
        {
            EntObservacionOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntObservacionOE.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            EntObservacionOE.vnIdObservacionOE = obj.vnIdObservacionOE;
            EntObservacionOE.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegObservacionOE.ObservacionOEList(EntObservacionOE);
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
        public object CajasOERegi(CajasOEBE obj)
        {
            EntCajasOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntCajasOE.vnIdCajasOE = obj.vnIdCajasOE;
            EntCajasOE.vnIdCultivo = obj.vnIdCultivo;
            EntCajasOE.vnIdVariedad = obj.vnIdVariedad;
            EntCajasOE.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntCajasOE.vnCajas = obj.vnCajas;
            EntCajasOE.vbPorConfirmar = obj.vbPorConfirmar;
            EntCajasOE.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegCajasOE.RegiCajasOE(EntCajasOE);
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
        public object CajasOEList(CajasOEBE obj)
        {
            EntCajasOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntCajasOE.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;
            EntCajasOE.vnIdCajasOE = obj.vnIdCajasOE;
            EntCajasOE.vnIdCultivo = obj.vnIdCultivo;
            EntCajasOE.vnIdVariedad = obj.vnIdVariedad;
            EntCajasOE.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntCajasOE.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegCajasOE.CajasOEList(EntCajasOE);
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
        public object CajasOEDelete(CajasOEBE obj)
        {
            EntCajasOE.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntCajasOE.vnIdCajasOE = obj.vnIdCajasOE;
            EntCajasOE.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegCajasOE.CajasOEDelete(EntCajasOE);
            DataTable dt = dsx.Tables[0];

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;
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
        public object OrdenEmbarqueEdit_CargarSelect(PlantaBE entidad)
        {
            entidad.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(entidad.vcIdEmpresa));
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;

            DataSet dsx = new DataSet();
            DataTable dt;

            List<object> res = new List<object>();

            switch (entidad.vcNota)
            {
                case "Planta":
                    entidad.vnIdPlanta = 0;
                    PlantaBL plantaBL = new PlantaBL();
                    dsx = plantaBL.ListPlanta(entidad);
                    if (dsx.Tables.Count > 0)
                    {
                        dt = dsx.Tables[0];
                        foreach (DataRow item in dt.Rows)
                        {
                            res.Add(new {
                                codigo = (int)item.ItemArray[0],
                                descripcion = (string)item.ItemArray[1],
                            });
                        }
                    }
                    break;
                case "Vapor":
                    NavioBE ent_Navio = new NavioBE();
                    ent_Navio.vnIdEmpresa = entidad.vnIdEmpresa;
                    ent_Navio.vnIdNavio = 0;

                    NavioBL ln = new NavioBL();
                    dsx = ln.ListNavio(ent_Navio);
                    if (dsx.Tables.Count > 0)
                    {
                        dt = dsx.Tables[0];
                        foreach (DataRow item in dt.Rows)
                        {
                            res.Add(new
                            {
                                codigo = (int)item.ItemArray[0],
                                descripcion = (string)item.ItemArray[1],
                            });
                        }
                    }
                    break;
                case "Cia":
                    ParametroGeneralBE ent_CIA = new ParametroGeneralBE();
                    ent_CIA.vcCodigo = "";
                    ent_CIA.vcCodigoMaster = "10";

                    ParametroGeneralBL ln_CIA = new ParametroGeneralBL();
                    dsx = ln_CIA.ListParametroGeneral(ent_CIA);

                    if (dsx.Tables.Count > 0)
                    {
                        dt = dsx.Tables[0];
                        foreach (DataRow item in dt.Rows)
                        {
                            res.Add(new
                            {
                                codigo = (string)item.ItemArray[0],
                                descripcion = (string)item.ItemArray[2],
                            });
                        }
                    }
                    break;
                case "Lineanaviera":
                    LineaNavieraBE ent_LineaNaviera = new LineaNavieraBE();
                    ent_LineaNaviera.vnIdEmpresa = entidad.vnIdEmpresa;
                    ent_LineaNaviera.vnIdLineaNaviera = 0;

                    LineaNavieraBL ln_LineaNaviera = new LineaNavieraBL();
                    dsx = ln_LineaNaviera.ListLineaNaviera(ent_LineaNaviera);

                    if (dsx.Tables.Count > 0)
                    {
                        dt = dsx.Tables[0];
                        foreach (DataRow item in dt.Rows)
                        {
                            res.Add(new
                            {
                                codigo = (int)item.ItemArray[0],
                                descripcion = (string)item.ItemArray[1],
                            });
                        }
                    }
                    break;
            }

            return serializer.Serialize(res);
        }

        [WebMethod]
        public object OrdenEmbarqueEdit_Planta(PlantaBE obj)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;
            obj.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));

            PlantaBE res = new PlantaBE();
            DataSet dsx = new DataSet();
            DataTable dt;

            PlantaBL ln = new PlantaBL();
            obj.vnIdPlanta = obj.nId;

            if (obj.nTipo == 1)
            {
                dsx = ln.Insertar(obj);
            }
            else if (obj.nTipo == 3)
            {
                dsx = ln.Actualizar(obj);
            }
            else if (obj.nTipo == 5)
            {
                if (obj.vnIdPlanta != 0)
                {
                    dsx = ln.OneById(obj);
                }
            }

            if (dsx.Tables.Count > 0)
            {
                dt = dsx.Tables[0];
                foreach (DataRow item in dt.Rows)
                {
                    res.vnIdPlanta = (int)item.ItemArray[0];
                    res.vnIdEmpresa = (int)item.ItemArray[1];
                    res.vcDescripcion = (string)item.ItemArray[2];
                    res.vcDireccion = (string)item.ItemArray[3];
                    res.vcContacto = (string)item.ItemArray[4];
                    res.vcContactoMovil = (string)item.ItemArray[5];
                    res.vcNota = (string)item.ItemArray[6];
                }
            }

            return serializer.Serialize(res);
        }

        [WebMethod]
        public object OrdenEmbarqueEdit_Vapor(NavioBE obj)
        {
            //Navio
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;
            obj.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));

            NavioBE res = new NavioBE();
            DataSet dsx = new DataSet();
            DataTable dt;

            NavioBL ln = new NavioBL();
            obj.vnIdNavio = obj.nId;
            

            if (obj.nTipo == 1)
            {
                dsx = ln.Insertar(obj);
            }
            else if (obj.nTipo == 3)
            {
                dsx = ln.Actualizar(obj);
            }
            else if (obj.nTipo == 5)
            {
                if (obj.vnIdNavio != 0)
                {
                    dsx = ln.OneById(obj);
                }
            }

            if (dsx.Tables.Count > 0)
            {
                dt = dsx.Tables[0];
                foreach (DataRow item in dt.Rows)
                {
                    res.vnIdEmpresa = (int)item.ItemArray[0];
                    res.vnIdNavio = (int)item.ItemArray[1];
                    res.vcDescripcion = (string)item.ItemArray[2];
                }
            }

            return serializer.Serialize(res);
        }

        [WebMethod]
        public object OrdenEmbarqueEdit_Cia(ParametroGeneralBE obj)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;

            ParametroGeneralBE res = new ParametroGeneralBE();
            DataSet dsx = new DataSet();
            DataTable dt;

            ParametroGeneralBL ln = new ParametroGeneralBL();
            obj.vcCodigo = obj.nId;

            if (obj.nTipo == 1)
            {
                dsx = ln.Insertar(obj);
            }
            else if (obj.nTipo == 3)
            {
                dsx = ln.Actualizar(obj);
            }
            else if (obj.nTipo == 5)
            {
                if (obj.vcCodigo.Trim() != string.Empty)
                {
                    dsx = ln.OneById(obj);
                }
            }

            if (dsx.Tables.Count > 0)
            {
                dt = dsx.Tables[0];
                foreach (DataRow item in dt.Rows)
                {
                    res.vcCodigo = (string)item.ItemArray[0];
                    res.vcDescripcion = (string)item.ItemArray[2];
                    //res.vbEstado = (bool)item.ItemArray[4];
                }
            }

            return serializer.Serialize(res);
        }

        [WebMethod]
        public object OrdenEmbarqueEdit_Lineanaviera(LineaNavieraBE obj)
        {
            obj.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = int.MaxValue;

            LineaNavieraBE res = new LineaNavieraBE();
            DataSet dsx = new DataSet();
            DataTable dt;

            LineaNavieraBL ln = new LineaNavieraBL();
            obj.vnIdLineaNaviera = obj.nId;

            if (obj.nTipo == 1)
            {
                dsx = ln.Insertar(obj);
            }
            else if (obj.nTipo == 3)
            {
                dsx = ln.Actualizar(obj);
            }
            else if (obj.nTipo == 5)
            {
                if (obj.vnIdLineaNaviera != 0)
                {
                    dsx = ln.OneById(obj);
                }
            }

            if (dsx.Tables.Count>0)
            {
                dt = dsx.Tables[0];
                foreach (DataRow item in dt.Rows)
                {
                    res.cDescLineaNaviera = (string)item.ItemArray[2];
                    res.vbEstado = (bool)item.ItemArray[3];
                    res.vnIdLineaNaviera = (int)item.ItemArray[1];
                    res.vnIdEmpresa = (int)item.ItemArray[0];
                }
            }

            return serializer.Serialize(res);
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }
    }
}
