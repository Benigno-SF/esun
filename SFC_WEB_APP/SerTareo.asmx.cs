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
    /// Descripción breve de SerTareo
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerTareo : System.Web.Services.WebService
    {
        TareoBE EntTareo = new TareoBE();
        TareoBL NegTareo = new TareoBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object XmlRegiCertificadoCalidad(TareoBE obj, List<TareoBE> arrayDetail, List<TareoBE> newformato)
        {

            string xmlStringTg30tar = "<?xml version=''1.0'' encoding=''ISO-8859-1'' ?>" +
                "<Tg30tar>" +
                  "<ctg30dbid>" + obj.vctg30dbid + "</ctg30dbid>" +
                  "<ctg30empid>" + obj.vctg30empid + "</ctg30empid>" +
                  "<ctg30tarid>" + obj.vctg30tarid + "</ctg30tarid>" +
                  "<ctg30respid>" + obj.vctg30respid + "</ctg30respid>" +
                  "<dfechacreacion>" + obj.vdfechacreacion + "</dfechacreacion>" +
                  "<dfechaprogr>" + obj.vdfechaprogr + "</dfechaprogr>" +
                  "<cestado>" + obj.vcestado + "</cestado>" +
                  "<cidplanilla>" + obj.vcidplanilla + "</cidplanilla>" +
                  "<ciddocumento>" + obj.vciddocumento + "</ciddocumento>" +
                  "<cserie>" + obj.vcserie + "</cserie>" +
                  "<cnumero>" + obj.vcnumero + "</cnumero>" +
                  "<cidemisor>" + obj.vcidemisor + "</cidemisor>" +
                  "<cperiodo></cperiodo>" +
                  "<cidsucursal>" + obj.vcidsucursal + "</cidsucursal>" +
                  "<cidturnotrabajo>" + obj.vcidturnotrabajo + "</cidturnotrabajo>" +
                  "<cidgrupotrabajo></cidgrupotrabajo>" +
                  "<ctg30proyid></ctg30proyid>" +
                  "<csemana></csemana>" +
                  "<cidcontrata></cidcontrata>" +
                  "<cperiodo__planilla></cperiodo__planilla>" +
                  "<imei></imei>" +
                  "<ctg30taridorig>" + obj.vctg30taridorig + "</ctg30taridorig>" +
                  "<iespretareo>" + obj.viespretareo + "</iespretareo>" +
                  "<cidpretareo></cidpretareo>" +
                  "<cdescresponsable>" + obj.vcdescresponsable + "</cdescresponsable>" +
                  "<icerrado>" + obj.vicerrado + "</icerrado>" +
                  "<ialtitud>" + obj.vialtitud + "</ialtitud>" +
                  "<ilatitud>" + obj.vilatitud + "</ilatitud>" +
                  "<ilongitud>" + obj.vilongitud + "</ilongitud>" +
                  "<ctg30respsuperiorid>" + obj.vctg30respsuperiorid + "</ctg30respsuperiorid>" +
                  "<cdescresponsablesuperior>" + obj.vcdescresponsablesuperior + "</cdescresponsablesuperior>" +
                  "<ienvioparcial>" + obj.vienvioparcial + "</ienvioparcial>" +
                  "<cdescsucursal>" + obj.vcdescsucursal + "</cdescsucursal>" +
                  "<cdescplanilla>" + obj.vcdescplanilla + "</cdescplanilla>" +
                  "<ctg30cultivoid></ctg30cultivoid>" +
                  "<cdesccultivo></cdesccultivo>" +
                  "<ctg30trabrespid></ctg30trabrespid>" +
                  "<capenomtrabresp></capenomtrabresp>" +
                 "</Tg30tar>";

            string xmlStringTg20tar = "<?xml version=''1.0'' encoding=''ISO-8859-1'' ?>" +
                "<list>" +
                    "<Tg20tar>" +
                    "<ctg30dbid>" + obj.vctg30dbid + "</ctg30dbid>" +
                    "<ctg30empid>" + obj.vctg30empid + "</ctg30empid>" +
                    "<ctg30tarid>" + obj.vctg30tarid + "</ctg30tarid>" +
                    "<citem>" + obj.vcitem + "</citem>" +
                    "<ctg30actid>" + obj.vctg30actid + "</ctg30actid>" +
                    "<ctg30labid>" + obj.vctg30labid + "</ctg30labid>" +
                    "<ctg30consid>" + obj.vctg30consid + "</ctg30consid>" +
                    "<dfechacreacion></dfechacreacion>" +
                    "<ihabilitado>" + obj.vihabilitado + "</ihabilitado>" +
                    "<cestado>" + obj.vcestado + "</cestado>" +
                    "<crendimiento>" + obj.vcrendimiento + "</crendimiento>" +
                    "<dparametro>" + obj.vdparametro + "</dparametro>" +
                    "<dequivalehora>" + obj.vdequivalehora + "</dequivalehora>" +
                    "<cdescactividad>" + obj.vdequivalehora + "</cdescactividad>" +
                    "<cdesclabor>" + obj.vdequivalehora + "</cdesclabor>" +
                    "<cdescconsumidor>" + obj.vdequivalehora + "</cdescconsumidor>" +
                    "<cidturno>" + obj.vdequivalehora + "</cidturno>" +
                    "<cdescturno>" + obj.vdequivalehora + "</cdescturno>" +
                    "<cidtipogenasistencia>" + obj.vdequivalehora + "</cidtipogenasistencia>" +
                    "<cdesctipogenasistencia>" + obj.vdequivalehora + "</cdesctipogenasistencia>" +
                    "<ctg30proyid></ctg30proyid>" +
                    "<cdescproyecto></cdescproyecto>" +
                    "<ctg30respid>" + obj.vctg30respid + "</ctg30respid>" +
                    "<cdescresponsable>" + obj.vcdescresponsable + "</cdescresponsable>" +
                    "<ctg30targrupoid>" + obj.vctg30targrupoid + "</ctg30targrupoid>" +
                    "<cdescgrupo>GRUPO 1</cdescgrupo>" +
                    "<icondestare>0</icondestare>" +
                    "<iconteogrupal>0</iconteogrupal>" +
                    "<ilongitud>0.0</ilongitud>" +
                    "<ilatitud>0.0</ilatitud>" +
                    "<ialtitud>0.0</ialtitud>" +
                    "<iavanceporarea>0.0</iavanceporarea>" +
                    "<ctg30consid__multiple></ctg30consid__multiple>" +
                    "<idensidadccosto>0.0</idensidadccosto>" +
                    "<ctg30cultivoid>    </ctg30cultivoid>" +
                    "<cdesccultivo></cdesccultivo>" +
                    "<ctg30variedadid>   </ctg30variedadid>" +
                    "<cdescvariedad></cdescvariedad>" +
                    "<igendesdeconteoindividual>0</igendesdeconteoindividual>" +
                    "<ctg30cultivofiltroid></ctg30cultivofiltroid>" +
                    "<cdesccultivofiltro></cdesccultivofiltro>" +
                    "<iavanceobligatorio>0.0</iavanceobligatorio>" +
                    "<ctg30fundofiltro></ctg30fundofiltro>" +
                    "<cdescfundofiltro></cdescfundofiltro>" +
                    "</Tg20tar>" +
                    "</list>";

            string xmlStringDetail = "";

            if (arrayDetail != null && arrayDetail.Count != 0)
            {
                string xmlStringDetail1 = "<?xml version='1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<datos>";
                string xmlStringDetail2 = "";

                foreach (var i in arrayDetail)
                {
                    string detarray = "<dcertficado>";

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
                            string formarray = "<ddcertficado>";
                            // "<idempresa>" + obj.idempresa + "</idempresa>" +


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




            // return serializer.Serialize(rows);
            return "";
        }


        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

        // funcion listar dta usuarios
        [WebMethod]
        public object SER_listar_data_usuario(TareoBE obj)
        {
            // receptionamos las varaiables.
            EntTareo.DNI = obj.DNI;

            DataSet dsx = NegTareo.BL_listar_data_usuario(EntTareo);
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
        // funcion registrar grupo
        [WebMethod]
        public object SER_registrar_grupo(TareoBE obj)
        {
            // capturmoas el usuario
            //HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            //string nombre_usuario = GetCookie["cd_user"].ToString();

            // receptionamos las varaiables.
            EntTareo.vdnirespgrupo = obj.vdnirespgrupo;
            EntTareo.vdatosrespgrupo = obj.vdatosrespgrupo;
            EntTareo.vusuariogrupo = obj.vusuariogrupo;
            EntTareo.vfechagrupo = obj.vfechagrupo;
            EntTareo.META = Convert.ToInt32(obj.META);
            EntTareo.vidtareo = obj.vidtareo;
            EntTareo.videnvase = obj.videnvase;

            DataSet dsx = NegTareo.BL_registrar_grupo(EntTareo);
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

        // funcion registrar detalle grupo
        [WebMethod]
        public object SER_registrar_detalle_grupo(TareoBE obj)
        {
            // receptionamos las varaiables.
            EntTareo.vdid = obj.vdid;
            EntTareo.vditem = obj.vditem;
            EntTareo.vdcodtrabajdor = obj.vdcodtrabajdor;
            EntTareo.vddatostrabajdor = obj.vddatostrabajdor;
            EntTareo.vdtipo = obj.vdtipo;
            EntTareo.vdmeta = Convert.ToInt32(obj.vdmeta);
            EntTareo.vidtareo_detalle = obj.vidtareo_detalle;

            DataSet dsx = NegTareo.BL_registrar_detalle_grupo(EntTareo);
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

        // funcion para listar grupo
        [WebMethod]
        public object SER_listar_grupo(TareoBE obj)
        {
            //// capturmoas el usuario
            //HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            //string nombre_usuario = GetCookie["cd_user"].ToString();

            // receptionamos las varaiables.
            EntTareo.vusuario = obj.vusuario;
            EntTareo.vtfehcagrupo = obj.vtfehcagrupo;
            EntTareo.vtipo = obj.vtipo;
            EntTareo.idgrupo = Convert.ToInt32(obj.idgrupo);
            EntTareo.AVCITEMID = obj.AVCITEMID;

            DataSet dsx = NegTareo.BL_listar_grupo(EntTareo);
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

        // funcion para listar grupo -detalle
        [WebMethod]
        public object SER_listar_detalle_grupo(TareoBE obj)
        {
            // capturmoas el usuario
            //HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            //string nombre_usuario = GetCookie["cd_user"].ToString();

            // receptionamos las varaiables.
            EntTareo.vusuario = obj.vusuario;
            EntTareo.vtfehcagrupo = obj.vtfehcagrupo;
            EntTareo.vtipo = obj.vtipo;
            EntTareo.idgrupo = Convert.ToInt32(obj.idgrupo);

            DataSet dsx = NegTareo.BL_listar_detalle_grupo(EntTareo);
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



        // funcion para listar grupo -detalle
        [WebMethod]
        public object SER_listar_detalle_grupo_1(TareoBE obj)
        {
            // capturmoas el usuario
            //HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            //string nombre_usuario = GetCookie["cd_user"].ToString();

            // receptionamos las varaiables.
            EntTareo.vusuario = obj.vusuario;
            EntTareo.vtfehcagrupo = obj.vtfehcagrupo;
            EntTareo.vtipo = obj.vtipo;
            EntTareo.idgrupo = Convert.ToInt32(obj.idgrupo);

            DataSet dsx = NegTareo.BL_listar_detalle_grupo(EntTareo);
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

        // funcion para listar respnsosbale - grupo
        [WebMethod]
        public object SER_listar_labor_combinaciones(TareoBE obj)
        {
            // capturmoas el usuario
            //HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            //string nombre_usuario = GetCookie["cd_user"].ToString();

            // receptionamos las varaiables.
            EntTareo.vrgempresa = obj.vrgempresa;
            EntTareo.vrgbaseddatos = obj.vrgbaseddatos;
            EntTareo.vrgtipo = obj.vrgtipo;
            EntTareo.vridactividad = obj.vridactividad;
            EntTareo.vrgfecha = obj.vrgfecha;
            EntTareo.vrusuario = obj.vrusuario;


            DataSet dsx = NegTareo.BL_listar_labor_combinaciones(EntTareo);
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

        // funcion elimianr detalle grupo
        [WebMethod]
        public object SER_eliminar_detalle_grupo(TareoBE obj)
        {
            // receptionamos las varaiables.
            EntTareo.vdid = obj.vdid;
            EntTareo.vditem = obj.vditem;
            EntTareo.vdcodtrabajdor = obj.vdcodtrabajdor;
            EntTareo.vddatostrabajdor = obj.vddatostrabajdor;
            EntTareo.vdtipo = obj.vdtipo;
            EntTareo.vdmeta = Convert.ToInt32(obj.vdmeta);
            EntTareo.vidtareo_detalle = obj.vidtareo_detalle;

            DataSet dsx = NegTareo.BL_eliminar_detalle_grupo(EntTareo);
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

        // funcion listar tareo
        [WebMethod]
        public object SER_listar_tareo(TareoBE obj)
        {
            // receptionamos las varaiables.
            EntTareo.vtareocabid = obj.vtareocabid;
            EntTareo.vtareocabfecha = obj.vtareocabfecha;
            EntTareo.vtareocabtipo = obj.vtareocabtipo;
            EntTareo.vtitem_ini = obj.vtitem_ini;
            EntTareo.idResponsable = obj.idResponsable;

            DataSet dsx = NegTareo.BL_listar_tareo(EntTareo);
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

        // funcion registrar cabere de tareo 
        [WebMethod]
        public object SER_registrar_cabecera_tareo(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.TUSUARIO = obj.TUSUARIO;
            EntTareo.TCTG30RESPONSABLE = obj.TCTG30RESPONSABLE;
            EntTareo.TCIDPLANILLA = obj.TCIDPLANILLA;
            EntTareo.TIDSUCURSAL = obj.TIDSUCURSAL;
            EntTareo.TFECHA = obj.TFECHA;
            EntTareo.TESTADO = obj.TESTADO;

            DataSet dsx = NegTareo.BL_registrar_cabecera_tareo(EntTareo);
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

        // funcion registrar combinaciones
        [WebMethod]
        public object SER_registrar_combinaciones(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.CCTG30TARID = obj.CCTG30TARID;
            EntTareo.CCTG30ACTID = obj.CCTG30ACTID;
            EntTareo.CCIDTURNO = obj.CCIDTURNO;
            EntTareo.CCTG30LABID = obj.CCTG30LABID;
            EntTareo.CIDTIPOGENASISTENCIA = obj.CIDTIPOGENASISTENCIA;
            EntTareo.CCDESCTIPOGENASISTENCIA = obj.CCDESCTIPOGENASISTENCIA;
            EntTareo.CCIDSUPERVISOR = obj.CCIDSUPERVISOR;
            EntTareo.CCIDRESPONSABLE = obj.CCIDRESPONSABLE;
            EntTareo.CCDESCRESPONSABLE = obj.CCDESCRESPONSABLE;
            EntTareo.CCIDGRUPO = obj.CCIDGRUPO;
            EntTareo.CCCDESCGRUPO = obj.CCCDESCGRUPO;
            EntTareo.CCTG30CONSID = obj.CCTG30CONSID;
            EntTareo.IDGT = obj.IDGT;

            DataSet dsx = NegTareo.BL_registrar_combinaciones(EntTareo);
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

        // funcion registrar trabajdores por labor
        [WebMethod]
        public object SER_registrar_trabajador_por_labor(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.CTCTG20TARID = obj.CTCTG20TARID;
            EntTareo.CTCTG30TRABID = obj.CTCTG30TRABID;
            EntTareo.CTCITEM = obj.CTCITEM;
            EntTareo.CTDHORAINICIO = obj.CTDHORAINICIO;
            EntTareo.CTDHORAFIN = obj.CTDHORAFIN;

            DataSet dsx = NegTareo.BL_registrar_trabajador_por_labor(EntTareo);
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

        // funcion ACTULIZAR AVANCE TRABAJDOR¿R
        [WebMethod]
        public object SER_editar_rend_trabajador(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.RTCTG30TARID = obj.RTCTG30TARID;
            EntTareo.RTCTG30TRABID = obj.RTCTG30TRABID;
            EntTareo.RTIRENDIMIENTO = obj.RTIRENDIMIENTO;
            EntTareo.RTCITEMID = obj.RTCITEMID;
            EntTareo.RTCDITEMID = obj.RTCDITEMID;
            EntTareo.RTCITEM = obj.RTCITEM;

            DataSet dsx = NegTareo.BL_editar_rend_trabajador(EntTareo);
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

        // funcion ACTULIZAR TRABAJDO¿R
        [WebMethod]
        public object SER_registrar_avance_trab(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.AVCTG30TARID = obj.AVCTG30TARID;
            EntTareo.AVCTG30TRABID = obj.AVCTG30TRABID;
            EntTareo.AVIRENDIMIENTO = Convert.ToInt32(obj.AVIRENDIMIENTO);
            EntTareo.AVCITEMID = obj.AVCITEMID;

            DataSet dsx = NegTareo.BL_registrar_avance_trab(EntTareo);
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

        // funcion listrar rend TRABAJador up
        [WebMethod]
        public object SER_listar_rend_trab_up(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.LRTcUsuario_up = obj.LRTcUsuario_up;
            EntTareo.LRTcFecha_up = obj.LRTcFecha_up;
            EntTareo.LRTtipo_up = obj.LRTtipo_up;
            EntTareo.LRTitem_up = obj.LRTitem_up;

            DataSet dsx = NegTareo.BL_listar_rend_trab_up(EntTareo);
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

        // funcion editar jornal
        [WebMethod]
        public object SER_editar_jornal_trabajador(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.LTJCTG20TARID = obj.LTJCTG20TARID;
            EntTareo.LTJCTG30TRABID = obj.LTJCTG30TRABID;
            EntTareo.LTJCITEMID = obj.LTJCITEMID;
            EntTareo.LTJDHORAINICIO = Convert.ToDateTime(obj.LTJDHORAINICIO);
            EntTareo.LTJDHORAFIN = Convert.ToDateTime(obj.LTJDHORAFIN);

            DataSet dsx = NegTareo.BL_listar_rend_trab_up(EntTareo);
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

        // funcion LISTAR ZONA
        [WebMethod]
        public object SER_listar_zona(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.ZID = obj.ZID;

            DataSet dsx = NegTareo.BL_listar_zona(EntTareo);
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

        // funcion actulizar datos  del los trabahodres por jornal
        [WebMethod]
        public object SER_editar_jornal_trabajador_indiv(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.LTJCTG20TARID = obj.LTJCTG20TARID;
            EntTareo.LTJCTG30TRABID = obj.LTJCTG30TRABID;
            EntTareo.LTJCITEMID = obj.LTJCITEMID;
            EntTareo.LTJDHORAINICIO = obj.LTJDHORAINICIO;
            EntTareo.LTJDHORAFIN = obj.LTJDHORAFIN;

            DataSet dsx = NegTareo.BL_editar_jornal_trabajador_indiv(EntTareo);
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

        // listar trababjro x labor
        [WebMethod]
        public object SER_listra_x_labor(TareoBE obj)
        {

            EntTareo.vusuario = obj.vusuario;
            EntTareo.vtfehcagrupo = obj.vtfehcagrupo;
            EntTareo.vtipo = obj.vtipo;
            EntTareo.idgrupo = obj.idgrupo;
            EntTareo.vcitem = obj.vcitem; 

            DataSet dsx = NegTareo.BL_listar_x_labor(EntTareo);
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

        // listar trababjro x labor
        [WebMethod]
        public object SER_listra_x_labor2(TareoBE obj)
        {

            EntTareo.vusuario = obj.vusuario;
            EntTareo.vtfehcagrupo = obj.vtfehcagrupo;
            EntTareo.vtipo = obj.vtipo;
            EntTareo.idgrupo = Convert.ToInt32(obj.idgrupo);
            EntTareo.vcitem = obj.vcitem;

            DataSet dsx = NegTareo.BL_listar_x_labor2(EntTareo);
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

        // listar alimiNR GRUPO
        [WebMethod]
        public object SER_eliminar_grupo(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.grupo_elim_CTG30TARID = obj.grupo_elim_CTG30TARID;
            EntTareo.grupo_elim_TABLA = obj.grupo_elim_TABLA;
            EntTareo.grupo_elim_CSERIE = obj.grupo_elim_CSERIE;
            EntTareo.grupo_elim_CNUMERO = obj.grupo_elim_CNUMERO;
            EntTareo.grupo_elim_CTG30TRABID = obj.grupo_elim_CTG30TRABID;
            EntTareo.grupo_elim_CITEMID = obj.grupo_elim_CITEMID;
            EntTareo.grupo_elim_CITEM = obj.grupo_elim_CITEM;
            EntTareo.grupo_elim_CTG30ACTID = obj.grupo_elim_CTG30ACTID;
            EntTareo.grupo_elim_CTG30LABID = obj.grupo_elim_CTG30LABID;
            EntTareo.grupo_elim_CTG30CONSID = obj.grupo_elim_CTG30CONSID;
            EntTareo.grupo_elim_IDGT = Convert.ToInt32(obj.grupo_elim_IDGT);
            EntTareo.grupo_elim_COD_RESP = obj.grupo_elim_COD_RESP;
            EntTareo.grupo_elim_NRO_GRUPO = Convert.ToInt32(obj.grupo_elim_NRO_GRUPO);
            EntTareo.grupo_elim_COD_TRAB = obj.grupo_elim_COD_TRAB;

            DataSet dsx = NegTareo.BL_eliminar_grupo(EntTareo);
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

        // listar  envase
        [WebMethod]
        public object SER_listar_envase(TareoBE obj)
        {

            // receptionamos las varaiables.
            DataSet dsx = NegTareo.BL_listar_envase(EntTareo);
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

        //Cambio de Erick

        [WebMethod]
        public object BuscarNombreporDni(TareoBE obj)
        {
            EntTareo.vctg30targrupoid = obj.vctg30targrupoid;
            EntTareo.AVCITEMID = obj.AVCITEMID;
            EntTareo.nombre = obj.nombre;
            DataSet ds = NegTareo.BuscarNombrePorDni(EntTareo);
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



        // FUNCION  ELIMIANR TRAAJDOR
        [WebMethod]
        public object SER_eliminar_trab_por_jornal(TareoBE obj)
        {

            // receptionamos las varaiables.
            EntTareo.jornal_elim_CTG30TARID = obj.LTJCTG20TARID;
            EntTareo.jornal_elim_CITEMID = obj.LTJCITEMID;
            EntTareo.jornal_elim_CTG30TRABID = obj.LTJCTG30TRABID;
            DataSet dsx = NegTareo.BL_eliminar_trab_por_jornal(EntTareo);
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