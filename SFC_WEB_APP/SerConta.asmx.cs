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
    /// Descripción breve de SerConta
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerConta : System.Web.Services.WebService
    {

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        ContabilidadBE EntConta = new ContabilidadBE();
        ContabilidadBL NegConta = new ContabilidadBL();

        InventarioBL NegInv = new InventarioBL();

        UtilBL negUtil = new UtilBL();


        [WebMethod]
        public object RegiInventario(ContabilidadBE obj, List<ContabilidadBE> arrayTaa)
        {
            DataTable dtx = new DataTable();
            dtx.Columns.Add("IDEMPRESA", typeof(string));
            dtx.Columns.Add("IDINVENTARIO", typeof(string));
            dtx.Columns.Add("ITEM", typeof(string));
            dtx.Columns.Add("CODIGOBARRA", typeof(string));
            dtx.Columns.Add("IDPRODUCTO", typeof(string));
            dtx.Columns.Add("IDSERIE", typeof(string));
            dtx.Columns.Add("DESCRIPCION", typeof(string));
            dtx.Columns.Add("IDESTADOPRODUCTO", typeof(string));
            dtx.Columns.Add("IDMEDIDA", typeof(string));
            dtx.Columns.Add("CANTIDAD", typeof(decimal));
            dtx.Columns.Add("CANTIDADSISTEMA", typeof(decimal));
            dtx.Columns.Add("CANTIDADDIFERENCIA", typeof(decimal));

            foreach (var item in arrayTaa)
            {
                decimal d1;
                decimal d2;
                decimal d3;
                if (item.CANTIDAD == "") { d1 = Convert.ToDecimal(0.0); } else { d1 = Convert.ToDecimal(item.CANTIDAD); }
                if (item.CANTIDADSISTEMA == "") { d2 = Convert.ToDecimal(0.0); } else { d2 = Convert.ToDecimal(item.CANTIDADSISTEMA); }
                if (item.CANTIDADDIFERENCIA == "") { d3 = Convert.ToDecimal(0.0); } else { d3 = Convert.ToDecimal(item.CANTIDADDIFERENCIA); }

                var rowd = dtx.NewRow();
                    rowd["IDEMPRESA"] = item.IDEMPRESA;
                    rowd["IDINVENTARIO"] = item.IDINVENTARIO;
                    rowd["ITEM"] = item.ITEM;
                    rowd["CODIGOBARRA"] = item.CODIGOBARRA;
                    rowd["IDPRODUCTO"] = item.IDPRODUCTO;
                    rowd["IDSERIE"] = item.IDSERIE;
                    rowd["DESCRIPCION"] = item.DESCRIPCION;
                    rowd["IDESTADOPRODUCTO"] = item.IDESTADOPRODUCTO;
                    rowd["IDMEDIDA"] = item.IDMEDIDA;
                    rowd["CANTIDAD"] = d1;
                    rowd["CANTIDADSISTEMA"] = d2;
                    rowd["CANTIDADDIFERENCIA"] = d3;
                    dtx.Rows.Add(rowd);
                
            }

            EntConta.vcIdEmpresa = obj.vcIdEmpresa;
            EntConta.vcIdInventario = obj.vcIdInventario;
            EntConta.vcSerie = obj.vcSerie;
            EntConta.vcNumero = obj.vcNumero;
            EntConta.vcIdSucursal = obj.vcIdSucursal;
            EntConta.vcIdAlmacen = obj.vcIdAlmacen;
            EntConta.vcIdResponsable = obj.vcIdResponsable;
            EntConta.vcFecha = obj.vcFecha;
            EntConta.vcUsuario = GetParamCokkie("cd_user");
            DataSet ds = NegConta.InventarioRegi(EntConta, dtx);
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
        public object List_Inventario_Update(ConsNisiraBE obj)
        {
            
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntNis.vcIdInventario = obj.vcIdInventario;
            EntNis.vcSerie = obj.vcSerie;
            EntNis.vcNumero = obj.vcNumero;
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegInv.List_Inventario_Update(EntNis);
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
        public object ListResponsableNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntNis.vcIdResponsable = obj.vcIdResponsable;
            DataSet dsx = NegInv.ListResponsableNis(EntNis);
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
        public object ListProductosMovimientos(ConsNisiraBE obj)
        {
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntNis.vcIdInventario = obj.vcIdInventario;
            EntNis.vcIdSucursal = obj.vcIdSucursal;
            EntNis.vcIdAlmacen = obj.vcIdAlmacen;
            EntNis.vcIdGrupo= obj.vcIdGrupo;
            EntNis.vcIdSubGrupo = obj.vcIdSubGrupo;
            EntNis.vcDescripcion = obj.vcDescripcion;
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegInv.ListProductosMovimientos(EntNis);
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
        public object ListInventariosNis(ConsNisiraBE obj)
        {
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntNis.vcIdSucursal = obj.vcIdSucursal;
            EntNis.vcIdAlmacen = obj.vcIdAlmacen;
            EntNis.vcFecha = obj.vcFecha;
            EntNis.vcFechaFin = obj.vcFechaFin;
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegInv.ListInventariosNis(EntNis);
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
        public object ListEmpresaNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            DataSet dsx = NegInv.ListEmpresaNis(EntNis);
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
        public object ListSucursalNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntNis.vcIdSucursal = obj.vcIdSucursal;
            DataSet dsx = NegInv.ListSucursalNis(EntNis);
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
        public object ListAlmacenNis(ConsNisiraBE obj)
        {
            EntNis.vcUsuario = GetParamCokkie("cd_user");
            EntNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntNis.vcIdSucursal = obj.vcIdSucursal;
            EntNis.vcIdAlmacen = obj.vcIdAlmacen;
            DataSet dsx = NegInv.ListAlmacenNis(EntNis);
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
    }
}
