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
    public class SerPlanilla : System.Web.Services.WebService
    {
        // instanciamos a los metodos.
        PlanillaBE EntPlanilla = new PlanillaBE();
        PlanillaBL NegPlanilla = new PlanillaBL();

        [WebMethod]
        public object SER_listar_usuario(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            EntPlanilla.USUARIO_DNI = Convert.ToInt32(obj.USUARIO_DNI);
            DataSet dsx = NegPlanilla.BL_listar_usuario(EntPlanilla);
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
        public object SER_registro_documento(PlanillaBE obj)
        {
            // capturmoas el usuario
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string nombre_usuario = GetCookie["cd_user"].ToString();

            EntPlanilla.DOCUMENTO_FECHA_REGISTRO = obj.DOCUMENTO_FECHA_REGISTRO;
            EntPlanilla.DOCUMENTO_FECHA_INICIO = Convert.ToDateTime(obj.DOCUMENTO_FECHA_INICIO);
            EntPlanilla.DOCUMENTO_FECHA_FIN = Convert.ToDateTime(obj.DOCUMENTO_FECHA_FIN);
            EntPlanilla.DOCUMENTO_DIAS = obj.DOCUMENTO_DIAS;
            EntPlanilla.DOCUMENTO_CMP = obj.DOCUMENTO_CMP;
            EntPlanilla.DOCUMENTO_CODIGO_DIAGNOSTICO = obj.DOCUMENTO_CODIGO_DIAGNOSTICO;
            EntPlanilla.DOCUMENTO_DIAGNOSTICO = obj.DOCUMENTO_DIAGNOSTICO;
            EntPlanilla.DOCUMENTO_OBSERVACIONES = obj.DOCUMENTO_OBSERVACIONES;
            EntPlanilla.DOCUMENTO_PROVIENE = obj.DOCUMENTO_PROVIENE;
            EntPlanilla.DOCUMENTO_MOTIVO = obj.DOCUMENTO_MOTIVO;
            EntPlanilla.DOCUMENTO_DOCUMENTACION = obj.DOCUMENTO_DOCUMENTACION;
            EntPlanilla.DOCUMENTO_HORAS = obj.DOCUMENTO_HORAS;
            EntPlanilla.DOCUMENTO_LACTANTE = obj.DOCUMENTO_LACTANTE;
            EntPlanilla.DOCUMENTO_VINCULO_FAMILIAR = obj.DOCUMENTO_VINCULO_FAMILIAR;
            EntPlanilla.DOCUMENTO_FALLECIDO = obj.DOCUMENTO_FALLECIDO;
            EntPlanilla.DOCUMENTO_CASO = obj.DOCUMENTO_CASO;

            EntPlanilla.DOCUMENTO_ESTADO = obj.DOCUMENTO_ESTADO;
            EntPlanilla.DOCUMENTO_USUARIO = nombre_usuario;
            EntPlanilla.DOCUMENTO_USUARIO_MODIFICADO = nombre_usuario;
            EntPlanilla.DOCUMENTO_TIPO_DOCUMENTO_ID = Convert.ToInt32(obj.DOCUMENTO_TIPO_DOCUMENTO_ID);
            EntPlanilla.DOCUMENTO_PERSONAL_ID = Convert.ToInt32(obj.DOCUMENTO_PERSONAL_ID);

            DataSet dsx = NegPlanilla.BL_registro_documento(EntPlanilla);
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
        public object SER_listar_documento(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            //EntPlanilla.FECHA_ACTAUL_SISTEMA = obj.FECHA_ACTAUL_SISTEMA;
            DataSet dsx = NegPlanilla.BL_listar_documento(EntPlanilla);
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
        public object SER_listar_documento2(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            //EntPlanilla.FECHA_ACTAUL_SISTEMA = obj.FECHA_ACTAUL_SISTEMA;
            DataSet dsx = NegPlanilla.BL_listar_documento2(EntPlanilla);
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
        public object SER_listar_documento_individual(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            EntPlanilla.DOCUMENTO_ID = Convert.ToInt32(obj.DOCUMENTO_ID);
            DataSet dsx = NegPlanilla.BL_listar_documento_individual(EntPlanilla);
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
        public object SER_listar_tipo_registro(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegPlanilla.BL_listar_tipo_registro(EntPlanilla);
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
        public object SER_actualizar_documento(PlanillaBE obj)
        {
            // capturmoas el usuario
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string nombre_usuario = GetCookie["cd_user"].ToString();

            EntPlanilla.DOCUMENTO_ID = obj.DOCUMENTO_ID;
            EntPlanilla.DOCUMENTO_FECHA_REGISTRO = obj.DOCUMENTO_FECHA_REGISTRO;
            EntPlanilla.DOCUMENTO_FECHA_INICIO = Convert.ToDateTime(obj.DOCUMENTO_FECHA_INICIO);
            EntPlanilla.DOCUMENTO_FECHA_FIN = Convert.ToDateTime(obj.DOCUMENTO_FECHA_FIN);
            EntPlanilla.DOCUMENTO_DIAS = obj.DOCUMENTO_DIAS;
            EntPlanilla.DOCUMENTO_CMP = obj.DOCUMENTO_CMP;
            EntPlanilla.DOCUMENTO_CODIGO_DIAGNOSTICO = obj.DOCUMENTO_CODIGO_DIAGNOSTICO;
            EntPlanilla.DOCUMENTO_DIAGNOSTICO = obj.DOCUMENTO_DIAGNOSTICO;
            EntPlanilla.DOCUMENTO_OBSERVACIONES = obj.DOCUMENTO_OBSERVACIONES;
            EntPlanilla.DOCUMENTO_PROVIENE = obj.DOCUMENTO_PROVIENE;
            EntPlanilla.DOCUMENTO_MOTIVO = obj.DOCUMENTO_MOTIVO;
            EntPlanilla.DOCUMENTO_DOCUMENTACION = obj.DOCUMENTO_DOCUMENTACION;
            EntPlanilla.DOCUMENTO_HORAS = obj.DOCUMENTO_HORAS;
            EntPlanilla.DOCUMENTO_LACTANTE = obj.DOCUMENTO_LACTANTE;
            EntPlanilla.DOCUMENTO_VINCULO_FAMILIAR = obj.DOCUMENTO_VINCULO_FAMILIAR;
            EntPlanilla.DOCUMENTO_FALLECIDO = obj.DOCUMENTO_FALLECIDO;
            EntPlanilla.DOCUMENTO_CASO = obj.DOCUMENTO_CASO;
            EntPlanilla.DOCUMENTO_USUARIO_MODIFICADO = nombre_usuario;

            EntPlanilla.DOCUMENTO_ESTADO = obj.DOCUMENTO_ESTADO;
            EntPlanilla.DOCUMENTO_TIPO_DOCUMENTO_ID = obj.DOCUMENTO_TIPO_DOCUMENTO_ID;
            EntPlanilla.DOCUMENTO_PERSONAL_ID = obj.DOCUMENTO_PERSONAL_ID;

            DataSet dsx = NegPlanilla.BL_actulizar_documento(EntPlanilla);
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
        public object SER_anular_documento(PlanillaBE obj)
        {
            EntPlanilla.DOCUMENTO_ID = obj.DOCUMENTO_ID;
            EntPlanilla.DOCUMENTO_ESTADO = obj.DOCUMENTO_ESTADO;

            DataSet dsx = NegPlanilla.BL_anular_documento(EntPlanilla);
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
        public object SER_listar_fecha_documento(PlanillaBE obj)
        {
            EntPlanilla.FECHA_INICIO = obj.FECHA_INICIO;
            EntPlanilla.FECHA_FIN = obj.FECHA_FIN;

            DataSet dsx = NegPlanilla.BL_listar_fecha_documento(EntPlanilla);
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
        public object SER_listar_fechas(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            EntPlanilla.CERRAR_SEMANA_ID = Convert.ToInt32(obj.CERRAR_SEMANA_ID);
            DataSet dsx = NegPlanilla.BL_listar_fechas(EntPlanilla);
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
        public object SER_listar_fechas_semana(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            EntPlanilla.APERTURA_SEM_ANIO = Convert.ToInt32(obj.APERTURA_SEM_ANIO);
            EntPlanilla.APERTURA_SEM_ID = Convert.ToInt32(obj.APERTURA_SEM_ID);
            DataSet dsx = NegPlanilla.BL_listar_fechas_semana(EntPlanilla);
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
        public object SER_cerrar_semana_datos(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            EntPlanilla.CERRAR_SEMANA_ID =Convert.ToInt32(obj.CERRAR_SEMANA_ID);
            EntPlanilla.CERRAR_SEMANA_ANIO =Convert.ToInt32(obj.CERRAR_SEMANA_ANIO);
            EntPlanilla.FECHA_INICIO = obj.FECHA_INICIO;
            EntPlanilla.FECHA_FIN = Convert.ToString( obj.FECHA_FIN);
            DataSet dsx = NegPlanilla.BL_cerrar_semana_datos(EntPlanilla);
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
        public object SER_filtrar_semana_datos(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            EntPlanilla.FILTRO_FECHA_INI = obj.FILTRO_FECHA_INI;
            EntPlanilla.FILTRO_FIN =obj.FILTRO_FIN;
            DataSet dsx = NegPlanilla.BL_filtrar_semana_datos(EntPlanilla);
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
        public object SER_obtener_privilegio(PlanillaBE obj)
        {
            //HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            //string nombre_usuario = GetCookie["cd_user"].ToString();
            // receptionamos las varaiables.
            DataSet dsx = NegPlanilla.BL_obtener_privilegio(EntPlanilla);
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
        public object SER_registrar_cierre_semana_datos(PlanillaBE obj)
        {
            EntPlanilla.CERRAR_SEMANA_ID = obj.CERRAR_SEMANA_ID;
            EntPlanilla.CERRAR_SEMANA_ANIO = obj.CERRAR_SEMANA_ANIO;
            EntPlanilla.CERRAR_SEMANA_FECHA_INI = obj.CERRAR_SEMANA_FECHA_INI;
            EntPlanilla.CERRAR_SEMANA_FIN = obj.CERRAR_SEMANA_FIN;
            DataSet dsx = NegPlanilla.BL_registrar_cierre_semana_datos(EntPlanilla);

            DataTable dt = dsx.Tables[0];

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
        public object SER_aprobar_documento(PlanillaBE obj)
        {
            EntPlanilla.DOCUMENTO_ID = obj.DOCUMENTO_ID;
            EntPlanilla.DOCUMENTO_ESTADO = obj.DOCUMENTO_ESTADO;

            DataSet dsx = NegPlanilla.BL_aprobar_documento(EntPlanilla);
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
        public object SER_update_semana(PlanillaBE obj)
        {
            EntPlanilla.FECHA_INICIO = obj.FECHA_INICIO;
            EntPlanilla.FECHA_FIN = obj.FECHA_FIN;

            DataSet dsx = NegPlanilla.BL_update_semana(EntPlanilla);
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
        public object SER_consulta_docuemnto_cerrado(PlanillaBE obj)
        {
            EntPlanilla.FECHA_INICIO = obj.FECHA_INICIO;
            EntPlanilla.FECHA_FIN = obj.FECHA_FIN;

            DataSet dsx = NegPlanilla.BL_consulta_documento_cerrado(EntPlanilla);
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
        public object SER_bloquear_boton(PlanillaBE obj)
        {
            EntPlanilla.FECHA_INICIO = obj.FECHA_INICIO;
            EntPlanilla.FECHA_FIN = obj.FECHA_FIN;

            DataSet dsx = NegPlanilla.BL_bloquear_boton(EntPlanilla);
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
        public object SER_listar_anio(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegPlanilla.BL_listar_anio(EntPlanilla);
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
        public object SER_listar_semana(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegPlanilla.BL_listar_semana(EntPlanilla);
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
        public object SER_listar_semana_anio(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            //EntPlanilla.APERTURA_SEM_ANIO = Convert.ToInt32(obj.APERTURA_SEM_ANIO);
            EntPlanilla.SEMANA_ANIO_LIST = obj.SEMANA_ANIO_LIST;
            EntPlanilla.SEMANA_ANIO_MES = obj.SEMANA_ANIO_MES;
            DataSet dsx = NegPlanilla.BL_listar_semana_anio(EntPlanilla);
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
        public object SER_listar_semana_actual(PlanillaBE obj)
        {
            // receptionamos las varaiables.
            //EntPlanilla.FECHA_ACTAUL_SISTEMA = obj.FECHA_ACTAUL_SISTEMA;
            DataSet dsx = NegPlanilla.BL_listar_semana_actual(EntPlanilla);
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
        public string[] SER_listar_diagnostico_ini(PlanillaBE obj)
        {
            EntPlanilla.DOCUMENTO_CODIGO_DIAGNOSTICO = obj.DOCUMENTO_CODIGO_DIAGNOSTICO;
            return NegPlanilla.Array_listar_diagnostico(EntPlanilla);
        }
    }
}