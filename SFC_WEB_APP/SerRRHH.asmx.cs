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
    /// Descripción breve de SerRRHH
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerRRHH : System.Web.Services.WebService
    {
        EventoProgBL NegEventoProg = new EventoProgBL();
        EventoProgBE EntEventoProg = new EventoProgBE();

        EventoProgDetalleBL NegEventoDetalleProg = new EventoProgDetalleBL();
        EventoProgDetalleBE EntEventoDetalleProg = new EventoProgDetalleBE();

        PersonalBE EntPersonal = new PersonalBE();
        PersonalBL NegPersonal = new PersonalBL();

        TicketAlimentoBE EntTick = new TicketAlimentoBE();
        TicketAlimentoBL NegTick = new TicketAlimentoBL();

        DocumentoBE EntFiles = new DocumentoBE();
        DocumentoBL NegFiles = new DocumentoBL();

        AsistenciaBE EntAsistencia = new AsistenciaBE();
        AsistenciaBL NegAsistencia = new AsistenciaBL();

        FichaMesBE EntFichaMes = new FichaMesBE();
        FichaMesBL NegFichaMes = new FichaMesBL();

        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();

        FichaPersonalBE EntFichaPersonal = new FichaPersonalBE();
        FichaPersonalBL NegFichaPersonal = new FichaPersonalBL();

        ConsNisiraBE EntConsNisira = new ConsNisiraBE();
        ConsNisiraBL NegConsNisira = new ConsNisiraBL();

        PersonaBE EntPersona = new PersonaBE();
        PersonaBL NegPersona = new PersonaBL();

        SmsBE EntSms = new SmsBE();

        DispositivoBE EntDevice = new DispositivoBE();
        DispositivoBL NegDevice = new DispositivoBL();

        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        ConsNisiraBE EntConsNis = new ConsNisiraBE();
        ConsNisiraBL NegConsNis = new ConsNisiraBL();

        TablaCecoBE EntCeco = new TablaCecoBE();

        UtilBL negUtil = new UtilBL();


        
        [WebMethod]
        public object HistoricoIngresosSalidas(ConsNisiraBE obj)
        {
            EntConsNis.vcEmpresa = obj.vcEmpresa;
            DataSet dsx = NegConsNis.HistoricoIngresos(EntConsNis);
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
        public object ListGrupoTrabajo(ConsNisiraBE obj)
        {
            EntConsNis.vnIdGrupo = obj.vnIdGrupo;
            EntConsNis.vcDescripcion = obj.vcDescripcion;
            EntConsNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegConsNis.ListGrupoTrabajo(EntConsNis);
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
        public object ListAsistenciaPersonal(ConsNisiraBE obj)
        {
            EntConsNis.vcEmpresa = obj.vcEmpresa;
            EntConsNis.vcFecha = obj.vcFecha;
            EntConsNis.vcFechaFin = obj.vcFechaFin;
            EntConsNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegConsNis.ListAsistenciaPersonal(EntConsNis);
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
        public object ListVacacionesPersonal(ConsNisiraBE obj)
        {
            EntConsNis.vcCodigo = obj.vcCodigo;
            EntConsNis.vnIdGrupo = obj.vnIdGrupo;
            EntConsNis.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegConsNis.ListVacacionesPersonal(EntConsNis);
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
        public object RepoResumenHorasPersonal(ConsNisiraBE obj)
        {
            EntConsNis.vcIdEmpresa = obj.vcIdEmpresa;
            EntConsNis.vcFecha = obj.vcFecha;
            EntConsNis.vcFechaFin = obj.vcFechaFin;
            EntConsNis.vnIdPlanilla = obj.vnIdPlanilla;
            EntConsNis.vPorFecha = obj.vPorFecha;
            EntConsNis.vcType = obj.vcType;

            EntConsNis.vcCecos = obj.vcCecos;
            EntConsNis.vcIdActividad = obj.vcIdActividad;

            EntConsNis.vPorConcepto = 1;
            EntConsNis.vResumen = 0;

            EntConsNis.vcIdTipoPersonal = obj.vcIdTipoPersonal;
            EntConsNis.vPara1 = 0;
            EntConsNis.vPara2 = 0;
            EntConsNis.vPara3 = 0;
            DataSet dsx = NegConsNis.RepoResumenHorasPersonal(EntConsNis);
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
        public object SyncRaptop(string obj, string urlrv)
        {
            var jsonObject = new object();
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            ServicePointManager.CertificatePolicy = new MyPolicy();


                var url = urlrv;
                var request = (HttpWebRequest)WebRequest.Create(url);
                string json = obj;
                request.Method = "POST";
                request.Headers.Add("Authorization", "Token 399a129740460d4112dc1624f710265b1ee81e4d");
                request.ContentType = "application/json";
                request.Accept = "application/json";
                using (var streamWriter = new StreamWriter(request.GetRequestStream()))
                {
                    streamWriter.Write(json);
                    streamWriter.Flush();
                    streamWriter.Close();
                }
                try
                {
                    using (WebResponse response = request.GetResponse())
                    {
                        using (Stream strReader = response.GetResponseStream())
                        {
                            if (strReader == null) jsonObject = "Error "; ;
                            using (StreamReader objReader = new StreamReader(strReader))
                            {
                                string responseBody = objReader.ReadToEnd();
                                // Do something with responseBody
                                Console.WriteLine(responseBody);
                            }
                        }
                    }
                }
                catch (WebException ex)
                {
                    jsonObject = "Error " + ex;
                }

            return jsonObject;
        }


        public void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public object SendMail(ConsNisiraBE obj, string pdf)
        {


            string htmlString = @"<html>
                      <body>
<table width='100%' height='100%' style='min-width: 348px' border='0' cellspacing='0' cellpadding='0' >
        <tbody>
            <tr height='32' style='height: 32px'>
                <td></td>
            </tr>
            <tr align='center'>
                <td>
                    <div>
                        <div></div>
                    </div>
                    <table border='0' cellspacing='0' cellpadding='0' style='padding-bottom: 20px; max-width: 516px; min-width: 220px'>
                        <tbody>
                            <tr>
                                <td width='8' style='width: 8px'></td>
                                <td>
                                    <div style='border-style: solid; border-width: thin; border-color: #dadce0; border-radius: 8px; padding: 40px 20px' align='center' class='m_-8574579123633485019mdv2rw'>
                                        <img src='http://esun.sunfruits.com.pe/img/sf-logo.png' width='150' aria-hidden='true' style='margin-bottom: 16px' alt='Sunfruits' class='CToWUd'><div style='font-family: 'Google Sans',Roboto,RobotoDraft,Helvetica,Arial,sans-serif; border-bottom: thin solid #dadce0; color: rgba(0,0,0,0.87); line-height: 32px; padding-bottom: 24px; text-align: center; word-break: break-word'>
                                            <div style='font-size: 20px'>LIQUIDACION : PARTICIPACION EN LAS UTILIDADES POR EL EJERCICIO GRAVABLE AÑO 2021</div>
                                            <table align='center' style='margin-top: 8px'>
                                                <tbody>
                                                    <tr style='line-height: normal'>
                                                        <td><a style='font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif; color: rgba(0,0,0,0.87); font-size: 16px; line-height: 20px'>";
            string htmlString2 = @"</a></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; font-size: 14px; color: rgba(0,0,0,0.87); line-height: 20px; padding-top: 20px; text-align: center'>El presente documento contiene el detalle del cálculo de la participación de Utilidades de acuerdo DL Nº 892.
                                        <div style='padding-top: 32px; text-align: center'>
                                            <a href='";
            string htmlString3 = @"' style='font-family: Roboto,RobotoDraft,Helvetica,Arial,sans-serif; line-height: 16px; color: #ffffff; font-weight: 400; text-decoration: none; font-size: 14px; display: inline-block; padding: 10px 24px; background-color: #4184f3; border-radius: 5px; min-width: 90px' target='_blank' data-saferedirecturl=''>Descargar Comprobante Utilidad</a></div>
<div class='text-right' style='text-align: right'><img width='20' height='20' style='width: 20px; height: 20px; vertical-align: sub; border-radius: 50%' src='https://lh3.googleusercontent.com/a-/AAuE7mCWJZDh4O5bOMd3HuubiXI0jbpcyjBvsoHoPehY=s96' alt='' class='CToWUd'></div>
                                        </div>
                                    </div>
                                    <div style='text-align: left'>
                                        <div style='font-family: Roboto-Regular,Helvetica,Arial,sans-serif; color: rgba(0,0,0,0.54); font-size: 11px; line-height: 18px; padding-top: 12px; text-align: center'>
                                            <div>Para consultas por favor comunicarse con el siguiente correo <a href='mailto: cuenta @deemail.com'>recursoshumanos@sunfruits.com.pe</a></div>
                                              <div>© 2021 Sun Fruits Exports S.A.</div>
                                        </div>
                                    </div>
                                </td>
                                <td width='8' style='width: 8px'></td><td align='right' style='text-align:rigth'></ts>                     
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr height='32' style='height: 32px'>
                <td></td>
            </tr>
        </tbody>
    </table>
                      </body>
                      </html>
                     ";
            //mail.BodyHtml = htmlString;
            string htmlString4 = "http://esun.sunfruits.com.pe/Mod_App/Wfo_RepView/?Cd=iOSoj9CXOnnbgHw5p9jlfQ==&wXml=";
            string htmlString5 = "&wCrt=Crt_Utilidades&wExp=2&wCan=0";


            string htmlStringBody = "";
            string asunto = "";

            if (obj.vnDetalle == 1)
            {
                asunto = "LIQUIDACION : PARTICIPACION EN LAS UTILIDADES POR EL EJERCICIO GRAVABLE AÑO 2021";
                htmlStringBody = htmlString + obj.vcNombre + htmlString2 + htmlString4 + pdf + htmlString5 + htmlString3;
            }
            else if (obj.vnDetalle == 2)
            {
                asunto = obj.vcAsuntoEmail;
                htmlStringBody = obj.vcMensaje;
            };


            string rpta = "";
            EntConsNis.vnIdEmpresa = 1;
            EntConsNis.vcType = "EMAIL";
            DataSet ds = NegConsNis.ListCredenciales(EntConsNis);
            if (ds.Tables[0].Rows.Count == 1)
            {
                string nombre = ds.Tables["get"].Rows[0]["cNombre"].ToString();
                string cuenta = ds.Tables["get"].Rows[0]["cCuenta"].ToString();
                string password = ds.Tables["get"].Rows[0]["cPassword"].ToString();
                string smpt = ds.Tables["get"].Rows[0]["cSMTP"].ToString();
                Int32 port = Convert.ToInt32(ds.Tables["get"].Rows[0]["nPuerto"].ToString()); ;


                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                mail.IsBodyHtml = true;
                mail.From = new MailAddress(cuenta, nombre, Encoding.UTF8);
                mail.Subject = asunto; //asunto del correo
                mail.Body = htmlStringBody;
                string[] to = new String[] { obj.vcEmail }; //Correos inventados
                for (int i = 0; i < to.Length; i++)
                {
                    string item = to[i];
                    mail.To.Add(new MailAddress(item));
                }
                //Configuración SMTP
                SmtpClient smtpClient = new SmtpClient(smpt, port);
                smtpClient.UseDefaultCredentials = false;
                smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new NetworkCredential(cuenta, password, smpt);
                smtpClient.SendCompleted += new SendCompletedEventHandler(SendCompletedCallback);

                try
                {
                    EntConsNis.vcCodigo = pdf;
                    EntConsNis.vcType = "EMAIL";
                    EntConsNis.vcEstado = "1";
                    DataSet dsx = NegConsNis.LogEnvioInf(EntConsNis);

                    smtpClient.Send(mail);
                    rpta = "Mensaje Enviado";
                }
                catch (Exception ex)
                {
                    rpta = "Exception caught in CreateTestMessage2(): {0}," + ex.ToString();
                }
            }
            else
            {
                rpta = "Error al obtener informacion de Correo";
            }
            return rpta;
        }



        [WebMethod]
        public object RepUtilidad(ConsHispBE obj)
        {
            List<string> lstRtrn = new List<string>();
            string ruta = Server.MapPath("~/temp");

            EntNisira.vcIdEmpresa = "001";
            EntNisira.vcAmbito = "2"; //1=OBR-AOC-OAS-HVG-ORG //2=ERG
            EntNisira.vcPeriodo = "202204";
            EntNisira.vcSemana = "";
            EntNisira.vcCodigo = obj.vcCodigo;

            DataSet dsx = NegNisira.RepUtilidad(EntNisira);
            DataTable dt = dsx.Tables[0];


            if (!Directory.Exists(ruta))
                Directory.CreateDirectory(ruta);
            string NoXml = "RepUtilidad" + DateTime.Now.ToString("mmssfff") + obj.vcCodigo;
            string DiXml = ruta + "/" + NoXml + ".xml";

            dsx.WriteXml(DiXml, XmlWriteMode.WriteSchema);


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
            };
            if (dsx.Tables[0].Rows.Count > 0)
            {
                row = new Dictionary<string, object>();
                row.Add("pdf", NoXml);
                rows.Add(row);
            }


            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object RegiCapacitacionesNis(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcCodigo = obj.vcCodigo;
            EntConsNisira.vcType = obj.vcType;
            EntConsNisira.vcLugar = obj.vcLugar;
            EntConsNisira.vcNombre = obj.vcNombre;
            EntConsNisira.vcDetalle = obj.vcDetalle;
            EntConsNisira.vcExpositor = obj.vcExpositor;
            EntConsNisira.vcEstado = obj.vcEstado;
            EntConsNisira.vcFecha = obj.vcFecha;
            EntConsNisira.vcFechaFin = obj.vcFechaFin;
            EntConsNisira.vcDuracion = obj.vcDuracion;

            DataSet dsx = NegConsNisira.RegiCapacitacionesNisira(EntConsNisira);
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

        public static bool RemoteFileExists(string url, int timeout)
        {
            try
            {
                //var myRequest = (HttpWebRequest)WebRequest.Create(url);
                HttpWebRequest myRequest = (HttpWebRequest)HttpWebRequest.Create(url);

                myRequest.Timeout = timeout;

                var response = (HttpWebResponse)myRequest.GetResponse();

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        [WebMethod]
        public object SendSmsLocal(SmsBE obj)
        {
            EntDevice.vnIdEmpresa = 1;
            EntDevice.vnIdDispositivo = 0;
            EntDevice.vcTipo = "SSMS";
            DataSet ds = NegDevice.ListDispositivos(EntDevice);

            string[] stringArray = new string[ds.Tables[0].Columns.Count];


            for (int col = 0; col < ds.Tables[0].Columns.Count; ++col)
            {
                stringArray[col] = ds.Tables[0].Rows[0][col].ToString();
            }

            var gatewaysmsip = stringArray[4];

            string url = "http://" + gatewaysmsip + "/v1/sms";
            bool pagestatus = RemoteFileExists(url, 5000);

            if (pagestatus == true)
            {


                ServicePointManager.CertificatePolicy = new MyPolicy();
                var jsonObject = new object();
                try
                {
                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                    req.KeepAlive = false;
                    req.ProtocolVersion = HttpVersion.Version10;
                    req.Method = "POST";

                    var postData = "&phone=+51" + obj.cNumCel;
                    postData += "&message=" + obj.cDescSms;

                    req.ContentType = "application/x-www-form-urlencoded";
                    byte[] postBytes = System.Text.Encoding.UTF8.GetBytes(postData);
                    //byte[] postBytes = Encoding.UTF8.GetBytes(postData);
                    req.ContentLength = postBytes.Length;
                    Stream requestStream = req.GetRequestStream();
                    requestStream.Write(postBytes, 0, postBytes.Length);
                    requestStream.Close();
                    //
                    HttpWebResponse response = (HttpWebResponse)req.GetResponse();
                    Stream resStream = response.GetResponseStream();
                    //
                    var sr = new StreamReader(response.GetResponseStream());
                    var serializer = new JavaScriptSerializer();
                    jsonObject = sr.ReadToEnd();
                }
                catch (Exception ee)
                {

                }
                return jsonObject;
            }
            else
            {
                var jsonObject = new object();
                jsonObject = "NOT";
                return jsonObject;
            }
        }

        [WebMethod]
        public object SendSmsExt(SmsBE obj)
        {
            string url = "http://172.16.16.27/sms/sendSms.php";
            bool pagestatus = RemoteFileExists(url, 5000);

            if (pagestatus == true)
            {


                ServicePointManager.CertificatePolicy = new MyPolicy();
                var jsonObject = new object();
                try
                {
                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                    req.KeepAlive = false;
                    req.ProtocolVersion = HttpVersion.Version10;
                    req.Method = "POST";

                    var postData = "&numero=+51" + obj.cNumCel;
                    postData += "&mensaje=" + obj.cDescSms;

                    req.ContentType = "application/x-www-form-urlencoded";
                    byte[] postBytes = System.Text.Encoding.UTF8.GetBytes(postData);
                    //byte[] postBytes = Encoding.UTF8.GetBytes(postData);
                    req.ContentLength = postBytes.Length;
                    Stream requestStream = req.GetRequestStream();
                    requestStream.Write(postBytes, 0, postBytes.Length);
                    requestStream.Close();
                    //
                    HttpWebResponse response = (HttpWebResponse)req.GetResponse();
                    Stream resStream = response.GetResponseStream();
                    //
                    var sr = new StreamReader(response.GetResponseStream());
                    var serializer = new JavaScriptSerializer();
                    jsonObject = sr.ReadToEnd();
                }
                catch (Exception ee)
                {

                }
                return jsonObject;
            }
            else
            {
                var jsonObject = new object();
                jsonObject = "NOT";
                return jsonObject;
            }
        }

        [WebMethod]
        public object SendSms22222(SmsBE obj)
        {

            string url = "https://smsgateway.me/api/v4/message/send";

            ServicePointManager.CertificatePolicy = new MyPolicy();
            var jsonObject = new object();
            try
            {
                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                req.ContentType = "application/json";
                //req.Headers.Add("Authorization", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhZG1pbiIsImlhdCI6MTU2MzIyMjkwMywiZXhwIjo0MTAyNDQ0ODAwLCJ1aWQiOjcxNjg3LCJyb2xlcyI6WyJST0xFX1VTRVIiXX0.XAgNwpmm_GzHciVRf82t_GCfgp5haVdL6eUCbq6fWyQ");
                req.KeepAlive = false;
                req.ProtocolVersion = HttpVersion.Version10;
                req.Method = "POST";

                /* var postData = "&phone_number=+51979352782";
                 postData += "&message=SGCSMS";
                 postData += "&device_id=113593";*/

                using (var streamWriter = new StreamWriter(req.GetRequestStream()))
                {
                    string json = new JavaScriptSerializer().Serialize(new
                    {
                        phone_number = "+51977522986",
                        message = "SGCSMS",
                        device_id = "113593"
                    });

                    streamWriter.Write(json);

                    req.ContentType = "application/x-www-form-urlencoded";
                    byte[] postBytes = System.Text.Encoding.ASCII.GetBytes(json);
                    req.ContentLength = postBytes.Length;
                    Stream requestStream = req.GetRequestStream();
                    requestStream.Write(postBytes, 0, postBytes.Length);
                    requestStream.Close();

                    HttpWebResponse response = (HttpWebResponse)req.GetResponse();
                    Stream resStream = response.GetResponseStream();
                    //
                    var sr = new StreamReader(response.GetResponseStream());
                    var serializer = new JavaScriptSerializer();
                    jsonObject = sr.ReadToEnd();
                }

                /* req.ContentType = "application/x-www-form-urlencoded";
                  byte[] postBytes = System.Text.Encoding.ASCII.GetBytes(json);
                  req.ContentType = "application/x-www-form-urlencoded";
                  req.ContentLength = postBytes.Length;
                  Stream requestStream = req.GetRequestStream();
                  requestStream.Write(postBytes, 0, postBytes.Length);
                  requestStream.Close();*/
                //

            }
            catch (Exception ee)
            {
                string abc = ee.ToString();

            }
            return jsonObject;
        }

        public class MyPolicy : ICertificatePolicy
        {
            public bool CheckValidationResult(ServicePoint srvPoint,
              System.Security.Cryptography.X509Certificates.X509Certificate certificate, WebRequest request,
              int certificateProblem)
            {
                //Return True to force the certificate to be accepted.
                return true;
            }
        }

        [WebMethod]
        public int SeleccionarPersonal(PersonaBE obj)
        {
            EntPersona.vcIds = obj.vcIds;
            EntPersona.vnEstado = obj.vnEstado;
            return NegPersona.SeleccionarPersonal(EntPersona);
        }

        [WebMethod]
        public object DeleteSeleccion(PersonaBE obj)
        {
            EntPersona.vnIdPersona = obj.vnIdPersona;
            EntPersona.vnEstado = obj.vnEstado;
            return NegPersona.DeleteSeleccion(EntPersona);
        }

        [WebMethod]
        public object ListPreInscripcion(PersonaBE obj)
        {
            EntPersona.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            DataSet dsx = NegPersona.ListPreInscripcion(EntPersona);
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

        //
        [WebMethod]
        public object InformeTareasCampo(ConsHispBE obj)
        {
            EntHisp.vcFecha = obj.vcFecha;
            EntHisp.vcUsuario = GetParamCokkie("cd_user");
            DataSet ds = NegHisp.InformeTareasCampo(EntHisp);
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        //
        [WebMethod]
        public object PersonaList(PersonaBE obj)
        {
            EntPersona.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersona.vnIdPersona = obj.vnIdPersona;
            EntPersona.vcNroDocumento = obj.vcNroDocumento;
            EntPersona.vcNombres = obj.vcNombres;
            EntPersona.vnEstado = obj.vnEstado;
            EntPersona.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegPersona.ListPersona(EntPersona);
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
        public object PersonaList2x(PersonaBE obj)
        {
            EntPersona.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            var dt2 = NegPersona.ListPersona2x(EntPersona).Tables[0];

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt2.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt2.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object SyncTareo(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcAnio = obj.vcAnio;
            EntConsNisira.vcSemana = obj.vcSemana;
            DataSet dsx = NegConsNisira.SyncTareo(EntConsNisira);
            DataTable dt = dsx.Tables[0];
            // Serializacion

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
        public object ListVisualizaTareo(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcAnio = obj.vcAnio;
            EntConsNisira.vcSemana = obj.vcSemana;
            DataSet dsx = NegConsNisira.ListVisualizaTareo(EntConsNisira);
            DataTable dt = dsx.Tables[0];
            DataTable dv = dsx.Tables[1];
            DataTable dw = dsx.Tables[2];
            DataTable dx = dsx.Tables[3];
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
            foreach (DataRow dr in dv.Rows)
            {
                row2 = new Dictionary<string, object>();
                foreach (DataColumn col in dv.Columns)
                {
                    row2.Add(col.ColumnName, dr[col]);
                }
                rows2.Add(row2);
            }

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;
            foreach (DataRow dr in dw.Rows)
            {
                row3 = new Dictionary<string, object>();
                foreach (DataColumn col in dw.Columns)
                {
                    row3.Add(col.ColumnName, dr[col]);
                }
                rows3.Add(row3);
            }

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;
            foreach (DataRow dr in dx.Rows)
            {
                row4 = new Dictionary<string, object>();
                foreach (DataColumn col in dx.Columns)
                {
                    row4.Add(col.ColumnName, dr[col]);
                }
                rows4.Add(row4);
            }

            var data = new
            {
                dh = rows,
                dd = rows2,
                df = rows3,
                da = rows4
            };
            return serializer.Serialize(data);
        }

        [WebMethod]
        public object FichaMesList(FichaMesBE obj)
        {
            EntFichaMes.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFichaMes.vnIdFicha = obj.vnIdFicha;
            EntFichaMes.vnIdFichaMes = obj.vnIdFichaMes;
            DataSet dsx = NegFichaMes.ListFichaMes(EntFichaMes);
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
        public object FichaPersonalList(FichaPersonalBE obj)
        {
            EntFichaPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFichaPersonal.vnIdFicha = obj.vnIdFicha;
            EntFichaPersonal.vnIdFichaPersonal = obj.vnIdFichaPersonal;
            EntFichaPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntFichaPersonal.vnAnio = obj.vnAnio;
            EntFichaPersonal.vnMes = obj.vnMes;
            DataSet dsx = NegFichaPersonal.FichaPersonalList(EntFichaPersonal);
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
        public object InicFinMes(FichaMesBE obj)
        {
            EntFichaMes.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFichaMes.vnIdFicha = obj.vnIdFicha;
            EntFichaMes.vnIdFichaMes = obj.vnIdFichaMes;
            EntFichaMes.vnMes = obj.vnMes;
            EntFichaMes.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegFichaMes.RegiFichaMes(EntFichaMes);
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
        public object ListPersonalNuevo(PersonalBE obj)
        {
            DataTable dt2;
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;

            dt2 = NegPersonal.ListPersonalNuevo(EntPersonal).Tables[0];

            //DataTable dt2 = new DataTable();
            //dt2.Columns.AddRange(new DataColumn[10] { new DataColumn("nIdPersonal"), new DataColumn("cNroDocumento"), new DataColumn("cApPaterno"), new DataColumn("cApMaterno"), new DataColumn("cNombres"), new DataColumn("cSexo"), new DataColumn("dFechaNac"), new DataColumn("dFechaRegistro"), new DataColumn("bEstado"), new DataColumn("nEstado") });

            //foreach (DataRow rowx in dt.Rows)
            //{
            //        string url = "https://http://172.16.16.27/reniec/reniec_api.php";
            //        ServicePointManager.CertificatePolicy = new MyPolicy();
            //    //var jsonObject = new object();
            //    string jsonObject;

            //        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            //        req.KeepAlive = false;
            //        req.ProtocolVersion = HttpVersion.Version10;
            //        req.Method = "GET";
            //        req.ContentType = "application/x-www-form-urlencoded";
            //        byte[] postBytes = System.Text.Encoding.ASCII.GetBytes("dni=" + rowx["cNroDocumento"].ToString());
            //        req.ContentType = "application/x-www-form-urlencoded";
            //        req.ContentLength = postBytes.Length;
            //        Stream requestStream = req.GetRequestStream();
            //        requestStream.Write(postBytes, 0, postBytes.Length);
            //        requestStream.Close();
            //        //
            //        HttpWebResponse response = (HttpWebResponse)req.GetResponse();
            //        Stream resStream = response.GetResponseStream();
            //        //
            //        var sr = new StreamReader(response.GetResponseStream());
            //        jsonObject = sr.ReadToEnd();
            //        var objx = JsonConvert.DeserializeObject<personalJson>(jsonObject);
            //        foreach (var personal in objx.DatosPerson)
            //        {
            //            var sex = ""; if (personal.Sexo == "2") { sex = "M"; } else if (personal.Sexo == "3") { sex = "F"; }
            //            dt2.Rows.Add(rowx["nIdPersonal"].ToString(), rowx["cNroDocumento"].ToString(), personal.ApellidoPaterno, personal.ApellidoMaterno, personal.Nombres, sex, personal.FechaNacimiento, rowx["dFechaRegistro"].ToString(), rowx["bEstado"].ToString(), rowx["nEstado"].ToString());
            //        }
            //}
            //Serializacion

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt2.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt2.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        public class personalJson
        {
            public List<personal> DatosPerson { get; set; }
        }
        public class personal
        {
            public string DNI { get; set; }
            public string ApellidoPaterno { get; set; }
            public string Nombres { get; set; }
            public string FechaNacimiento { get; set; }
            public string Sexo { get; set; }
            public string ApellidoMaterno { get; set; }
        }
        
        [WebMethod]
        public object RegiPersonalNuevo(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcApPaterno = obj.vcApPaterno;
            EntPersonal.vcApMaterno = obj.vcApMaterno;
            EntPersonal.vcNombres = obj.vcNombres;
            EntPersonal.vcSexo = obj.vcSexo;
            var frx = DateTime.ParseExact(obj.vcFechaNacimiento, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntPersonal.vdFechaNacimiento = frx.Date;
            var fry = DateTime.ParseExact(obj.vcFechaRegistro, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntPersonal.vdFechaRegistro = fry.Date;

            DataSet dsx = NegPersonal.RegiPersonalNuevo2(EntPersonal);
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
        public object DeletePersonalNuevo(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;

            DataSet dsx = NegPersonal.DeletePersonalNuevo(EntPersonal);
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
        public object AsistenciaList(AsistenciaBE obj)
        {
            EntAsistencia.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntAsistencia.vcFecha = obj.vcFecha;
            EntAsistencia.vnIdDispositivo = obj.vnIdDispositivo;

            DataSet dsx = NegAsistencia.ListAsistencia(EntAsistencia);
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
        public object EventoProgList(EventoProgBE obj)
        {
            EntEventoProg.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntEventoProg.vnIdEventoProg = obj.vnIdEventoProg;
            EntEventoProg.vcFecha = obj.vcFecha;

            DataSet dsx = NegEventoProg.EventoProgList(EntEventoProg);
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
        public object EventoProgDetalleList(EventoProgDetalleBE obj)
        {

            EntEventoDetalleProg.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntEventoDetalleProg.vnIdEventoProg = 1;
            // EntEventoDetalleProg.vnIdEventoProg = obj.vnIdEventoProg;

            DataSet dsx = NegEventoDetalleProg.EventoProgDetalleList(EntEventoDetalleProg);
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
        public object TicketAlimentosList(TicketAlimentoBE obj)
        {

            EntTick.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntTick.vnIdTipoEvento = obj.vnIdTipoEvento;
            EntTick.vcFecha = obj.vcFecha;

            DataSet dsx = NegTick.TicketAlimentosList(EntTick);
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
        public String EventoprogDetalleMov(EventoProgDetalleBE obj)
        {

            EntEventoDetalleProg.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntEventoDetalleProg.vnIdEventoProg = obj.vnIdEventoProg;
            EntEventoDetalleProg.vnIdTipoEvento = obj.vnIdTipoEvento;
            EntEventoDetalleProg.vnIdGrupo = obj.vnIdGrupo;
            EntEventoDetalleProg.vnIdArea = obj.vnIdArea;
            EntEventoDetalleProg.vdFechaInicio = Convert.ToDateTime(obj.vdFechaInicio);
            EntEventoDetalleProg.vdFechaFin = Convert.ToDateTime(obj.vdFechaFin);
            EntEventoDetalleProg.vnIdEstado = 1;
            EntEventoDetalleProg.vcUsuarioCrea = GetParamCokkie("cd_user");

            String vvMsje = NegEventoDetalleProg.RegiEventoDetalleProg(EntEventoDetalleProg);
            return vvMsje;
        }
        [WebMethod]
        public String EventoprogMov(EventoProgBE obj)
        {
            EntEventoProg.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntEventoProg.vnIdEventoProg = obj.vnIdEventoProg;
            EntEventoProg.vnIdTipoEvento = obj.vnIdTipoEvento;
            EntEventoProg.vdFechaEvento = Convert.ToDateTime(obj.vcFecha);
            EntEventoProg.vbConcluido = false;
            EntEventoProg.vcMenu = obj.vcMenu;
            EntEventoProg.vcDieta = obj.vcDieta;
            EntEventoProg.vcMensaje = obj.vcMensaje;
            EntEventoProg.vcUsuarioCrea = GetParamCokkie("cd_user");

            String vvMsje = NegEventoProg.RegiEventosProg(EntEventoProg);
            return vvMsje;
        }

        [WebMethod]
        public object SearchUser(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcNombres = obj.vcNombres;
            EntPersonal.vcIdPlanilla = obj.vcIdPlanilla;
            EntPersonal.vcCodigoLabor = obj.vcCodigoLabor;

            DataSet dsx = NegPersonal.ListPersonal(EntPersonal);
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
        public object ListPersonalNisira(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;

            DataSet dsx = NegPersonal.ListPersonalNisira(EntPersonal);
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
        public object VerifiImage(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcRutaImg = "";

            var ruta = obj.vcRutaImg;
            string cleandata = ruta.Replace("X:", "");
            FileInfo myFile = new FileInfo(@"\\172.16.16.16\Nisira File"+ cleandata);
            bool exists = myFile.Exists;

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            row = new Dictionary<string, object>();

            if (myFile.Exists.Equals(false))
            {
            DataSet dsx = NegPersonal.UpdatePersonalNisira(EntPersonal);
            DataTable dt = dsx.Tables[0];
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
            else
            {
                row.Add("updat", "NO ACTUALIZADO");
                rows.Add(row);
            }
            //Serializacion
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object UpdatePersonalNisira(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcRutaImg = obj.vcRutaImg;

            DataSet dsx = NegPersonal.UpdatePersonalNisira(EntPersonal);
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
        public object InsertarTablaCeco(string IdDocumento,
            string Apellidos_Nombres,
            string Cod_Planilla,
            string C_Costo,
            string Cod_Sucursal,
            string Cod_Actividad,
            string Cod_Labor,
            string Fecha_Inicio,
            string Fecha_Final,
            float Porcentaje)
        {
            int x = NegPersonal.InsertarDataTable(IdDocumento, Apellidos_Nombres, Cod_Planilla, C_Costo, Cod_Sucursal, Cod_Actividad, Cod_Labor, Fecha_Inicio, Fecha_Final, Porcentaje);
            return x;
        }

        [WebMethod]
        public object InsertarTablaCecoII(TablaCecoBE objeto)
        {
            EntCeco.IdDocumento = objeto.IdDocumento;
            EntCeco.Apellidos_Nombres = objeto.Apellidos_Nombres;
            EntCeco.Cod_Planilla = objeto.Cod_Planilla;
            EntCeco.C_Costo = objeto.C_Costo;
            EntCeco.Cod_Sucursal = objeto.Cod_Sucursal;
            EntCeco.Cod_Actividad = objeto.Cod_Actividad;
            EntCeco.Cod_Labor = objeto.Cod_Labor;
            EntCeco.Fecha_Inicio = objeto.Fecha_Inicio;
            EntCeco.Fecha_Final = objeto.Fecha_Final;
            EntCeco.Porcentaje = objeto.Porcentaje;

            int x = NegPersonal.InsertarDataTableII(EntCeco);
            return x;
        }

        [WebMethod]
        public List<string> EliminarTabla(string h) 
        {
            List<string> lista = new List<string>();
            lista = NegPersonal.EliminarTabla(h);
            return lista;
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

        [WebMethod]
        public object CountProv(TicketAlimentoBE obj)
        {           

            DataSet dsx = NegTick.CountProv(EntTick);
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
    }
}
