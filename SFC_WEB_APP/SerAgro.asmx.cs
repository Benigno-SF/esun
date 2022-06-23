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
using System.Xml;
using System.Xml.Linq;

namespace SFC_WEB_APP
{
    public class aaaaaaa 
    {
        public string idpiscina { get; set; }
        public string finicio { get; set; }
        public string ffin { get; set; }
    }


    /// <summary>
    /// Descripción breve de SerAgro
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerAgro : System.Web.Services.WebService
    {
        FundoBE EntFund = new FundoBE();
        FundoBL NegFund = new FundoBL();

        TrackBE EntTrac = new TrackBE();
        TrackBL NegTrac = new TrackBL();

        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();

        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        GuiaBE EntGuia = new GuiaBE();
        GuiaBL NegGuia = new GuiaBL();

        ConsNisiraBE EntConsNisira = new ConsNisiraBE();
        ConsNisiraBL NegConsNisira = new ConsNisiraBL();

        ConsHispBE EntHispatec = new ConsHispBE();
        ConsHispBL NegHispatec = new ConsHispBL();

        UtilBL negUtil = new UtilBL();

        // instanciamos  listar combinaciones
        Combinaciones_TareoBE EntCombTareo = new Combinaciones_TareoBE();
        Combinaciones_TareoBL NegCombTareo = new Combinaciones_TareoBL();

        [WebMethod]
        public object RepTrazabilidadExportacion(ConsNisiraBE obj)
        {
            EntHispatec.vcIdEmpresa = obj.vcIdEmpresa;
            EntHispatec.vcFecha = obj.vcFecha;
            EntHispatec.vcFechaFin = obj.vcFechaFin;
            DataSet dsx = NegHispatec.ListTrazabilidadExportacion(EntHispatec);
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
        public object RegiTareoJornal(ConsNisiraBE obj, List<ConsNisiraBE> arrayTaa)
        {
            DataTable dtx = new DataTable();
            dtx.Columns.Add("cCodigo", typeof(string));
            dtx.Columns.Add("cNombres", typeof(string));
            dtx.Columns.Add("nCantidad", typeof(string));
            dtx.Columns.Add("nDia1", typeof(string));
            dtx.Columns.Add("nDia2", typeof(string));
            dtx.Columns.Add("nDia3", typeof(string));
            dtx.Columns.Add("nDia4", typeof(string));
            dtx.Columns.Add("nDia5", typeof(string));
            dtx.Columns.Add("nDia6", typeof(string));
            dtx.Columns.Add("nDia7", typeof(string));
            dtx.Columns.Add("cObservacion", typeof(string));
            dtx.Columns.Add("cIdConcepto", typeof(string));
            dtx.Columns.Add("nBasico", typeof(string));
            dtx.Columns.Add("nMonto", typeof(string));
            foreach (var item in arrayTaa)
            {
                string d1;
                string d2;
                string d3;
                string d4;
                string d5;
                string d6;
                string d7;
                string basic;
                if (item.nDia1 == "") { d1 = "0"; } else { d1 = item.nDia1; }
                if (item.nDia2 == "") { d2 = "0"; } else { d2 = item.nDia2;}
                if (item.nDia3 == "") { d3 = "0"; } else { d3 = item.nDia3;}
                if (item.nDia4 == "") { d4 = "0"; } else { d4 = item.nDia4;}
                if (item.nDia5 == "") { d5 = "0"; } else { d5 = item.nDia5;}
                if (item.nDia6 == "") { d6 = "0"; } else { d6 = item.nDia6;}
                if (item.nDia7 == "") { d7 = "0"; } else { d7 = item.nDia7;}
                if (item.nBasico == "") { basic = "0"; } else { basic = item.nBasico; }
                var rowd = dtx.NewRow();
                rowd["cCodigo"] = item.cCodigo;
                rowd["cNombres"] = item.cNombres;
                rowd["nCantidad"] = item.nCantidad;
                rowd["nDia1"] = d1;
                rowd["nDia2"] = d2;
                rowd["nDia3"] = d3;
                rowd["nDia4"] = d4;
                rowd["nDia5"] = d5;
                rowd["nDia6"] = d6;
                rowd["nDia7"] = d7;
                rowd["cObservacion"] = item.cObservacion;
                rowd["cIdConcepto"] = item.cIdConcepto;
                rowd["nBasico"] = basic;
                rowd["nMonto"] = item.nMonto;
                dtx.Rows.Add(rowd);
            }

            EntNisira.vcPeriodo = obj.vcPeriodo;
            EntNisira.vcSemana = obj.vcSemana;
            EntNisira.vcValor = obj.vcValor;
            EntNisira.vnIdPlanilla = obj.vnIdPlanilla;
            DataSet ds = NegNisira.RegiTareoJornal(EntNisira, dtx);
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
        public object SyncTareasAdicionales(ConsNisiraBE obj)
        {
            EntNisira.vcPeriodo = obj.vcPeriodo;
            EntNisira.vcSemana = obj.vcSemana;
            EntNisira.vcIdFundo = obj.vcIdFundo;
            EntNisira.vnIdPlanilla = obj.vnIdPlanilla;
            EntNisira.vcIdConcepto = obj.vcIdConcepto;
            EntNisira.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegNisira.SyncTareasAdicionales(EntNisira);
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
        public object ListTareoAdicional(ConsNisiraBE obj)
        {
            EntNisira.vcPeriodo = obj.vcPeriodo;
            EntNisira.vcSemana = obj.vcSemana;
            EntNisira.vcValor = obj.vcValor;
            EntNisira.vnIdPlanilla = obj.vnIdPlanilla;
            DataSet ds = NegNisira.ListTareoAdicional(EntNisira);
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
        public object ListTareoJornal(ConsNisiraBE obj)
        {
            EntNisira.vcPeriodo = obj.vcPeriodo;
            EntNisira.vcSemana = obj.vcSemana;
            EntNisira.vcValor = obj.vcValor;
            EntNisira.vnIdPlanilla = obj.vnIdPlanilla;
            DataSet dsx = NegNisira.ListTareoJornal(EntNisira);
            DataTable dt = dsx.Tables[0];
            DataTable dv = dsx.Tables[1];
            DataTable dw = dsx.Tables[2];
            DataTable dx = dsx.Tables[3];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow de in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, de[col]);
                }
                rows.Add(row);
            }

            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;
            foreach (DataRow df in dv.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dv.Columns)
                {
                    row2.Add(col.ColumnName, df[col]);
                }
                rows2.Add(row2);
            }

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;
            foreach (DataRow dg in dw.Rows)
            {
                row3 = new Dictionary<string, object>();
                foreach (DataColumn col in dw.Columns)
                {
                    row3.Add(col.ColumnName, dg[col]);
                }
                rows3.Add(row3);
            }

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;
            foreach (DataRow dh in dx.Rows)
            {
                row4 = new Dictionary<string, object>();
                foreach (DataColumn col in dx.Columns)
                {
                    row4.Add(col.ColumnName, dh[col]);
                }
                rows4.Add(row4);
            }


            var data = new
            {
                d1 = rows,
                d2 = rows2,
                d3 = rows3,
                d4 = rows4
            };

            return serializer.Serialize(data);
        }
        
        [WebMethod]
        public object ListSemana(ConsNisiraBE obj)
        {
            EntNisira.vnIdEmpresa = 1;
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = obj.vcAnio;
            EntNisira.vcPeriodo = obj.vcPeriodo;
            EntNisira.vcSemana = "";
            EntNisira.vcType = "SS";

            DataSet ds = NegNisira.ListPeriodo(EntNisira);
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
        public object Guia_ActualizaPeso(GuiaBE obj)
        {
            EntGuia.vcidingresosalidaalm = obj.vcidingresosalidaalm;
            EntGuia.vcidconsumidor = obj.vcidconsumidor;
            EntGuia.vcpeso = obj.vcpeso;
            EntGuia.vciddocumento = obj.vciddocumento;
            DataSet ds = NegGuia.Guia_ActualizaPeso(EntGuia);
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
        public object ListGuiasParaTranferencia(GuiaBE obj)
        {
            EntGuia.vcfecha = obj.vcfecha;
            DataSet ds = NegGuia.ListGuiasParaTranferencia(EntGuia);
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
        public object XmlCostosDistribuidos(ConsNisiraBE obj)
        {

            string XMLCC1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData>";
            string XMLCC2 = "";
            string[] arrayXMLCC = obj.vcXMLCC.Split(',');
            foreach (var i in arrayXMLCC)
            {
                string detarray = "<tmpcc><idcuenta>" + i + "</idcuenta></tmpcc>";
                XMLCC2 += detarray;
            }
            string XMLCC3 = "</VFPData>";
            string XMLCC = XMLCC1 + XMLCC2 + XMLCC3;



            string XMLCCO1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData/>";
            string XMLCCO = XMLCCO1;


            string XMLPC1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData>" ;
            string XMLPC2 = "";
            string[] arrayXMLPC = obj.vcXMLPC.Split(',');
            foreach (var i in arrayXMLPC)
            {
                string detarray = "<tmppc><idcuenta>" + i + "</idcuenta></tmppc>";
                XMLPC2 += detarray;
            }
            string XMLPC3 = "</VFPData>";
            string XMLPC = XMLPC1 + XMLPC2 + XMLPC3;

            EntNisira.vcEmpresa = obj.vcEmpresa;
            EntNisira.vcFecha = obj.vcFecha;
            EntNisira.vcFechaFin = obj.vcFechaFin;
            EntNisira.vcXMLCC = XMLCC;
            EntNisira.vcXMLCCO = XMLCCO;
            EntNisira.vcXMLPC = XMLPC;
            EntNisira.vcAGRUP_CC = obj.vcAGRUP_CC;
            EntNisira.vcAGRUP_CTA = obj.vcAGRUP_CTA;
            EntNisira.vcC_TIPO_CC = obj.vcC_TIPO_CC;
            DataSet ds = NegNisira.DETALLE_DISTRIBUCION_COSTOS(EntNisira);
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
        public object XmlCreateGuia(GuiaBE obj, List<GuiaBE> arrayDetail)
        {

            string xmlStringHead = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
              "<VFPData>" +
                "<tmp_cab>" +
                    "<idempresa>" + obj.vcidempresa + "</idempresa>" +
                    "<idingresosalidaalm>" + obj.vcidingresosalidaalm + "</idingresosalidaalm>" +
                    "<idsucursal>" + obj.vcidsucursal + "</idsucursal>" +
                    "<idalmacen>" + obj.vcidalmacen + "</idalmacen>" +
                    "<iddocumento>" + obj.vciddocumento + "</iddocumento>" +
                    "<serie>" + obj.vcserie + "</serie>" +
                    "<numero>" + obj.vcnumero + "</numero>" +
                    "<ventana>" + obj.vcventana + "</ventana>" +
                    "<fecha>" + obj.vcfecha + "</fecha>" +
                    "<idclieprov>" + obj.vcidclieprov + "</idclieprov>" +
                    "<idclieprovdest>" + obj.vcidclieprovdest + "</idclieprovdest>" +
                    "<fechatraslado>" + obj.vcfechatraslado + "</fechatraslado>" +
                    "<idresponsable>" + obj.vcidresponsable + "</idresponsable>" +
                    "<idmoneda>" + obj.vcidmoneda + "</idmoneda>" +
                    "<idmotivo>" + obj.vcidmotivo + "</idmotivo>" +
                    "<idestado>" + obj.vcidestado + "</idestado>" +
                    "<glosa>" + obj.vcglosa + "</glosa>" +
                    "<idtransportista>" + obj.vcidtransportista + "</idtransportista>" +
                    "<dni>" + obj.vcdni + "</dni>" +
                    "<chofer>" + obj.vcchofer + "</chofer>" +
                    "<brevete>" + obj.vcbrevete + "</brevete>" +
                    "<certiftransporte>" + obj.vccertiftransporte + "</certiftransporte>" +
                    "<certiftransporte1>" + obj.vccertiftransporte1 + "</certiftransporte1>" +
                    "<marca>" + obj.vcmarca + "</marca>" +
                    "<marca1>" + obj.vcmarca1 + "</marca1>" +
                    "<placa>" + obj.vcplaca + "</placa>" +
                    "<placa1>" + obj.vcplaca1 + "</placa1>" +
                    "<idmotivo_traslado_sunat>" + obj.vcidmotivo_traslado_sunat + "</idmotivo_traslado_sunat>" +
                    "<idunidadnegocio>" + obj.vcidunidadnegocio + "</idunidadnegocio>" +
                    "<idsubunidadnegocio>" + obj.vcidsubunidadnegocio + "</idsubunidadnegocio>" +
                    "<idubigeopartida> " + obj.vcidubigeopartida + " </idubigeopartida>" +
                    "<peso_total>" + obj.vcpeso_total + "</peso_total>" +
                    "<idmodalidad_transporte>" + obj.vcidmodalidad_transporte + "</idmodalidad_transporte>" +
                    "<nro_bultos>" + obj.vcnro_bultos + "</nro_bultos>" +
                    "<idusuario>" + GetParamCokkie("cd_user") + "</idusuario>" +
                "</tmp_cab>" +
            "</VFPData>";

            string xmlStringDetail = "";

            if (arrayDetail != null && arrayDetail.Count != 0)
            {
                string xmlStringDetail1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData>";
                string xmlStringDetail2 = "";

                foreach (var i in arrayDetail)
                {
                    string detarray = "<tmp_det><item>" + i.vcitem + "</item>" +
                    "<idproducto>" + i.vcidproducto + " </idproducto>" +
                    "<descripcion>" + i.vcdescripcion + "</descripcion>" +
                    "<idmedida>" + i.vcidmedida + "</idmedida>" +
                    "<idactividad/>" +
                    "<idlabor/>" +
                    "<idconsumidor>" + i.vcidconsumidor + "</idconsumidor>" +
                    "<cantidad>" + i.vccantidad + "</cantidad>" +
                    "<precio>" + i.vcprecio + "</precio>" +
                    "<importe>" + i.vcimporte + "</importe>" +
                    "<idlotep/>" +
                    "<observacion>" + i.vcobservacion + " </observacion>" +
                    "<peso>" + i.vcpeso + "</peso></tmp_det>";
                    xmlStringDetail2 += detarray;
                }


                string xmlStringDetail3 = "</VFPData>";

                xmlStringDetail = xmlStringDetail1 + xmlStringDetail2 + xmlStringDetail3;
            }
            else
            {
                xmlStringDetail = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData/>";
            }

            EntGuia.vcXML_CAB = xmlStringHead;
            EntGuia.vcXML_DET = xmlStringDetail;
            EntGuia.vcAccion = obj.vcAccion;
            EntGuia.valida_stock = obj.valida_stock;
            DataSet ds = NegGuia.RegiGuiaRemision(EntGuia);
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
        public object ListParametrosNis(ConsNisiraBE obj)
        {
            EntNisira.vcType = obj.vcType;
            EntNisira.vcId = obj.vcId;
            EntNisira.vnIdc = obj.vnIdc;
            DataSet ds = NegNisira.ListParametrosNis(EntNisira);
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
        public object ListParametrosUsu(ConsNisiraBE obj)
        {
            EntNisira.vcType = obj.vcType;
            EntNisira.vcId = GetParamCokkie("cd_user");
            EntNisira.vnIdc = obj.vnIdc;
            DataSet ds = NegNisira.ListParametrosNis(EntNisira);
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
        public object ListDatNisUser(ConsNisiraBE obj)
        {
            EntNisira.vcType = obj.vcType;
            EntNisira.vcEmpresa = obj.vcEmpresa;
            EntNisira.vcSucursal = GetParamCokkie("cd_user");
            DataSet ds = NegNisira.ListSucursal(EntNisira);
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
        public object PrintGuiaRemision(GuiaBE obj)
        {
            EntGuia.vcidingresosalidaalm = obj.vcidingresosalidaalm;
            EntGuia.vcserie = obj.vcserie;
            EntGuia.vcnumero = obj.vcnumero;
            DataSet ds = NegGuia.PrintGuia(EntGuia);
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
        public object Aprobar_Tareo_Nisira(ConsNisiraBE obj)
        {
            EntNisira.vcPeriodo = obj.vcPeriodo;
            EntNisira.vcSemana = obj.vcSemana;
            EntNisira.vcFecha = obj.vcFecha;
            EntNisira.vcAccion = obj.vcAccion;
            EntNisira.vcId = obj.vcId;
            EntNisira.vcIdConcepto = obj.vcIdConcepto;
            EntNisira.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegNisira.Aprobar_Tareo_Nisira(EntNisira);
            DataTable dt = dsx.Tables[0];
            //DataTable dv = dsx.Tables[1];
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

            //List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            //Dictionary<string, object> row2;
            //foreach (DataRow ds in dv.Rows)
            //{
            //    row2 = new Dictionary<string, object>();
            //    foreach (DataColumn col in dv.Columns)
            //    {
            //        row2.Add(col.ColumnName, ds[col]);
            //    }
            //    rows2.Add(row2);
            //}
            //var data = new
            //{
            //    dh = rows,
            //    dd = rows2
            //};
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object ListAplicacion(ConsHispBE obj)
        {
            EntHisp.vcAccion = obj.vcAccion;
            EntHisp.vcTipoDato = obj.vcTipoDato;
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            EntHisp.vcCodigo = obj.vcCodigo;
            DataSet ds = NegHisp.ListAplicacion(EntHisp);
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
        public object ListRiego(ConsHispBE obj)
        {
            EntHisp.vcTipoDato = obj.vcTipoDato;
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcFechaFin = obj.vcFechaFin;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            EntHisp.vcCodigo = obj.vcCodigo;
            EntHisp.vcRiegoPor = obj.vcRiegoPor;
            DataSet ds = NegHisp.ListRiego(EntHisp);
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

        //
        [WebMethod]
        public int FinalizarPartesCampo(ConsHispBE obj) {
            return NegHisp.FinalizarPartesCampo(obj);
        }
        //
        [WebMethod]
        public object InfPartCampActSimple(ConsHispBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegHisp.InfPartCampActSimple(EntHisp);
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
        public object ListVisualizaTareo(ConsNisiraBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegHisp.InfPartCampActSimple(EntHisp);
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
        public object ListTrack(TrackBE obj)
        {
            EntTrac.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntTrac.vnIdDispositivo = obj.vnIdDispositivo;
            EntTrac.vnTiempo = obj.vnTiempo;
            DataSet ds = NegTrac.ListTrack(EntTrac);
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
        public object ListTrackView(TrackBE obj)
        {
            EntTrac.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntTrac.vcIdSucursal = obj.vcIdSucursal;
            EntTrac.vnIdDispositivo = obj.vnIdDispositivo;
            EntTrac.vcFechaIni = obj.vcFechaIni;
            EntTrac.vcFechaFin = obj.vcFechaFin;
            DataSet ds = NegTrac.ListTrackView(EntTrac);
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
        public object ListFundo(FundoBE obj)
        {
            EntFund.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            DataSet ds = NegFund.ListFundo(EntFund);
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
        public List<object> PiscinasFuncionando(int[] objs)
        {
            List<object> rpta = new List<object>();
            foreach (var item in objs)
            {
                rpta.Add(GetPiscina(item));
            }
            return rpta;
        }

        
        public object GetPiscina(int id)
        {
            PiscinaBL piscinaBL = new PiscinaBL();

            DataSet ds = piscinaBL.Leer(id);
            DataTable dt = ds.Tables[0];

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    if (col.ColumnName == "dFhregistro")
                    {
                        string f = dr[col].ToString();
                        row.Add(col.ColumnName, f);
                    }
                    else
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object ReportePorPiscina(int nIdPiscina, string dFechaInicio, string dFechaFin) 
        {
            int res = 0;
            decimal total_entrada = 0;
            decimal total_salida = 0;
            DateTime dateTime = new DateTime();
            List<object> registros = new List<object>();
            JavaScriptSerializer serializer = new JavaScriptSerializer();

            try
            {
                DateTime ddFechaInicio = DateTime.ParseExact(dFechaInicio, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
                DateTime ddFechaFin = DateTime.ParseExact(dFechaFin, "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);

                PiscinaRegBL piscinaRegBL = new PiscinaRegBL();

                DataSet ds = piscinaRegBL.ListadoEntreFechas(ddFechaInicio, ddFechaFin, nIdPiscina);
                DataTable dt = ds.Tables[0];

                int contador = 0;

                foreach (DataRow dr in dt.Rows)
                {
                    if ((++contador).Equals(1))
                    {
                        total_entrada += Convert.ToDecimal(dr.ItemArray[3]);
                        total_salida += Convert.ToDecimal(dr.ItemArray[4]);
                    }
                    else
                    {
                        total_entrada += Convert.ToDecimal(dr.ItemArray[3]) * Convert.ToDecimal(((DateTime)dr.ItemArray[2] - dateTime).TotalSeconds);
                        total_salida += Convert.ToDecimal(dr.ItemArray[4]) * Convert.ToDecimal(((DateTime)dr.ItemArray[2] - dateTime).TotalSeconds);
                    }
                    dateTime = (DateTime)dr.ItemArray[2];

                    registros.Add(new { fh = dr.ItemArray[2].ToString(), qe = dr.ItemArray[3].ToString(), qs = dr.ItemArray[4].ToString() });
                }
                res = 1;
            }
            catch (Exception)
            {
                
            }

            var respuesta = new {
                rs = res,
                te = total_entrada.ToString(),
                ts = total_salida.ToString(),
                re = registros
            };

            return serializer.Serialize(respuesta);
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

        // funcioj listra combinaciones
        [WebMethod]
        public object SER_listar_combinaciones(Combinaciones_TareoBE obj)
        {
            // receptionamos las varaiables.
            EntCombTareo.ID_EMPRESA_COM_LIST = obj.ID_EMPRESA_COM_LIST;
            EntCombTareo.BD_COM_LIST = obj.BD_COM_LIST;
            EntCombTareo.TIPO_COM_LIST = obj.TIPO_COM_LIST;

            DataSet dsx = NegCombTareo.BL_listar_combinaciones(EntCombTareo);
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
