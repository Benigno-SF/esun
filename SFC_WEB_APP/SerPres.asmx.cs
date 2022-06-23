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
using System.IO;
using Interop = Microsoft.Office.Interop.Excel ;
using System.Runtime.InteropServices;
using System.Net;
using System.Web.Http;
using System.Runtime.Serialization.Formatters.Binary;
using System.ComponentModel;
using NPOI.SS.Formula.Functions;
using ChoETL;
using System.Globalization;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerPres
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET  , quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerPres : System.Web.Services.WebService
    {
        UnidadNegBE EntUNeg = new UnidadNegBE();
        UnidadNegBL NegUNeg = new UnidadNegBL();

        PresupuestoUnidadNegBE EntPresUnid = new PresupuestoUnidadNegBE();
        PresupuestoUnidadNegBL NegPresUnid = new PresupuestoUnidadNegBL();

        PresupuestoBE EntPres = new PresupuestoBE();
        PresupuestoBL NegPres = new PresupuestoBL();

        FormatoBE EntForm = new FormatoBE();
        FormatoBL NegForm = new FormatoBL();

        PresupuestoDefinicionBE EntPresDefi = new PresupuestoDefinicionBE();
        PresupuestoDefinicionBL NegPresDefi = new PresupuestoDefinicionBL();

        PresupuestoVersionDetalleBE EntPresVersDeta = new PresupuestoVersionDetalleBE();
        PresupuestoVersionDetalleBL NegPresVersDeta = new PresupuestoVersionDetalleBL();

        PresupuestoVersionBE EntPresVers = new PresupuestoVersionBE();
        PresupuestoVersionBL NegPresVers = new PresupuestoVersionBL();
        FormatoDetalleBE EntFormDeta = new FormatoDetalleBE();
        FormatoDetalleBL NegFormDeta = new FormatoDetalleBL();

        PresupuestoIndirectoBE EntPresIndi = new PresupuestoIndirectoBE();
        PresupuestoIndirectoBL NegPresIndi = new PresupuestoIndirectoBL();

        PresupuestoResumenBE EntPresResu = new PresupuestoResumenBE();
        PresupuestoResumenBL NegPresResu = new PresupuestoResumenBL();

        // instaciamos.
        Verif_DocumentoBE EntVerfDocumento = new Verif_DocumentoBE();
        PresupuestoUnidadNegBL NegVerfDocumento = new PresupuestoUnidadNegBL();


        UtilBL negUtil = new UtilBL();
        #region Reporte
        [WebMethod]
        public string RepoPresupCult(PresupuestoUnidadNegBE obj)
        {
            EntPresUnid.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresUnid.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresUnid.vnIdCultivo = obj.vnIdCultivo;
            DataSet ds = NegPresUnid.RepoPresupCult(EntPresUnid);
            //Repo
            string ruta = Server.MapPath("~/temp");
            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepPresCult" + DateTime.Now.ToString("mmssfff");
            string DiXml = ruta + "/" + NoXml + ".xml";

            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            return NoXml;
        }
        #endregion
        #region UnidNeg-Edit
        [WebMethod]
        public object ListPresResuDeta(PresupuestoResumenBE obj)
        {
            EntPresResu.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresResu.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresResu.vnIdFundo = obj.vnIdFundo;
            EntPresResu.vnIdCultivo = obj.vnIdCultivo;
            EntPresResu.vcIdPeriodo = obj.vcIdPeriodo;
            EntPresResu.vnIdParametro = obj.vnIdParametro;
            DataSet ds = NegPresResu.ListPresResuDeta(EntPresResu);
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
        public object RepoPresAll(PresupuestoUnidadNegBE obj)
        {
            EntPresUnid.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresUnid.vnIdPresupuesto = obj.vnIdPresupuesto;
            //EntPresUnid.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            DataSet ds = NegPresUnid.RepoPresupAll(EntPresUnid);
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
        public object ListParamIndiDeta(PresupuestoIndirectoBE obj)
        {
            EntPresIndi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresIndi.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresIndi.vnIdFormato = obj.vnIdFormato;
            DataSet ds = NegPresIndi.ListPresupIndiDeta(EntPresIndi);
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
        public int RegiPresuIndiDeta(List<PresupuestoIndirectoDetalleBE> List)
        {
            foreach (var item in List)
            {
                if (item.vnIdTiRow == 1)
                {
                    EntPresIndi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(item.vcIdEmpresa));
                    EntPresIndi.vnIdPresupuesto = item.vnIdPresupuesto;
                    EntPresIndi.vnIdFormato = item.vnIdFormato;
                    EntPresIndi.vbTerminado = item.vbTerminado;
                    EntPresIndi.vcUsuario = GetParamCokkie("cd_user");
                }
            }
            return NegPresIndi.RegiPresuIndi(EntPresIndi, List);
        }

        [WebMethod]
        public object ListParamIndi(FormatoDetalleBE obj) {
            EntFormDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFormDeta.vnIdFormato = obj.vnIdFormato;
            EntFormDeta.vnNivel = obj.vnNivel;
            EntFormDeta.vnIdParamTitulo = obj.vnIdParamTitulo;
            DataSet ds = NegFormDeta.ListFormDeta(EntFormDeta);
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
        public object RepoPresUnid(PresupuestoUnidadNegBE obj)
        {
            EntPresUnid.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresUnid.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresUnid.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            EntPresUnid.vnIdFormato = obj.vnIdFormato;

            DataSet ds = NegPresUnid.RepoPresUnidNeg(EntPresUnid);
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

        #endregion
        [WebMethod]
        public int RegiPresupVersCopy(List<PresupuestoVersionDetalleBE> obj) {
            foreach (var item in obj)
            {
                if (item.vnIdTiRow == 1)
                {
                    EntPresVers.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(item.vcIdEmpresa));
                    EntPresVers.vnIdPresupuesto = item.vnIdPresupuesto;
                    EntPresVers.vnIdUnidadNeg = item.vnIdUnidadNeg;
                    EntPresVers.vnIdFormato = item.vnIdFormato;
                    EntPresVers.vnVersion = item.vnVersion;
                    EntPresVers.vbTerminado = item.vbTerminado;
                    EntPresVers.vcUsuario = GetParamCokkie("cd_user");
                }
            }
            int IdMuestra = NegPresVersDeta.RegiPresupVersCopy(EntPresVers, obj);
            return IdMuestra;
        }
        [WebMethod]
        public object ListUnidNegFundo(UnidadNegBE obj)
        {
            EntUNeg.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntUNeg.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            EntUNeg.vnIdCultivo = obj.vnIdCultivo;
            EntUNeg.vcUsuario = GetParamCokkie("cd_user");

            DataSet ds = NegUNeg.ListUnidNegFundo(EntUNeg);
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
        public object ListFormatos(PresupuestoVersionDetalleBE obj)
        {
            EntForm.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntForm.vnIdTipo = 2;
            EntForm.vnIdCultivo = obj.vnIdCultivo;
            EntForm.vcUsuario = GetParamCokkie("cd_user");
            DataSet ds = NegForm.ListFormUser(EntForm);
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
        public string RegiPresupVers(PresupuestoVersionBE obj) {
            EntPresVers.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresVers.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresVers.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            EntPresVers.vnIdFormato = obj.vnIdFormato;
            EntPresVers.vnVersion = obj.vnVersion;
            return  NegPresVers.RegiPresupVers(EntPresVers);
        }
        [WebMethod]
        public object ListPresupVersDeta(PresupuestoVersionDetalleBE obj)
        {
            EntPresVersDeta.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresVersDeta.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresVersDeta.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            EntPresVersDeta.vnIdFormato = obj.vnIdFormato;
            EntPresVersDeta.vnVersion = obj.vnVersion;
            DataSet ds = NegPresVersDeta.ListPresupVersionDeta(EntPresVersDeta);
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
        public int RegiPresupVersDeta(List<PresupuestoVersionDetalleBE> List)
        {
            foreach (var obj in List) {
                if (obj.vnIdTiRow == 1) {
                    EntPresVers.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
                    EntPresVers.vnIdPresupuesto = obj.vnIdPresupuesto;
                    EntPresVers.vnIdUnidadNeg = obj.vnIdUnidadNeg;
                    EntPresVers.vnIdFormato = obj.vnIdFormato;
                    EntPresVers.vnVersion = obj.vnVersion;
                    EntPresVers.vcUsuario = GetParamCokkie("cd_user");
                }
            }
            int IdMuestra = NegPresVersDeta.RegiPresupVers(EntPresVers, List);
            return IdMuestra;
        }
        [WebMethod]
        public object LisPresDefin(PresupuestoDefinicionBE obj)
        {
            EntPresDefi.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresDefi.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresDefi.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            EntPresDefi.vnIdFormato = obj.vnIdFormato;
            DataSet ds = NegPresDefi.ListPresupDefin(EntPresDefi);
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
        public object LisPresPeriodo(PresupuestoBE obj)
        {
            EntPres.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPres.vnIdPresupuesto = obj.vnIdPresupuesto;
            DataSet ds = NegPres.ListPresPeriodo(EntPres);
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
        public object SER_lista_confi_documento(Verif_DocumentoBE obj)
        {
            EntVerfDocumento.VERI_DOC_PERIODO = obj.VERI_DOC_PERIODO;
            DataSet ds = NegVerfDocumento.lista_confi_documentoBL(EntVerfDocumento);
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
        public int RegiPresUnid(PresupuestoUnidadNegBE obj)
        {
            EntPresUnid.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPresUnid.vnIdPresupuesto = obj.vnIdPresupuesto;
            EntPresUnid.vnIdUnidadNeg = obj.vnIdUnidadNeg;
            EntPresUnid.vnIdFormato = obj.vnIdFormato;
            EntPresUnid.vnFRegistro = obj.vnFRegistro;
            EntPresUnid.vcUsuario = GetParamCokkie("cd_user");
            int vvMsje = NegPresUnid.RegiPresUnidNeg(EntPresUnid);
            return vvMsje;
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] GetUnidNeg(UnidadNegBE obj)
        {
            EntUNeg.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa ));
            EntUNeg.vnIdUnidadNeg= obj.vnIdUnidadNeg;
            EntUNeg.vcFundo = obj.vcFundo;
            EntUNeg.vnIdCultivo = obj.vnIdCultivo;
            EntUNeg.vcDescUnidadNeg = obj.vcDescUnidadNeg;
            EntUNeg.vcUsuario = GetParamCokkie("cd_user");
            return NegUNeg.GetUnidNeg(EntUNeg);
        }
               

   
        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

        [WebMethod]
        [HttpPost]
        public string CargaExcel(List<PresMenBE> obj)
        {
            string ret = "";
            try
            {
                string formato = "";
                string periodo = "";
                decimal valorDolar = 4;
               
                List<PresLineBE> listline = new List<PresLineBE>();

                string pathCSV = @"\\172.16.16.14\Backup\temp\temp.csv";
                if (File.Exists(pathCSV))
                {
                    File.Delete(pathCSV);
                }
                //LEYENDO OBJETO LINEAS
                foreach (var item in obj)
                {
                    if (item.cadena1 != "False")
                    {
                        string[] arrColumna = item.cadena1.Split(',');
                        formato = arrColumna[1];
                        periodo = arrColumna[4];

                        string mes = periodo.Substring(periodo.Length - 2, 2);
                        var desde = new DateTime(DateTime.Today.Year, int.Parse(mes), 1).ToString("yyyy-MM-dd HH:mm:ss.fff");
                        var hasta = new DateTime(DateTime.Today.Year, int.Parse(mes), 1).AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd HH:mm:ss.fff");
                        var cad = string.Concat(desde, ',', hasta, ',', item.cadena2, ',', decimal.Parse(item.cadena2) / valorDolar, ',', '0');
                        ret = cad;
                        PresLineBE lines = new PresLineBE();
                        lines.line = string.Concat(item.cadena1, cad);
                        listline.Add(lines);
                    }
                }
                // ESCRIBIENDO CSV
                using (var w = new ChoCSVWriter<PresLineBE>(pathCSV))
                {
                    w.Write(listline);
                }

                SFC_BL.PresupuestoBL presupuestoBL = new SFC_BL.PresupuestoBL();
                string respuesta = presupuestoBL.BulkInsertPresupuesto(formato);
                return respuesta;

            }
            catch (Exception ee)
            {
                return ee.Message+ ret;
            }

        }



    }
}
