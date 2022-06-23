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
using System.Globalization;
using System.Diagnostics;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
using System.Threading;
using System.Drawing;
using System.Net.Mail;
using System.Text;
using System.Net;
using System.ComponentModel;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerPlanilla
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SER_Reg_Sup_Evaluador : System.Web.Services.WebService
    {
        // instanciamos a los metodos.
        Reg_Sup_EvaluadorBE EntRegSupEva = new Reg_Sup_EvaluadorBE();
        Reg_Sup_EvaluadorBL NegRegSupEva = new Reg_Sup_EvaluadorBL();

        [WebMethod]
        public object SER_listar_tipo_cosecha(Reg_Sup_EvaluadorBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegRegSupEva.BL_listar_tipo_cosecha(EntRegSupEva);
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
        public object SER_listar_fundo(Reg_Sup_EvaluadorBE obj)
        {
            // receptionamos las varaiables.
            EntRegSupEva.COD_COSECHA = obj.COD_COSECHA;
            DataSet dsx = NegRegSupEva.BL_listar_fundo(EntRegSupEva);
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
        public object SER_registrar(Reg_Sup_EvaluadorBE obj)
        {
            // receptionamos las varaiables.
            EntRegSupEva.REG_COSECHA = obj.REG_COSECHA;
            EntRegSupEva.REG_FUNDO = obj.REG_FUNDO;
            EntRegSupEva.REG_CARGO = obj.REG_CARGO;
            EntRegSupEva.REG_TRABAJADOR = obj.REG_TRABAJADOR;
            DataSet dsx = NegRegSupEva.BL_registrar(EntRegSupEva);
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
