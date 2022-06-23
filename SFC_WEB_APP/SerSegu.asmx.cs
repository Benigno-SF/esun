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
using System.Globalization;
using System.IO;
using System.Net;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerSegu
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerSegu : System.Web.Services.WebService
    {

        ConductorBE EntConductor = new ConductorBE();
        ConductorBL NegConductor = new ConductorBL();

        VehiculoBE EntVehiculo = new VehiculoBE();
        VehiculoBL NegVehiculo = new VehiculoBL();

        ClienteProdBE EntClienteProd = new ClienteProdBE();
        ClienteProdBL NegClienteProd = new ClienteProdBL();

        ControlGaritaBE EntControlGarita = new ControlGaritaBE();
         ControlGaritaBL NegControlGarita = new ControlGaritaBL();

        IngresoProductoBE EntIngresoProducto = new IngresoProductoBE();
        IngresoProductoBL NegIngresoProducto = new IngresoProductoBL();

        CultivoPackingVariedadBE EntCultivoVariedad = new CultivoPackingVariedadBE();
        CultivoPackingVariedadBL NegCultivoVariedad = new CultivoPackingVariedadBL();


        OrganigramaBE EntOrganigrama = new OrganigramaBE();
        OrganigramaBL NegOrganigrama = new OrganigramaBL();

        IncidenciaBE EntIncidencia = new IncidenciaBE();
        IncidenciaBL NegIncidencia = new IncidenciaBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object listConductor(ConductorBE obj)
        {
            EntConductor.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConductor.vcNroDocumento = obj.vcNroDocumento;
            EntConductor.vcNombres = obj.vcNombres;
            EntConductor.vcLicenciaConducir = obj.vcLicenciaConducir;
            DataSet dsx = NegConductor.ListConductor(EntConductor);
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
        public object ListControlGarita(ControlGaritaBE obj)
        {

            EntControlGarita.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntControlGarita.vnIdControlGarita = obj.vnIdControlGarita;
            DataSet dsx = NegControlGarita.ListControlGarita(EntControlGarita);
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
        public object ListOrganigrama(OrganigramaBE obj)
        {

            EntOrganigrama.vnIdEmpresa = 1;
            EntOrganigrama.vnidOrganigrama = 1;
            EntOrganigrama.vnIdNivelMaster = 0;
            DataSet dsx = NegOrganigrama.ListOrganigrama(EntOrganigrama);
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
        public object saveimg(ClienteProdBE obj)
        {


            try
            {
                string folderPath = Server.MapPath("~/Img/");  //Create a Folder in your Root directory on your solution.
                string fileName = "IMageName.jpg";
                string imagePath = folderPath + fileName;

                string base64StringData = obj.vcDescripcion; // Your base 64 string data
                string cleandata = base64StringData.Replace("data:image/jpeg;base64,", "");
                byte[] data = System.Convert.FromBase64String(cleandata);
                MemoryStream ms = new MemoryStream(data);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms);
                img.Save(imagePath, System.Drawing.Imaging.ImageFormat.Jpeg);
                var jsonObject = new object();
                jsonObject = "OK";
                return jsonObject;
            }
            catch (Exception ex)
            {
                var jsonObject = new object();
                jsonObject = "NOT";
                return jsonObject;
            }

        /*    var jsonObject = new object();

            FileInfo file = new FileInfo(imagePath);

            if (file.Exists.Equals(true))
            {
                jsonObject = "OK";
            }
            else {
                jsonObject = "NOT";
                
            }
            return jsonObject;*/


        }

        [WebMethod]
        public object ListIngresoProducto(IngresoProductoBE obj)
        {

            EntIngresoProducto.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIngresoProducto.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegIngresoProducto.ListIngresoProducto(EntIngresoProducto);
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
        public string[] listVehiculo(VehiculoBE obj)
        {
            EntVehiculo.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntVehiculo.vcPlaca = obj.vcPlaca;
            EntVehiculo.vcType = obj.vcType;
            EntVehiculo.vcDescVehiculo = obj.vcDescVehiculo;
            return NegVehiculo.ListVehiculo(EntVehiculo);
        }

        [WebMethod]
        public string[] ArrayClienteProd(ClienteProdBE obj)
        {
            //EntCliente.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntClienteProd.vcDescClieProv = obj.vcDescClieProv;
            return NegClienteProd.ArrayClienteProd(EntClienteProd);
        }

        [WebMethod]
        public object ControlGaritaRegi(ControlGaritaBE obj)
        {
            EntControlGarita.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntControlGarita.vnIdControlGarita = obj.vnIdControlGarita;

            EntControlGarita.vnIdVehiculo = obj.vnIdVehiculo;
            EntControlGarita.vcPLaca = obj.vcPLaca;
            EntControlGarita.vnTipoVehiculo = obj.vnTipoVehiculo;
            EntControlGarita.vcDescripcion = obj.vcDescripcion;

            EntControlGarita.vnIdConductor = obj.vnIdConductor;
            EntControlGarita.vcNroDocumento = obj.vcNroDocumento;
            EntControlGarita.vcApPaterno = obj.vcApPaterno;
            EntControlGarita.vcApMaterno = obj.vcApMaterno;
            EntControlGarita.vcNombres = obj.vcNombres;
            EntControlGarita.vcLicenciaConducir = obj.vcLicenciaConducir;

            EntControlGarita.vnIdClieProv = obj.vnIdClieProv;
            EntControlGarita.vnIdentClieProv = obj.vnIdentClieProv;
            EntControlGarita.vcDescClieProv = obj.vcDescClieProv;

            EntControlGarita.vdFechaIngreso = obj.vdFechaIngreso;
            EntControlGarita.vcObservacionIngreso = obj.vcObservacionIngreso;

            EntControlGarita.vdFechaSalida = obj.vdFechaSalida;
            EntControlGarita.vcObservacionSalida = obj.vcObservacionSalida;
            EntControlGarita.vcUsuario = GetParamCokkie("cd_user");

            DataSet dsx = NegControlGarita.ControlGaritaRegi(EntControlGarita);
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
        public object InicdenciaRegi(IncidenciaBE obj)
        {
            EntIncidencia.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIncidencia.vnIdIncidencia = obj.vnIdIncidencia;
            EntIncidencia.vnIdFundo = obj.vnIdFundo;
            EntIncidencia.vnIdPersonal = obj.vnIdPersonal;
            EntIncidencia.vnIdTipo = obj.vnIdTipo;
            EntIncidencia.vcDescIncidencia = obj.vcDescIncidencia;
            EntIncidencia.vcFecha = obj.vcFecha;
            EntIncidencia.vcUsuario = GetParamCokkie("cd_user");

            DataSet dsx = NegIncidencia.IncidenciaRegi(EntIncidencia);
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
        public object IngresoProductoRegi(IngresoProductoBE obj)
        {
            EntIngresoProducto.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIngresoProducto.vcNroGuia = obj.vcNroGuia;
            EntIngresoProducto.vnIdCultivo = obj.vnIdCultivo;
            EntIngresoProducto.vnIdVariedad = obj.vnIdVariedad;
            EntIngresoProducto.vnCantProd = obj.vnCantProd;
            EntIngresoProducto.vnKiloAproxProd = obj.vnKiloAproxProd;
            EntIngresoProducto.vcUsuario = GetParamCokkie("cd_user");

            DataSet dsx = NegIngresoProducto.IngresoProductoRegi(EntIngresoProducto);
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
        public object IngresoProductoDel(IngresoProductoBE obj)
        {
            EntIngresoProducto.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIngresoProducto.vnIdProd = obj.vnIdProd;
            DataSet dsx = NegIngresoProducto.IngresoProductoDel(EntIngresoProducto);
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

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }


    }
}
