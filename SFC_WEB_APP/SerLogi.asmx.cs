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
    /// Descripción breve de SerLogi
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerLogi : System.Web.Services.WebService
    {
        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        UtilBL negUtil = new UtilBL();

        // INSTANCIA DE REPORTE DE ANANALISS COMPRAS.
        ReporteAnalisisComprasBE EntNisRepAnalCompra = new ReporteAnalisisComprasBE();
        ReporteAnalisisComprasBL NegNisRepAnalCompra = new ReporteAnalisisComprasBL();

        [WebMethod]
        public object ProductosNisUpdate(ConsNisiraBE obj, List<ConsNisiraBE> arrayTaa)
        {
            DataTable dtx = new DataTable();
            dtx.Columns.Add("IDPRODUCTO", typeof(string));
            dtx.Columns.Add("MRPDIASPLANEACION", typeof(string));
            dtx.Columns.Add("MRPDIASREPOSICION", typeof(string));
            dtx.Columns.Add("MRPSTOCKMINIMO", typeof(string));
            dtx.Columns.Add("MRPSTOCKSEGURIDAD", typeof(string));
            foreach (var item in arrayTaa)
            {
                string d1;
                string d2;
                string d3;
                string d4;
                if (item.MRPDIASPLANEACION == "") { d1 = "0"; } else { d1 = item.MRPDIASPLANEACION; }
                if (item.MRPDIASREPOSICION == "") { d2 = "0"; } else { d2 = item.MRPDIASREPOSICION; }
                if (item.MRPSTOCKMINIMO == "") { d3 = "0"; } else { d3 = item.MRPSTOCKMINIMO; }
                if (item.MRPSTOCKSEGURIDAD == "") { d4 = "0"; } else { d4 = item.MRPSTOCKSEGURIDAD; }
                var rowd = dtx.NewRow();
                rowd["IDPRODUCTO"] = item.IDPRODUCTO;
                rowd["MRPDIASPLANEACION"] = d1;
                rowd["MRPDIASREPOSICION"] = d2;
                rowd["MRPSTOCKMINIMO"] = d3;
                rowd["MRPSTOCKSEGURIDAD"] = d4;
                dtx.Rows.Add(rowd);
            }

            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcBaseDatos = obj.vcBaseDatos;
            DataSet ds = NegNis.ProductosNisUpdate(EntNis, dtx);
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
        public object ViewPdf(ConsNisiraBE obj)
        {

            var ruta = obj.vcFile;

            string cleandata = ruta.Replace("X:", "");
            //FileInfo fi = new FileInfo(@"\\172.16.16.16\Nisira File" + cleandata);
            var rutax = @"\\172.16.16.16\Nisira File" + cleandata;
            byte[] img1 = System.IO.File.ReadAllBytes(rutax);
            string b1 = Convert.ToBase64String(img1);
            //Byte[] bytes = File.ReadAllBytes(myFile);
            //String file = Convert.ToBase64String(bytes);

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            row = new Dictionary<string, object>();
            row.Add("file", b1);
            rows.Add(row);

            return serializer.Serialize(rows);
        }


    [WebMethod]
        public object ListFilesNisira_list(ConsNisiraBE obj)
        {

            EntNis.vcIdEmpresa = obj.vcIdEmpresa; 
            EntNis.vcType = obj.vcType;
            EntNis.vcCodigo = obj.vcCodigo;
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegNis.ListFilesNisira_list(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object ListProductosNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcBaseDatos = obj.vcBaseDatos;
            EntNis.vnIdGrupo = obj.vnIdGrupo;
            EntNis.vnIdSubGrupo = obj.vnIdSubGrupo;
            EntNis.vcDescripcion = obj.vcDescripcion;
            DataSet dsx = NegNis.ListProductosNis(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object ListSubGrupoNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcBaseDatos = obj.vcBaseDatos;
            EntNis.vnIdGrupo = obj.vnIdGrupo;
            EntNis.vnIdSubGrupo = obj.vnIdSubGrupo;
            EntNis.vcDescripcion = obj.vcDescripcion;
            DataSet dsx = NegNis.ListSubGrupoNis(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object ListGrupoNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcBaseDatos = obj.vcBaseDatos;
            EntNis.vnIdGrupo = obj.vnIdGrupo;
            EntNis.vcDescripcion = obj.vcDescripcion;
            DataSet dsx = NegNis.ListGrupoNis(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }
        [WebMethod]
        public object ListBasedatos(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegNis.ListTrazaReqs(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object ReqvsExistencia(ConsHispBE obj)
        {
            EntHisp.vcNumero = obj.vcNumero;
            DataSet dsx = NegHisp.ReqvsExistencia(EntHisp);
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
        public object ListTrazaReqs(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcPeriodo = obj.vcPeriodo;
            //EntNis.vcDato = obj.vcDato;
            EntNis.vcTipo = obj.vcTipo;
            EntNis.vcFecha = obj.vcFecha;
            EntNis.vcFechaFin = obj.vcFechaFin;
            //EntNis.vcArea = obj.vcArea;
            //EntNis.vcestadoreq = obj.vcestadoreq;
            //EntNis.vcestadoped = obj.vcestadoped;
            //EntNis.vcestadoos = obj.vcestadoos;
            DataSet dsx = NegNis.ListTrazaReqs(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object LogHistorial(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcEmpresa = obj.vcEmpresa;
            EntNis.vcType = obj.vcType;
            EntNis.vcId = obj.vcId;
            DataSet dsx = NegNis.LogHistorial(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object DetOrden(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcEmpresa = obj.vcEmpresa; 
            EntNis.vcType = obj.vcType;
            EntNis.vcId = obj.vcId;
            DataSet dsx = NegNis.DetOrden(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }


        [WebMethod]
        public object ListRequConsumoNisira(ConsNisiraBE obj)
        {
            EntHisp.vcUsuario = GetParamCokkie("cd_user");

            DataSet dsx = NegHisp.ListRequConsumoNisira(EntHisp);
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
        public object AprobReqConsumoNisira(ConsNisiraBE obj)
        {
             EntHisp.vnIdc = obj.vnIdc;
            EntHisp.vnEstado = obj.vnEstado;
            EntHisp.vcCodigo = obj.vcCodigo;
            EntHisp.vcEmpresa = obj.vcEmpresa;
            EntHisp.vcAprobacion = obj.vcAprobacion;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            int num = NegHisp.RegiEstadoRequerimientoNisira(EntHisp);
            //DataTable dt = dsx.Tables[0];

            ////Serializacion
            //JavaScriptSerializer serializer = new JavaScriptSerializer();
            //serializer.MaxJsonLength = Int32.MaxValue;
            //List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            //Dictionary<string, object> row;
            //foreach (DataRow de in dt.Rows)
            //{
            //    row = new Dictionary<string, object>();
            //    foreach (DataColumn col in dt.Columns)
            //    {
            //        row.Add(col.ColumnName, de[col]);
            //    }
            //    rows.Add(row);
            //}

            //return serializer.Serialize(rows);
            return num;
        }


        [WebMethod]
        public object ListDetaReq(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcId = obj.vcId;
            EntNis.vcType = obj.vcType;
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            DataSet dsx = NegNis.ListDetaReq(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }


        [WebMethod]
        public object ListDetaIngreso(ConsNisiraBE obj)
        {
            EntNis.vcId = obj.vcId;
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            DataSet dsx = NegNis.ListDetaIngreso(EntNis);
            DataTable dt = dsx.Tables[0];

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

            return serializer.Serialize(rows);
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

        // funcion reporte de analisis compras
        [WebMethod]
        public object SER_reporte_analisis_compra(ReporteAnalisisComprasBE obj)
        {
            // receptionamos las varaiables.
            EntNisRepAnalCompra.REPORTE_FECHA_INICIO = obj.REPORTE_FECHA_INICIO;
            EntNisRepAnalCompra.REPORTE_FECHA_FIN = obj.REPORTE_FECHA_FIN;
            DataSet dsx = NegNisRepAnalCompra.BL_reporte_analisis_compra(EntNisRepAnalCompra);
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
