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

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerAlm
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerAlm : System.Web.Services.WebService
    {

        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object ListReqConsumo(ConsHispBE obj)
        {
            EntHisp.vcNumero = obj.vcNumero;
            EntHisp.vcCodigo = obj.vcCodigo;
            EntHisp.vcNombre = obj.vcNombre;
            EntHisp.vcUsuario = GetParamCokkie("cd_user"); /*obj.vcUsuario;*/
            EntHisp.vcValor = obj.vcValor;
            DataSet ds = NegHisp.RequerimientoConsumo(EntHisp);
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
        public object ListDatNis(ConsNisiraBE obj)
        {
            EntNis.vcType = obj.vcType;
            EntNis.vcEmpresa = obj.vcEmpresa;
            EntNis.vcSucursal = obj.vcSucursal;
            DataSet ds = NegNis.ListSucursal(EntNis);
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
        public object ListClienteNis(ConsNisiraBE obj)
        {
            EntNis.vcIdCliente = obj.vcIdCliente;
            DataSet ds = NegNis.ListClienteNis(EntNis);
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

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }
    }
}
