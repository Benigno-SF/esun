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
    public class SER_Reg_Chofe_Placas : System.Web.Services.WebService
    {
        // instanciamos 
        // instanciamos a los metodos.
        Reg_Chofe_PlacaBE EntRegChofePlaca = new Reg_Chofe_PlacaBE();
        Reg_Chofe_PlacaBL NegRegChofePlaca = new Reg_Chofe_PlacaBL();

        [WebMethod]
        public object SER_listar_proveedores(Reg_Chofe_PlacaBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegRegChofePlaca.BL_listar_proveedores(EntRegChofePlaca);
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
        public object SER_verificar_chofer(Reg_Chofe_PlacaBE obj)
        {
            // receptionamos las varaiables.
            EntRegChofePlaca.CHOFER_BREVETE = obj.CHOFER_BREVETE;
            EntRegChofePlaca.COHER_DNI = obj.COHER_DNI;
            DataSet dsx = NegRegChofePlaca.BL_verificar_chofer(EntRegChofePlaca);
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
        public object SER_registro_chofer(Reg_Chofe_PlacaBE obj)
        {
            // receptionamos las varaiables.
            EntRegChofePlaca.COHER_PROVEEDOR = obj.COHER_PROVEEDOR;
            EntRegChofePlaca.CHOFER_BREVETE = obj.CHOFER_BREVETE;
            EntRegChofePlaca.COHER_DNI = obj.COHER_DNI;
            EntRegChofePlaca.CHOFER_DATOS = obj.CHOFER_DATOS;
            DataSet dsx = NegRegChofePlaca.BL_registrar_chofer(EntRegChofePlaca);
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
        public object SER_verificar_placa(Reg_Chofe_PlacaBE obj)
        {
            // receptionamos las varaiables.
            EntRegChofePlaca.PLACA_PLACA = obj.PLACA_PLACA;
            DataSet dsx = NegRegChofePlaca.BL_verificar_placa(EntRegChofePlaca);
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
        public object SER_registro_placa(Reg_Chofe_PlacaBE obj)
        {
            // receptionamos las varaiables.
            EntRegChofePlaca.PLACA_PROVEEDOR = obj.PLACA_PROVEEDOR;
            EntRegChofePlaca.PLACA_PLACA = obj.PLACA_PLACA;
            EntRegChofePlaca.PLACA_MARCA = obj.PLACA_MARCA;
            DataSet dsx = NegRegChofePlaca.BL_registrar_placa(EntRegChofePlaca);
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
