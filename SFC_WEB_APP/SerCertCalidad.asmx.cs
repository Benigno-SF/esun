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
using System.Drawing;
using System.Drawing.Imaging;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerCertCalidad
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerCertCalidad : System.Web.Services.WebService
    {

        FormatoDetalleBE EntFormDeta = new FormatoDetalleBE();
        FormatoDetalleBL NegFormDeta = new FormatoDetalleBL();

        ControlNroMuestraBE EntContMues = new ControlNroMuestraBE();
        ControlNroMuestraBL NegContMues = new ControlNroMuestraBL();

        ControlFotoBE EntFoto = new ControlFotoBE();
        ControlFotoBL NegFoto = new ControlFotoBL();

        CalidadReBL calBL = new CalidadReBL();
        ReportCalid ReportBE = new ReportCalid();
        RutasBE RutasBEobj = new RutasBE();
        BorrarFotoBE BorrarAfterBE = new BorrarFotoBE();

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        CertificadoCalidadBE EntCertNis = new CertificadoCalidadBE();
        CertificadoCalidadBL NegCertNis = new CertificadoCalidadBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object ListCertificados2(CertificadoCalidadBE obj)
        {
            EntCertNis.vcFecha = obj.vcFecha;
            EntCertNis.vcNombre = obj.vcNombre;
            EntCertNis.vcCert = obj.vcCert;
            EntCertNis.vcCert2 = obj.vcCert2;
            EntCertNis.vcCode = obj.vcCode;

            DataSet ds = NegCertNis.ListCertificados(EntCertNis);
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


        //Cambio de Erick

        [WebMethod]
        public object BuscarNombreporDni(CertificadoCalidadBE obj)
        {
            EntCertNis.dni = obj.dni;
            DataSet ds = NegCertNis.BuscarNombrePorDni(EntCertNis);
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

        //Fin cambio de Erick

        [WebMethod]
        public object ListCertificadosxid(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidcertificado = obj.vidcertificado;

            DataSet ds = NegCertNis.ListCertificadosxid(EntCertNis);
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
        public object ListDetalleCertificados(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidcertificado = obj.vidcertificado;
            DataSet ds = NegCertNis.ListDetalleCertificados(EntCertNis);
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
        public object List_Informacion_input(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidusuario = obj.vidusuario;
            EntCertNis.vc_codigo = obj.vc_codigo;
            EntCertNis.vtipo = obj.vtipo;
            EntCertNis.vcodigoinput = obj.vcodigoinput;
            DataSet ds = NegCertNis.List_Informacion_input(EntCertNis);
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
        public object List_ProductosCalidad(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidvariable = obj.vidvariable;
            EntCertNis.vidunidadnegocio = obj.vidunidadnegocio;
            EntCertNis.vtipo = obj.vtipo;
            DataSet ds = NegCertNis.List_ProductosCalidad(EntCertNis);
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
        public object List_usuario(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidusuario = obj.vidusuario;
            DataSet ds = NegCertNis.List_Usuario(EntCertNis);
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
        public object List_dvariablescalidad(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidvariable = obj.vidvariable;
            DataSet ds = NegCertNis.List_dvariablescalidad(EntCertNis);
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
        public object List_variablescalidad(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidusuario = obj.vidusuario;
            DataSet ds = NegCertNis.List_variablescalidad(EntCertNis);
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
        public object List_pkcertificado(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            DataSet ds = NegCertNis.List_pkcertificado(EntCertNis);
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
        public object List_ParametroxUsuario(CertificadoCalidadBE obj)
        {
            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vidusuario = obj.vidusuario;
            EntCertNis.vc_codigo = obj.vc_codigo;
            EntCertNis.vtipo = obj.vtipo;
            EntCertNis.vcodigoinput = obj.vcodigoinput;
            DataSet ds = NegCertNis.List_ParametroxUsuario(EntCertNis);
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
        public object XmlRegiCertificadoCalidad(CertificadoCalidadBE obj, List<CertificadoCalidadBE> arrayDetail, List<CertificadoCalidadBE> newformato)
        {

            string xmlStringHead = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
              "<datos>" +
                "<certificado>" +
                    "<idempresa>" + obj.vidempresa + "</idempresa>" +
                    "<idcertificado>" + obj.vidcertificado + "</idcertificado>" +
                    "<idemisor>001</idemisor>" +
                    "<periodo>" + obj.vidperiodo + "</periodo>" +
                    "<idestadoc>A</idestadoc>" +
                    "<origen_certificado>M</origen_certificado>" +
                    "<idsucursal>" + obj.vidsucursal + "</idsucursal>" +
                    "<idalmacen>" + obj.vidalmacen + "</idalmacen>" +
                    "<iddocumento>" + obj.viddocumento + "</iddocumento>" +
                    "<serie>" + obj.vidserie + "</serie>" +
                    "<numero>" + obj.vnumero + "</numero>" +
                    "<idestado>PE</idestado>" +
                    "<fecha>" + obj.vcFecha + "</fecha>" +
                    "<tcambio>" + obj.vtcambio + "</tcambio>" +
                    "<idclieprov>" + obj.vidclieprov + "</idclieprov>" +
                    "<idresponsable>" + obj.vidresponsable + "</idresponsable>" +
                    "<idturnotrabajo>" + obj.vidturnotrabajo + "</idturnotrabajo>" +
                    "<glosa>" + obj.vglosa + "</glosa>" +
                    "<nromanual/>" +
                    "<ventana>EDT_CERTIFICADO_CALIDADES</ventana>" +
                    "<idreferencia>" + obj.vidreferencia + "</idreferencia>" +
                    "<evaluador>" + obj.vevaluador + "</evaluador>" +
                    "<tipomuestra>" + obj.vidtipomuestra + "</tipomuestra>" +
                    "<descripcion>" + obj.vdescripcion + "</descripcion>" +
                    "<idvariable>" + obj.vidvariable + "</idvariable>" +
                    "<idlinea>" + obj.vidlinea + "</idlinea>" +
                    "<idunidadnegocio>" + obj.vidunidadnegocio + "</idunidadnegocio>" +
                    "<descproveedor>" + obj.vdescproveedor + "</descproveedor>" +
                    "<descresponsable>" + obj.vdescresponsable + "</descresponsable>" +
                    "<descunidadnegocio>" + obj.vcunidadnegocio + "</descunidadnegocio>" +
                    "<descturnotrabajo>" + obj.vdescunidadnegocio + "</descturnotrabajo>" +
                    "<descsucursal>" + obj.vdescsucursal + "</descsucursal>" +
                    "<desctipomuestra>" + obj.vdesctipomuestra + "</desctipomuestra>" +
                    "<descvariable>" + obj.vdescvariable + "</descvariable>" +
                    "<desclinea>" + obj.vdesclinea + "</desclinea>" +
                    "<descalmacen>" + obj.vdescalmacen + "</descalmacen>" +
                    "<dato5/>" +
                    "<usaconsolidado/>" +
                "</certificado>" +
            "</datos>";

            string xmlStringDetail = "";

            if (arrayDetail != null && arrayDetail.Count != 0)
            {
                string xmlStringDetail1 = "<?xml version='1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<datos>";
                string xmlStringDetail2 = "";

                foreach (var i in arrayDetail)
                {
                    string detarray = "<dcertficado>" +
                    "<idempresa>" + obj.vidempresa + "</idempresa>" +
                    "<idcertificado>" + obj.vidcertificado + "</idcertificado>" +
                    "<item>" + i.vcitem + "</item>" +
                    "<idproducto> " + i.vcidproducto + "</idproducto>" +
                    "<descripcion> " + i.vcdesproducto + "</descripcion>" +
                    "<idmedida>" + i.vcidmedida + "</idmedida>" +
                    "<cantidad>" + i.vcantidad + "</cantidad>" +
                    "<idvariable>" + obj.vidvariable + "</idvariable>" +
                    "<cnt_muestra>" + i.vcantidadmuetra + "</cnt_muestra>" +
                    "<idconsumidor>" + i.vidconsumidor + "</idconsumidor>" +
                    "<lote>" + i.vlote + "</lote>" +
                    "<stock>" + i.vstock + "</stock>" +
                    "<idreferencia>" + i.vidreferencia + "</idreferencia>" +
                    "<tablaref/>" +
                    "</dcertficado>";
                    xmlStringDetail2 += detarray;

                }


                string xmlStringDetail3 = "</datos>";

                xmlStringDetail = xmlStringDetail1 + xmlStringDetail2 + xmlStringDetail3;
            }
            else
            {
                xmlStringDetail = "<?xml version='1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<datos />";
            }

            string xmlStringFormato = "";


            if (arrayDetail != null && arrayDetail.Count != 0)
            {
                string xmlStringFormato1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                                            "<datos>";
                var xmlStringFormato2 = "";
                foreach (var i in arrayDetail)
                {

                    if (newformato != null && newformato.Count != 0)
                    {

                        foreach (var j in newformato)
                        {
                            string formarray = "<ddcertficado>" +
                            "<idempresa>" + obj.vidempresa + "</idempresa>" +
                            "<idcertificado>" + obj.vidcertificado + "</idcertificado>" +
                            "<item>" + j.vcitem + "</item>" +
                            "<itemd>" + i.vcitem + "</itemd>" +
                            "<idvariable>" + j.vidvariable + "</idvariable>" +
                            "<estructura>" + j.vestructura + "</estructura>" +
                            "<etiqueta>" + j.vetiqueta + "</etiqueta>" +
                            "<especificacion/>" + j.vetiqueta + "<especificacion/>" +
                            "<es_titulo>" + j.vestitulo + "</es_titulo>" +
                            "<nivel>" + j.vnivel + "</nivel>" +
                            "<resultado_oi>" + j.vresultado_oi + "</resultado_oi>" +
                            "<resultado>" + j.vresultado + "</resultado>" +
                            "<porcentajemuestra>" + j.vporcentajemuestra + "</porcentajemuestra>" +
                            "<valorporcentaje>" + j.vvalorporcentaje + "</valorporcentaje>" +
                            "<tipodato>" + j.vtipodato + "</tipodato>" +
                            "<ginicio>" + j.vginicio + "</ginicio>" +
                            "<gfin>" + j.vgfin + "</gfin>" +
                            "<oinicio>" + j.voinicio + "</oinicio>" +
                            "<ofin>" + j.vofin + "</ofin>" +
                            "<rinicio>" + j.vrinicio + "</rinicio>" +
                            "<rfin>" + j.vrfin + "</rfin>" +
                            "<es_critica>" + j.ves_critica + "</es_critica>" +
                            "<tiporango>" + j.vtiporango + "</tiporango>" +
                            "<color>" + j.vcolor + "</color>" +
                            "<dato_evaluar>" + j.vdato_evaluar + "</dato_evaluar>" +
                            "<otros/>" +
                            "<idtipo_input>" + j.vidtipo_input + "</idtipo_input>" +
                            "<itemref>" + j.vitemref + "</itemref>" +
                            "</ddcertficado>";

                            xmlStringFormato2 += formarray;

                        }

                    }
                    else
                    {
                        xmlStringFormato = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                        "<datos />";
                    }

                }
                string xmlStringFormato3 = "</datos>";
                xmlStringFormato = xmlStringFormato1 + xmlStringFormato2 + xmlStringFormato3;
            }

            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vcXML_CAB = xmlStringHead;
            EntCertNis.vcXML_DET = xmlStringDetail;
            EntCertNis.vcXML_DDET = xmlStringFormato;
            EntCertNis.vidusuario = obj.vidusuario;
            EntCertNis.vimei = obj.vimei;
            DataSet ds = NegCertNis.RegiCertificadoCalidad(EntCertNis);
            DataTable dt = ds.Tables[0];

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row; 

            if (ds.Tables["get"].Rows[0]["ID"].ToString() != null)
            {
                string cMensaje = ds.Tables["get"].Rows[0]["mensaje"].ToString();
                string nId = ds.Tables["get"].Rows[0]["ID"].ToString();
                EntCertNis.vcidcertificado = nId;
                DataSet dsx = NegCertNis.RegiCertificadoCalidad_2do(EntCertNis);
                DataTable dtt = dsx.Tables[0];

                foreach (DataRow dr in dtt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dtt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
            }
            else {
                //Serializacion
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

            }



            return serializer.Serialize(rows);

        }

        [WebMethod]
        public object XmlUpdateCertificadoCalidad(CertificadoCalidadBE obj, List<CertificadoCalidadBE> arrayDetail, List<CertificadoCalidadBE> newformato)
        {

            string xmlStringHead = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
              "<datos>" +
                "<certificado>" +
                    "<idempresa>" + obj.vidempresa + "</idempresa>" +
                    "<idcertificado>" + obj.vidcertificado + "</idcertificado>" +
                    "<idemisor>001</idemisor>" +
                    "<periodo>" + obj.vidperiodo + "</periodo>" +
                    "<idestadoc>A</idestadoc>" +
                    "<origen_certificado>M</origen_certificado>" +
                    "<idsucursal>" + obj.vidsucursal + "</idsucursal>" +
                    "<idalmacen>" + obj.vidalmacen + "</idalmacen>" +
                    "<iddocumento>" + obj.viddocumento + "</iddocumento>" +
                    "<serie>" + obj.vidserie + "</serie>" +
                    "<numero>" + obj.vnumero + "</numero>" +
                    "<idestado>PE</idestado>" +
                    "<fecha>" + obj.vcFecha + "</fecha>" +
                    "<tcambio>" + obj.vtcambio + "</tcambio>" +
                    "<idclieprov>" + obj.vidclieprov + "</idclieprov>" +
                    "<idresponsable>" + obj.vidresponsable + "</idresponsable>" +
                    "<idturnotrabajo>" + obj.vidturnotrabajo + "</idturnotrabajo>" +
                    "<glosa>" + obj.vglosa + "</glosa>" +
                    "<nromanual/>" +
                    "<ventana>EDT_CERTIFICADO_CALIDADES</ventana>" +
                    "<idreferencia>" + obj.vidreferencia + "</idreferencia>" +
                    "<evaluador>" + obj.vevaluador + "</evaluador>" +
                    "<tipomuestra>" + obj.vidtipomuestra + "</tipomuestra>" +
                    "<descripcion>" + obj.vdescripcion + "</descripcion>" +
                    "<idvariable>" + obj.vidvariable + "</idvariable>" +
                    "<idlinea>" + obj.vidlinea + "</idlinea>" +
                    "<idunidadnegocio>" + obj.vidunidadnegocio + "</idunidadnegocio>" +
                    "<descproveedor>" + obj.vdescproveedor + "</descproveedor>" +
                    "<descresponsable>" + obj.vdescresponsable + "</descresponsable>" +
                    "<descunidadnegocio>" + obj.vcunidadnegocio + "</descunidadnegocio>" +
                    "<descturnotrabajo>" + obj.vdescunidadnegocio + "</descturnotrabajo>" +
                    "<descsucursal>" + obj.vdescsucursal + "</descsucursal>" +
                    "<desctipomuestra>" + obj.vdesctipomuestra + "</desctipomuestra>" +
                    "<descvariable>" + obj.vdescvariable + "</descvariable>" +
                    "<desclinea>" + obj.vdesclinea + "</desclinea>" +
                    "<descalmacen>" + obj.vdescalmacen + "</descalmacen>" +
                    "<dato5/>" +
                    "<usaconsolidado/>" +
                "</certificado>" +
            "</datos>";

            string xmlStringDetail = "";

            if (arrayDetail != null && arrayDetail.Count != 0)
            {
                string xmlStringDetail1 = "<?xml version='1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<datos>";
                string xmlStringDetail2 = "";

                foreach (var i in arrayDetail)
                {
                    string detarray = "<dcertficado>" +
                    "<idempresa>" + obj.vidempresa + "</idempresa>" +
                    "<idcertificado>" + obj.vidcertificado + "</idcertificado>" +
                    "<item>" + i.vcitem + "</item>" +
                    "<idproducto> " + i.vcidproducto + "</idproducto>" +
                    "<descripcion> " + i.vcdesproducto + "</descripcion>" +
                    "<idmedida>" + i.vcidmedida + "</idmedida>" +
                    "<cantidad>" + i.vcantidad + "</cantidad>" +
                    "<idvariable>" + obj.vidvariable + "</idvariable>" +
                    "<cnt_muestra>" + i.vcantidadmuetra + "</cnt_muestra>" +
                    "<idconsumidor>" + i.vidconsumidor + "</idconsumidor>" +
                    "<lote>" + i.vlote + "</lote>" +
                    "<stock>" + i.vstock + "</stock>" +
                    "<idreferencia>" + i.vidreferencia + "</idreferencia>" +
                    "<tablaref/>" +
                    "</dcertficado>";
                    xmlStringDetail2 += detarray;

                }


                string xmlStringDetail3 = "</datos>";

                xmlStringDetail = xmlStringDetail1 + xmlStringDetail2 + xmlStringDetail3;
            }
            else
            {
                xmlStringDetail = "<?xml version='1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<datos />";
            }

            string xmlStringFormato = "";


   
                string xmlStringFormato1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                                            "<datos>";
                var xmlStringFormato2 = "";

                    if (newformato != null && newformato.Count != 0)
                    {

                        foreach (var j in newformato)
                        {
                            string formarray = "<ddcertficado>" +
                            "<idempresa>" + obj.vidempresa + "</idempresa>" +
                            "<idcertificado>" + obj.vidcertificado + "</idcertificado>" +
                            "<item>" + j.vcitem + "</item>" +
                            "<itemd>" + j.vcitemd + "</itemd>" +
                            "<idvariable>" + j.vidvariable + "</idvariable>" +
                            "<estructura>" + j.vestructura + "</estructura>" +
                            "<etiqueta>" + j.vetiqueta + "</etiqueta>" +
                            "<especificacion/>" + j.vetiqueta + "<especificacion/>" +
                            "<es_titulo>" + j.vestitulo + "</es_titulo>" +
                            "<nivel>" + j.vnivel + "</nivel>" +
                            "<resultado_oi>" + j.vresultado_oi + "</resultado_oi>" +
                            "<resultado>" + j.vresultado + "</resultado>" +
                            "<porcentajemuestra>" + j.vporcentajemuestra + "</porcentajemuestra>" +
                            "<valorporcentaje>" + j.vvalorporcentaje + "</valorporcentaje>" +
                            "<tipodato>" + j.vtipodato + "</tipodato>" +
                            "<ginicio>" + j.vginicio + "</ginicio>" +
                            "<gfin>" + j.vgfin + "</gfin>" +
                            "<oinicio>" + j.voinicio + "</oinicio>" +
                            "<ofin>" + j.vofin + "</ofin>" +
                            "<rinicio>" + j.vrinicio + "</rinicio>" +
                            "<rfin>" + j.vrfin + "</rfin>" +
                            "<es_critica>" + j.ves_critica + "</es_critica>" +
                            "<tiporango>" + j.vtiporango + "</tiporango>" +
                            "<color>" + j.vcolor + "</color>" +
                            "<dato_evaluar>" + j.vdato_evaluar + "</dato_evaluar>" +
                            "<otros/>" +
                            "<idtipo_input>" + j.vidtipo_input + "</idtipo_input>" +
                            "<itemref>" + j.vitemref + "</itemref>" +
                            "</ddcertficado>";

                            xmlStringFormato2 += formarray;

                        }

                    }
                    else
                    {
                        
                        xmlStringFormato = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                        "<datos />";
                    }
                string xmlStringFormato3 = "</datos>";
                xmlStringFormato = xmlStringFormato1 + xmlStringFormato2 + xmlStringFormato3;
   

            EntCertNis.vidempresa = obj.vidempresa;
            EntCertNis.vcXML_CAB = xmlStringHead;
            EntCertNis.vcXML_DET = xmlStringDetail;
            EntCertNis.vcXML_DDET = xmlStringFormato;
            EntCertNis.vidusuario = obj.vidusuario;
            EntCertNis.vimei = obj.vimei;
            DataSet ds = NegCertNis.RegiCertificadoCalidad(EntCertNis);
            DataTable dt = ds.Tables[0];

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            if (ds.Tables["get"].Rows[0]["ID"].ToString() != null)
            {
                string cMensaje = ds.Tables["get"].Rows[0]["mensaje"].ToString();
                string nId = ds.Tables["get"].Rows[0]["ID"].ToString();
                EntCertNis.vcidcertificado = nId;
                DataSet dsx = NegCertNis.RegiCertificadoCalidad_2do(EntCertNis);
                DataTable dtt = dsx.Tables[0];

                foreach (DataRow dr in dtt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dtt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
            }
            else
            {
                //Serializacion
                foreach (DataRow dr in dt.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dt.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }

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
