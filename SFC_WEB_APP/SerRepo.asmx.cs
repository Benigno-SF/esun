using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using SFC_BE;
using SFC_BL;
using System.IO;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Microsoft.Ajax.Utilities;
using System.Xml;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerRepo
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [ScriptService]
    public class SerRepo : System.Web.Services.WebService
    {
        ConsExternaBE EntCons = new ConsExternaBE();
        ConsExternaBL NegCons = new ConsExternaBL();

        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();

        RendimientoProcesoRegistroBE EntRendPack = new RendimientoProcesoRegistroBE();
        RendimientoProcesoRegistroBL NegRendPack = new RendimientoProcesoRegistroBL();

        FichaPersonalBE EntFichaPersonal = new FichaPersonalBE();
        FichaPersonalBL NegFichaPersonal = new FichaPersonalBL();

        OrdenEmbarqueBE EntOrdenEmb = new OrdenEmbarqueBE();
        OrdenEmbarqueBL NegOrdenEmb = new OrdenEmbarqueBL();

        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public List<string> RepUtilidad(string ConsNisiraBE)
        {
            //Ruta
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepUtilidad";// + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";

            EntNisira.vcIdEmpresa = "001";
            EntNisira.vcAmbito = "OBR";
            EntNisira.vcPeriodo = "202104";
            EntNisira.vcSemana = "16";
            EntNisira.vcCodigo = ConsNisiraBE;//EntNisira.vcCodigo;

            DataSet ds = NegNisira.RepUtilidad(EntNisira);

            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lstRtrn.Add("1");
                lstRtrn.Add(NoXml);
            }
            else
            {
                lstRtrn.Add("0");
            }

            return lstRtrn;
        }

        [WebMethod]
        public List<string> RepOrdenEmbarque(OrdenEmbarqueBE obj)
        {
            //Ruta
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepOrdenEmbarque";// + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";

            EntOrdenEmb.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrdenEmb.vnIdOrdenEmbarque = obj.vnIdOrdenEmbarque;

            DataSet ds = NegOrdenEmb.RepOrdenEmbarque(EntOrdenEmb);

            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            if (ds.Tables[3].Rows.Count > 0)
            {
                lstRtrn.Add("1");
                lstRtrn.Add(NoXml);
            }
            else
            {
                lstRtrn.Add("0");
            }

            return lstRtrn;
        }

        [WebMethod]
        public List<string> RepFicha(FichaPersonalBE obj)
        {
            //Ruta
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepFichaC19";// + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";
            EntFichaPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFichaPersonal.vnIdPersonal = obj.vnIdPersonal;
            DataSet ds = NegFichaPersonal.RepFichaPersonal(EntFichaPersonal);

            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            if (ds.Tables[3].Rows.Count > 0)
            {
                lstRtrn.Add("1");
                lstRtrn.Add(NoXml);
            }
            else
            {
                lstRtrn.Add("0");
            }

            return lstRtrn;
        }

        [WebMethod]
        public List<string> RepReparaciones(string vcCodigo)
        {
            //Ruta
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepReaparaciones";// + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";
            EntFichaPersonal.vcCodigoNisira = vcCodigo;
            DataSet ds = NegFichaPersonal.ReporteReparaciones(EntFichaPersonal);

            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            if (ds.Tables[4].Rows.Count > 0)
            {
                lstRtrn.Add("1");
                lstRtrn.Add(NoXml);
            }
            else
            {
                lstRtrn.Add("0");
            }

            return lstRtrn;
        }

        [WebMethod]
        public List<string> XmlCreateCPF(ConsHispBE obj)
        {
            //Ruta
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/tempXml");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "palet" + obj.numpalet;
            string DiXml = ruta + "/" + NoXml + ".xml";


            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;
            //settings.IndentChars = ("    ");
            settings.CloseOutput = true;
           // settings.OmitXmlDeclaration = true;
            using (XmlWriter writer = XmlWriter.Create(DiXml, settings))
            {
                writer.WriteStartElement("Importacion");
                    writer.WriteElementString("Nombre", obj.PaleNombre);
                    writer.WriteElementString("Fecha", obj.Fecha);
                    writer.WriteElementString("Hora", obj.Hora);
                        writer.WriteStartElement("Trabajo");
                        writer.WriteElementString("SerieParteProduccion", "");
                        writer.WriteElementString("NumeroParteProduccion", obj.PARTPROD);
                        writer.WriteStartElement("DatosComplementarios");
                            writer.WriteStartElement("DatoComplementarioValor");
                                writer.WriteElementString("DatoComplementario", obj.DatoComp1);
                                writer.WriteElementString("Valor", obj.Situacion);
                            writer.WriteEndElement();
                            writer.WriteStartElement("DatoComplementarioValor");
                                writer.WriteElementString("DatoComplementario", obj.CodeComp2);
                                writer.WriteElementString("Valor", obj.DatoComp2);
                            writer.WriteEndElement();
                        writer.WriteEndElement();
                    writer.WriteElementString("LineaProduccion", obj.Linea_Prod);
                    writer.WriteElementString("CodigoDeBarras", obj.Codigo_Barras);
                        writer.WriteStartElement("Detalle");
                            writer.WriteStartElement("Linea");
                                writer.WriteElementString("Articulo", obj.Articulo);
                                writer.WriteElementString("Pale", obj.Pale);
                                writer.WriteElementString("Envase", obj.Envase);
                                writer.WriteElementString("CantidadEnvases", obj.CantidadEnvases);
                                    writer.WriteStartElement("DatosOrigen");
                                        writer.WriteStartElement("PartidaOrigen");
                                            writer.WriteElementString("PartidaSerie", obj.Part_serie);
                                            writer.WriteElementString("PartidaNumero", obj.Part_Num);
                                            writer.WriteElementString("CantidadOrigen", "");
                                        writer.WriteEndElement();
                                    writer.WriteEndElement();
                             writer.WriteEndElement();
                        writer.WriteEndElement();
                writer.WriteEndElement();
                writer.Flush();
            }

            return lstRtrn;
        }

        [WebMethod]
        public List<string> ReporteRendimiento(RendimientoPackingBE obj) {
            //Ruta
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepRendimientoPack" + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";


            EntRendPack.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntRendPack.vnIdArea = obj.vnIdArea;
            EntRendPack.vnIdGrupo = obj.vnIdGrupo;
            EntRendPack.vcLabor = obj.vcLabor;
            EntRendPack.vnIdEmbalaje = obj.vnIdEmbalaje;
            EntRendPack.vcFecha = obj.vcFecha;
            //EntRendPack.vnCaj1Meta = obj.vnCaj1Meta;
            //EntRendPack.vnPre1Meta = obj.vnPre1Meta;
            /*EntRendPack.vnCaj2Meta = obj.vnCaj2Meta;
            EntRendPack.vnPre2Meta = obj.vnPre2Meta;*/
            //EntRendPack.vnCastigo = obj.vnCastigo;
            EntRendPack.vcHora = obj.vcHora;
            DataSet ds = NegRendPack.ReporteRendimiento(EntRendPack);


            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            if (ds.Tables[2].Rows.Count > 0) {
                lstRtrn.Add("1");
                lstRtrn.Add(NoXml);
            }
            else {
                lstRtrn.Add("0");
            }
            
            return lstRtrn;
        }
        

        [WebMethod]
        public List<string> BoleReport(string CdEmpr, string vcPeriodo, string vcSemana, string vcPeriodo2, string vcSemana2, string vcCodigo, int CaPrint, int IdDisp)
        {
            //Lista de Retorno
            List<string> lstRtrn = new List<string>();
            //Repo
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepBoleta" + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";
            //Datos
            EntCons.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(CdEmpr));
            EntCons.vnSistema = 1;
            EntCons.vcPeriodo = vcPeriodo;
            EntCons.vcSemana = vcSemana;
            EntCons.vcPeriodo2 = vcPeriodo2;
            EntCons.vcSemana2 = vcSemana2;
            EntCons.vcCodigo = vcCodigo;
            EntCons.vcUsuario = GetParamCokkie("cd_user");
            DataSet ds = NegCons.RepoBoleta(EntCons);
            if (ds.Tables[1].Rows.Count > 0 && ds.Tables[3].Rows.Count > 0)
            {
                lstRtrn.Add(ds.Tables["EVAL"].Rows[0]["bReImpr"].ToString());
                lstRtrn.Add(ds.Tables["EVAL"].Rows[0]["dFecha"].ToString());
                lstRtrn.Add(ds.Tables[1].Rows[0]["APE_NOMB"].ToString());
                lstRtrn.Add("ok");
                lstRtrn.Add(NoXml);
            }
            else {
                lstRtrn.Add("");
                lstRtrn.Add("");
                lstRtrn.Add("");
                lstRtrn.Add("error");
                lstRtrn.Add("");
            }
            if (IdDisp > 0)
            {
                ReportDocument crt = new ReportDocument();
                crt.Load(Server.MapPath("~/Mod_Repo/reports/" + "Crt_BoletaTick.rpt"));
                crt.SetDataSource(ds);
                EntDisp.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(CdEmpr));
                EntDisp.vnIdDispositivo  = IdDisp;
                EntDisp.vcTipo = "TRBO";
                DataSet dsImp = NegDisp.ListDispositivos(EntDisp);
                System.Drawing.Printing.PrinterSettings printerSettings = new System.Drawing.Printing.PrinterSettings();
                printerSettings.PrinterName = dsImp.Tables[0].Rows[0]["cNombre"].ToString();
                for (int x = 0; x < CaPrint; x++)
                    crt.PrintToPrinter(printerSettings, new System.Drawing.Printing.PageSettings(), false);
                //crt.PrintOptions.PrinterName = dsImp.Tables[0].Rows[0]["cNombre"].ToString();
                //for (int x = 0; x < CaPrint; x++)
                //    crt.PrintToPrinter(1, true, 0, 0);
                crt.Close();
                crt.Dispose();
                GC.Collect();
            }
            else {
                ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            }
            return lstRtrn;
        }
        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }


        //Reporte de Stock relacionado a NISIRA e HISPATEC
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object ReporteStock(ReporteSotcksBE parm)
        {
            ReporteSotcksBL reporteSotcksBL = new ReporteSotcksBL();

            DataSet dsStockNisira = reporteSotcksBL.ReporteStockNisira(parm);
            DataSet dsReferenciaNISIRAHISPATEC = reporteSotcksBL.ReferenciaNISIRAHISPATEC(parm);
            DataSet dsStockHispatec = reporteSotcksBL.ReporteStockHipatec(parm);

            List<ReporteSotcksComparativoBE> li = new List<ReporteSotcksComparativoBE>();

            foreach (DataRow dr_H in dsStockHispatec.Tables[0].Rows)
            {
                string codigoproducto_hispatec = dr_H.ItemArray[4].ToString();

                ReporteSotcksComparativoBE reporteSotcksComparativoBE = new ReporteSotcksComparativoBE();
                reporteSotcksComparativoBE.Codigo1 = codigoproducto_hispatec;
                reporteSotcksComparativoBE.Stock1 = dr_H.ItemArray[13].ToString();
                reporteSotcksComparativoBE.Nombre1 = dr_H.ItemArray[6].ToString();
                reporteSotcksComparativoBE.UnidadMedida1 = dr_H.ItemArray[23].ToString();

                foreach (DataRow dr_Equivalencias in dsReferenciaNISIRAHISPATEC.Tables[0].Rows)
                {
                    if (dr_Equivalencias.ItemArray[3].ToString() == codigoproducto_hispatec)
                    {
                        string cod_nisira = string.Empty;
                        string cod_nisira1 = dr_Equivalencias.ItemArray[0].ToString();
                        string cod_nisira2 = dr_Equivalencias.ItemArray[1].ToString();
                        string cod_nisira3 = dr_Equivalencias.ItemArray[2].ToString();

                        if (cod_nisira1.Trim() != "" && cod_nisira1 != null && cod_nisira1.Trim().ToUpper() != "NULL")
                        {
                            cod_nisira = cod_nisira1;
                        }
                        else if (cod_nisira2.Trim() != "" && cod_nisira2 != null && cod_nisira2.Trim().ToUpper() != "NULL")
                        {
                            cod_nisira = cod_nisira2;
                        }
                        else if (cod_nisira3.Trim() != "" && cod_nisira3 != null && cod_nisira3.Trim().ToUpper() != "NULL")
                        {
                            cod_nisira = cod_nisira3;
                        }

                        if (cod_nisira1 != string.Empty)
                        {
                            foreach (DataRow dr_N in dsStockNisira.Tables[0].Rows)
                            {
                                if (cod_nisira == dr_N.ItemArray[4].ToString())
                                {
                                    reporteSotcksComparativoBE.Codigo2 = dr_N.ItemArray[4].ToString();
                                    reporteSotcksComparativoBE.Stock2 = dr_N.ItemArray[16].ToString();
                                    reporteSotcksComparativoBE.Nombre2 = dr_N.ItemArray[14].ToString();
                                    reporteSotcksComparativoBE.UnidadMedida2 = dr_N.ItemArray[15].ToString();
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }

                li.Add(reporteSotcksComparativoBE);
            }

            List<ReporteSotcksComparativoBE> ds =li;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            jss.MaxJsonLength = 50000000;
            return jss.Serialize(ds);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object Almacenes(int parm)
        {
            DataSet ds = new ReporteSotcksBL().ListaAlmacenes(parm);
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
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }
    }
}
