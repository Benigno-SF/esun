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
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using System.Threading;

namespace SFC_WEB_APP.Mod_App
{
    /// <summary>
    /// Descripción breve de SerReports
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerReports : System.Web.Services.WebService
    {
        ConsHispBE entHisp = new ConsHispBE();
        ConsHispBL negHisp = new ConsHispBL();

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
            string NoXml = "RepUtilidad"+ DateTime.Now.ToString("mmssfff")+ ConsNisiraBE;
            string DiXml = ruta + "/" + NoXml + ".xml";

            EntNisira.vcIdEmpresa = "001";
            EntNisira.vcAmbito = "OBR";
            EntNisira.vcPeriodo = "202104";
            EntNisira.vcSemana = "";
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
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public DataTable ListMonitorSubLinea()
        {
            entHisp.vcFecha = "10/01/2020";
            entHisp.vcFechaFin = "10/01/2020";
            DataSet dsx = negHisp.GetParteTransformacion(entHisp);
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
            //return serializer.Serialize(rows);
            //
            string strResult = serializer.Serialize(rows);
            //object objResultD = new { d = strResult }; // To make result similarly like ASP.Net Web Service in JSON form. You can skip if it's not needed in this form.

            //System.Web.Script.Serialization.JavaScriptSerializer ser = new System.Web.Script.Serialization.JavaScriptSerializer();
            //string strResponse = ser.Serialize(objResultD);

            //string strCallback = Context.Request.QueryString["callback"]; // Get callback method name. e.g. jQuery17019982320107502116_1378635607531
            //strResponse = strCallback + "(" + strResponse + ")"; // e.g. jQuery17019982320107502116_1378635607531(....)
            //strResponse = strResponse.Replace(System.Environment.NewLine, "");
            //Context.Response.Clear();
            //Context.Response.ContentType = "application/json";
            //Context.Response.AddHeader("content-length", strResponse.Length.ToString());
            //Context.Response.Flush();

            //Context.Response.Write(strResponse);
            return dt;
            //

        }
    }
}
