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


namespace SFC_WEB_APP.Mod_App
{
    /// <summary>
    /// Descripción breve de SerApp
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerApp : System.Web.Services.WebService
    {
        MonitorSubLineaBE EntMoniSl = new MonitorSubLineaBE();
        MonitorSubLineaBL NegMoniSl = new MonitorSubLineaBL();

        MonitorBE EntMonitor = new MonitorBE();
        MonitorBL NegMonitor = new MonitorBL();

        TicketAlimentoBE EntTick = new TicketAlimentoBE();
        TicketAlimentoBL NegTick = new TicketAlimentoBL();

        AsistenciaBE EntAsis = new AsistenciaBE();
        AsistenciaBL NegAsis = new AsistenciaBL();

        TrackBE EntTrac = new TrackBE();
        TrackBL negTrac = new TrackBL();

        PersonalBE EntPersonal = new PersonalBE();
        PersonalBL NegPersonal = new PersonalBL();

        EventoProgBL NegEventoProg = new EventoProgBL();
        EventoProgBE EntEventoProg = new EventoProgBE();

        EventoProgDetalleBL NegEventoDetalleProg = new EventoProgDetalleBL();
        EventoProgDetalleBE EntEventoDetalleProg = new EventoProgDetalleBE();

        RendimientoProcesoDetalleBE EntDetProc = new RendimientoProcesoDetalleBE();
        RendimientoProcesoDetalleBL NegDetProc = new RendimientoProcesoDetalleBL();

        RendimientoProcesoRegistroBE EntRendProcRegi = new RendimientoProcesoRegistroBE();
        RendimientoProcesoRegistroBL NegRendProcRegi = new RendimientoProcesoRegistroBL();

        RendimientoProcesoRegistroBE EntRend = new RendimientoProcesoRegistroBE();
        RendimientoProcesoRegistroBL NegRend = new RendimientoProcesoRegistroBL();

        DispositivoBE entDisp = new DispositivoBE();
        DispositivoBL negDisp = new DispositivoBL();

        LecturaAPPBE objLeer = new LecturaAPPBE();

        RendimientoProcesoBE EntRendProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRendProc = new RendimientoProcesoBL();

        AreaGrupoClienteBE EntAreaGrupoCliente = new AreaGrupoClienteBE();
        AreaGrupoClienteBL NegAreaGrupoCliente = new AreaGrupoClienteBL();

        ControlGaritaBE EntControlGarita = new ControlGaritaBE();
        ControlGaritaBL NegControlGarita = new ControlGaritaBL();

        ConsHispBE EntConsHisp = new ConsHispBE();
        ConsHispBL NegConsHisp = new ConsHispBL();

        ConsNisiraBE EntConsNis = new ConsNisiraBE();
        ConsNisiraBL NegConsNis = new ConsNisiraBL();

        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();

        FichaRespuestaBE EntFRespuesta = new FichaRespuestaBE();
        FichaRespuestaBL NegFRespuesta = new FichaRespuestaBL();

        FichaPersonalBE EntFPersonal = new FichaPersonalBE();
        FichaPersonalBL NegFPersonal = new FichaPersonalBL();

        FichaMesBE EntFichaMes = new FichaMesBE();
        FichaMesBL NegFichaMes = new FichaMesBL();

        PersonaBE EntPersona = new PersonaBE();
        PersonaBL NegPersona = new PersonaBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();


        MonitorBE EntMoni = new MonitorBE();
        MonitorBL NegMoni = new MonitorBL();

        DispositivosMonitoreoBL dispositivosMonitoreoBL = new DispositivosMonitoreoBL();
        DispositivosMonitoreoBE dispositivosMonitoreoBE = new DispositivosMonitoreoBE();


        CultivoPackingBE EntCultivoPacking = new CultivoPackingBE();
        CultivoPackingBL NegCultivoPacking = new CultivoPackingBL();

        ParteproduccionBL parteproduccionBL = new ParteproduccionBL();

        CalidadReBL NegCalidadBL = new CalidadReBL();

        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        PrintPRN negPRN = new PrintPRN();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public string RegiPersonal(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcApPaterno = obj.vcApPaterno;
            EntPersonal.vcApMaterno = obj.vcApMaterno;
            EntPersonal.vcNombres = obj.vcNombres;
            EntPersonal.vcCodigoControl = obj.vcCodigoControl;
            EntPersonal.vcIdPlanilla = obj.vcIdPlanilla;
            EntPersonal.vcGrupoTrabajo = obj.vcGrupoTrabajo;
            EntPersonal.vcIdCodigoGeneral = obj.vcIdCodigoGeneral;
            EntPersonal.vcCodigoLabor = obj.vcCodigoLabor;
            EntPersonal.vbEstado = obj.vbEstado;
            EntPersonal.vnEstado = obj.vnEstado;
            EntPersonal.vcSexo = obj.vcSexo;
            var frx = DateTime.ParseExact(obj.vcFechaNacimiento, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntPersonal.vdFechaNacimiento = frx.Date;
            var fry = DateTime.ParseExact(obj.vcFechaRegistro, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntPersonal.vdFechaRegistro = fry.Date;
            String vvMsje = NegPersonal.RegiPersonal(EntPersonal);
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


        public string VerifiDoc(string vcFilename)
        {

            string folderPath = Server.MapPath("~/Mod_App/pdf/");
            string imagePath = folderPath + vcFilename;
            FileInfo myFile = new FileInfo(imagePath);

            if (myFile.Exists.Equals(true))
            {
                return "si";
            }
            else
            {
                return "no";
            }
        }

        [WebMethod]
        public object ConsultaRendimientoPersonal(RendimientoProcesoRegistroBE obj)
        {
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            DataSet dsx = NegRendProcRegi.ConsultaRendimientoPersonal(EntRendProcRegi);
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
        public object ListRendimientoProcesoRegistroRT(RendimientoProcesoRegistroBE obj)
        {
            EntRendProcRegi.vnIdEmpresa = 1;
            EntRendProcRegi.vnIdGrupo = obj.vnIdGrupo;
            EntRendProcRegi.vcFecha = obj.vcFecha;
            DataSet dsx = NegRendProcRegi.RendimientoProcesoRegistroListRT(EntRendProcRegi);
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

        public class Mail
        {
            string From = ""; //de quien procede, puede ser un alias
            string To;  //a quien vamos a enviar el mail
            string Message;  //mensaje
            string Subject; //asunto
            List<string> Archivo = new List<string>(); //lista de archivos a enviar
            string DE = "eespinoza@sunfruits.com.pe"; //nuestro usuario de smtp
            string PASS = ""; //nuestro password de smtp

            System.Net.Mail.MailMessage Email;

            public string error = "";

            public object Server { get; private set; }

            /// <summary>
            /// constructor
            /// </summary>
            /// <param name="FROM">Procedencia</param>
            /// <param name="Para">Mail al cual se enviara</param>
            /// <param name="Mensaje">Mensaje del mail</param>
            /// <param name="Asunto">Asunto del mail</param>
            /// <param name="ArchivoPedido_">Archivo a adjuntar, no es obligatorio</param>
            public Mail(string FROM, string Para, string Mensaje, string Asunto, List<string> ArchivoPedido_ = null)
            {
                From = FROM;
                To = Para;
                Message = Mensaje;
                Subject = Asunto;
                Archivo = ArchivoPedido_;

            }


            public bool enviaMail()
            {

                //una validación básica
                if (To.Trim().Equals("") || Message.Trim().Equals("") || Subject.Trim().Equals(""))
                {
                    error = "El mail, el asunto y el mensaje son obligatorios";
                    return false;
                }

                //aqui comenzamos el proceso
                //comienza-------------------------------------------------------------------------
                try
                {
                    //creamos un objeto tipo MailMessage
                    //este objeto recibe el sujeto o persona que envia el mail,
                    //la direccion de procedencia, el asunto y el mensaje
                    Email = new System.Net.Mail.MailMessage(From, To, Subject, Message);

                    //si viene archivo a adjuntar
                    //realizamos un recorrido por todos los adjuntos enviados en la lista
                    //la lista se llena con direcciones fisicas, por ejemplo: c:/pato.txt
                    if (Archivo != null)
                    {
                        //agregado de archivo
                        foreach (string archivo in Archivo)
                        {
                            //comprobamos si existe el archivo y lo agregamos a los adjuntos
                            //if (System.IO.File.Exists(@archivo))
                            //    Email.Attachments.Add(new Attachment(@archivo));

                            //string folderPath = Server.MapPath("~/Mod_App/pdf/archivo.pdf");
                            //string imagePath = folderPath;//+ obj.vcFilename;
                            //FileInfo myFile = new FileInfo(imagePath);

                            //if (myFile.Exists.Equals(true))
                            //{
                            //    Email.Attachments.Add(new Attachment(@archivo));
                            //}

                        }
                    }



                    Email.IsBodyHtml = true; //definimos si el contenido ser
                                        Email.From = new MailAddress(From); //definimos la direccion de procedencia

                    //aqui creamos un objeto tipo SmtpClient el cual recibe el servidor que utilizaremos como smtp
                    //en este caso me colgare de gmail
                    //System.Net.Mail.SmtpClient smtpMail = new System.Net.Mail.SmtpClient("smtp.office365.com");

                    //smtpMail.EnableSsl = true;//le definimos si es conexión ssl
                    //smtpMail.UseDefaultCredentials = false; //le decimos que no utilice la credencial por defecto
                    //smtpMail.Host = "smtp.office365.com"; //agregamos el servidor smtp
                    //smtpMail.Port = 587; //le asignamos el puerto, en este caso gmail utiliza el 465
                    //smtpMail.Credentials = new System.Net.NetworkCredential(DE, PASS); //agregamos nuestro usuario y pass de gmail

                    ////SmtpClient smtpMail = new SmtpClient("smtp.office365.com", 587);
                    ////smtpMail.UseDefaultCredentials = false;
                    ////smtpMail.DeliveryMethod = SmtpDeliveryMethod.Network;a html
                    //Email.From = new MailAddress(From); //definimos la direccion de procedencia

                    ////aqui creamos un objeto tipo SmtpClient el cual recibe el servidor que utilizaremos como smtp
                    ////en este caso me colgare de gmail
                    //System.Net.Mail.SmtpClient smtpMail = new System.Net.Mail.SmtpClient("smtp.office365.com");

                    //smtpMail.EnableSsl = true;//le definimos si es conexión ssl
                    //smtpMail.EnableSsl = true;
                    //smtpMail.Credentials = new NetworkCredential("eespinoza@sunfruits.com.pe", "KRMN@teamo", "smtp.office365.com");
                    //smtpMail.SendCompleted += new SendCompletedEventHandler(sendCompletedCallback);


                    //enviamos el mail
                    //smtpMail.Send(Email);

                    ////eliminamos el objeto
                    //smtpMail.Dispose();

                    //regresamos true
                    return true;
                }
                catch (Exception ex)
                {
                    //si ocurre un error regresamos false y el error
                    error = "Ocurrio un error: " + ex.Message;
                    return false;
                }

                return false;

            }

            private void sendCompletedCallback(object sender, AsyncCompletedEventArgs e)
            {
                throw new NotImplementedException();
            }
        }

    [WebMethod]
    public string enviarcorreo(string emisor)
    {
        //creamos nuestra lista de archivos a enviar
        List<string> lstArchivos = new List<string>();
            lstArchivos.Add("pdf\archivo.pdf");
            lstArchivos.Add("pdf\archivo.pdf");
            //var det = "";
            //det = VerifiDoc("archivo.pdf");
            //if (det = "si")
            //    return "esta bien";
            //else
            //    return "no hay";

            //creamos nuestro objeto de la clase que hicimos
            //    Mail oMail = new Mail("eespinoza@sunfruits.com.pe", "systemnz.ti@gmail.com",
            //                    "hola", "un mensaje bien chevere", lstArchivos);

            ////y enviamos
            //if (oMail.enviaMail())
            //{
            //    return "se envio el mail";

            //}
            //else
            //{
            //return  "no se envio el mail: " + oMail.error;
            return "";

        //}
    }

        public void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
        {
            throw new NotImplementedException();
        }

        [WebMethod]
        public object SendMail(ConsNisiraBE obj)
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

            if (obj.vnDetalle == 1) {
                asunto = "LIQUIDACION : PARTICIPACION EN LAS UTILIDADES POR EL EJERCICIO GRAVABLE AÑO 2021";
                htmlStringBody = htmlString + obj.vcNombre + htmlString2 + htmlString4 + obj.vcCodigo + htmlString5 + htmlString3;
            } else if (obj.vnDetalle == 2) {
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
                //smtpClient.Credentials = new NetworkCredential(cuenta, password, smpt);
                smtpClient.Credentials = new System.Net.NetworkCredential(cuenta, password);
                smtpClient.SendCompleted += new SendCompletedEventHandler(SendCompletedCallback);

                try
                {
                    smtpClient.Send(mail);
                    rpta = "Mensaje Enviado";
                }
                catch (Exception ex)
                {
                    rpta = "Exception caught in CreateTestMessage2(): {0},"+ex.ToString();
                }
            }
            else {
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
            EntNisira.vcAmbito = "1"; //1=OBR-AOC-OAS-HVG-ORG //2=ERG
            EntNisira.vcPeriodo = "202204";
            EntNisira.vcSemana = "18";
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
        public object LstServer(ConsHispBE obj)
        {
            EntConsHisp.vnId = obj.vnId;
            EntConsHisp.vspid = 0;
            EntConsHisp.vcUsuario = "";
            EntConsHisp.vcBaseDatos = "";
            EntConsHisp.vcEstatus = "";
            DataSet dsx = NegConsHisp.ListServer(EntConsHisp);
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

        public static void WriteToFile(string s)
        {
            string path = @"X:\Documentos\Formatos_sfe\jcaso.txt";
            var fs = new System.IO.FileStream(path, System.IO.FileMode.Append, System.IO.FileAccess.Write);
            var sw = new System.IO.StreamWriter(fs);
            sw.WriteLine(s);
            sw.Flush();
            sw.Close();
            fs.Close();
            Console.WriteLine(path);
            Console.ReadKey();
        }


        [WebMethod]
        public void Subir(EspecificacionDetalleBE obj)
        {

            if (obj.Imagen.Equals(string.Empty) || obj.Imagen.Equals(null))
            {
                obj.Imagen = Guid.NewGuid().ToString();
            }
            obj.Imagen = "jcaso2";
            if (obj.ImagenBase64.Contains("data:image/png;base64,") && obj.ImagenBase64 != "")
            {
                string carpeta = Server.MapPath("~/Img/EspEmbalaje/");

                string narchivo = obj.Imagen;
                if (narchivo.Contains(".png"))
                {
                    narchivo = obj.Imagen;
                }
                else
                {
                    narchivo = obj.Imagen + ".png";
                }
                //string ruta = Path.Combine(@"\\SFE-IDC.sunfruitscorp.com\Shared File\jcaso", narchivo);
                string ruta = Path.Combine(@"\\SFE-IDC.sunfruitscorp.com\Nisira File", narchivo);

                if (File.Exists(ruta))
                {
                    File.Delete(ruta);
                }

                string base64StringData = obj.ImagenBase64;
                string cleandata = base64StringData.Replace("data:image/png;base64,", "");
                byte[] data = Convert.FromBase64String(cleandata);
                MemoryStream ms = new MemoryStream(data);
                Image img = Image.FromStream(ms);
                img.Save(ruta, System.Drawing.Imaging.ImageFormat.Jpeg);

                /*
                string[] filePaths = Directory.GetFiles(carpeta);
                foreach (var filename in filePaths)
                {
                    string file = filename.ToString();

                    if (file.Contains("jcaso"))
                    {
                        string str = @"\\SFE-IDC.sunfruitscorp.com\Shared File\jcaso\jcaso.png";
                        if (!File.Exists(str))
                        {
                            File.Copy(file, str);
                        }
                    }
                    
                }*/
            }
        }

        [WebMethod]
        public object ListaLineas()
        {
            EntArGr.vnIdEmpresa = 1;
            EntArGr.vnIdArea = 1; //Uva
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            DataSet dsx = NegArGr.ListAreaGrupo(EntArGr);
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
            return serializer.Serialize(rows.ToList());
        }




        /*ANGEL ERNESTO GONZALES CASTILLA*/

        [WebMethod]
        public string[] ListarAreadeProcesoAPP()
        {

            int x = 0;

            DataSet dsx = NegArGr.ListAreadeProceso();
            DataTable dt = dsx.Tables[0];
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdArea"]) + '-' + Convert.ToString(row["cDescAProceso"]);
                x++;
            }

            return arr;
        }

        [WebMethod]
        public string[] ListarLineaAPP(int area)
        {
            int x = 0;
            DataSet dsx = NegArGr.ListarLineaAPP(area);
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdGrupo"]) + '-' + Convert.ToString(row["cDescAGrupo"]);
                x++;
            }

            return arr;
        }

        [WebMethod]
        public string[] ListarCultivoAPP()
        {
            int x = 0;
            DataSet dsx = NegArGr.ListarCultivoAPP();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdCultivo"]) + '-' + Convert.ToString(row["cDesCultivo"]);
                x++;
            }

            return arr;
        }

        [WebMethod]
        public string[] ListarVariedadAPP(int cultivo)
        {
            int x = 0;
            DataSet dsx = NegArGr.ListarVariedadAPP(cultivo);
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdVariedad"]) + '-' + Convert.ToString(row["cDescVariedad"]);
                x++;
            }

            return arr;
        }

        [WebMethod]
        public string[] ListarEmbalajeAPP(int cultivo)
        {
            int x = 0;
            DataSet dsx = NegArGr.ListarEmbalajeAPP(cultivo);
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdEmbalaje"]) + '-' + Convert.ToString(row["cDesEmbalaje"]);
                x++;
            }

            return arr;
        }


        [WebMethod]
        public string[] ListarSupervisorAPP()
        {
            int x = 0;
            DataSet dsx = NegArGr.ListarSupervisorAPP();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdPersonal"]) + '-' + Convert.ToString(row["Supervisor"]);
                x++;
            }

            return arr;
        }

        [WebMethod]
        public string[] ListarClienteAPP()
        {
            int x = 0;
            DataSet dsx = NegArGr.ListarClienteAPP();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdClieProv"]) + '-' + Convert.ToString(row["cDescClieProv"]);
                x++;
            }

            return arr;
        }

        [WebMethod]
        public int IniciarLecturaAPP(int Empresa, int ideproceso, int ideprocesodetalle,
            int idegrupo, int idesupervisor, int idembalaje, int idcultivo, int idvariedad, int clieprov)
        {
            objLeer.idEmpresa = Empresa;
            objLeer.ideproceso = ideproceso;
            objLeer.ideprocesodetalle = ideprocesodetalle;
            objLeer.idegrupo = idegrupo;
            objLeer.idesupervisor = idesupervisor;
            objLeer.idembalaje = idembalaje;
            objLeer.idcultivo = idcultivo;
            objLeer.idvariedad = idvariedad;
            objLeer.clieprov = clieprov;

            int x = 0;

            int dsx = NegArGr.IniciarLecturaAPP(objLeer);
            /*DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];

            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["nIdProceso"]) + '-' + Convert.ToString(row["nIdProcesoDetalle"]);
                x++;
            }*/

            return dsx;
        }

        /*RENDIMIENTO AG*/
        [WebMethod]
        public object RegiRendProcRegistro_APP(int empresa, string labor, string anio, string documento,
            int idrendpack, int idproceso, int idprocesodetalle)
        {
            DataTable dt = new DataTable();
            EntRendProcRegi.vnIdEmpresa = empresa;
            EntRendProcRegi.vcLabor = labor;
            EntRendProcRegi.vcAnio = anio;
            EntRendProcRegi.vcNroDocumento = documento;
            EntRendProcRegi.vnIdRendPack = idrendpack;
            EntRendProcRegi.vnIdProceso = idproceso;
            EntRendProcRegi.vnIdProcesoDetalle = idprocesodetalle;
            //
            DataSet dsx = new DataSet();
            //DataTable dt = new DataTable();
            Thread th = new Thread(delegate ()
            {
                dsx = NegRendProcRegi.RegiRendProcRegistro(EntRendProcRegi);
            });
            th.Start();
            th.Join();
            dt = dsx.Tables[0];
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
        public List<int> RegiRendimientoProcesoDetalle_APP(int empresa, int area, int idproceso, int idprocesodetalle,
            int grupo, int supervisor, int embalaje, int cultivo, int variedad, int clieprov)
        {
            List<int> lstRtrn = new List<int>();
            EntRendProcDeta.vnIdEmpresa = empresa;
            EntRendProcDeta.vnIdArea = area;
            EntRendProcDeta.vnIdProceso = idproceso;
            EntRendProcDeta.vnIdProcesoDetalle = idprocesodetalle;
            EntRendProcDeta.vnIdGrupo = grupo;
            EntRendProcDeta.vnIdSupervisor = supervisor;
            EntRendProcDeta.vnIdEmbalaje = embalaje;
            EntRendProcDeta.vnIdCultivo = cultivo;
            EntRendProcDeta.vnIdVariedad = variedad;
            EntRendProcDeta.vnIdClieProv = clieprov;
            EntRendProcDeta.vnIdSupervisor = supervisor;
            RendimientoProcesoDetalleBE clMsje = NegRendProcDeta.RegiRendimientoProcesoDetalle(EntRendProcDeta);
            //
            EntRendProc.vnIdEmpresa = Convert.ToInt32(empresa);
            EntRendProc.vnIdArea = area;
            EntRendProc.vbEstado = true;
            clMsje.vbEstado = Convert.ToBoolean(NegRendProc.BloqueoLinea(EntRendProc));
            //
            lstRtrn.Add(clMsje.vnIdProceso);
            lstRtrn.Add(clMsje.vnIdProcesoDetalle);
            return lstRtrn;
        }

        /*FN ANGEL ERNESTO GONZALES CASTILLA*/

        /*FN - ANGEL ERNESTO GONZALES CASTILLA*/


















        RendimientoProcesoDetalleBE EntRendProcDeta = new RendimientoProcesoDetalleBE();
        RendimientoProcesoDetalleBL NegRendProcDeta = new RendimientoProcesoDetalleBL();

        //Detalle de linea
        [WebMethod]
        public object Linea(int linea)
        {
            RendimientoProcesoDetalleBE obj = new RendimientoProcesoDetalleBE();
            
            EntRendProcDeta.vnIdEmpresa = 1; //Empresa 1
            EntRendProcDeta.vnIdProceso = 0;
            EntRendProcDeta.vnIdProcesoDetalle = 0;
            EntRendProcDeta.vnIdArea = 1; //Uva
            EntRendProcDeta.vnIdGrupo = linea;
            EntRendProcDeta.vcFecha = DateTime.Now.ToString();
            DataSet dsx = NegRendProcDeta.ListRendimientoProcesoDetalle_ultimo(EntRendProcDeta);
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
        public object ParteProduccion_Buscar(ControlfechasBE obj)
        {
            return Util.Serializar(parteproduccionBL.Buscar(obj).Tables[0]);
        }

        [WebMethod]
        public object RendimientoGuardar(string anio, string dni, string rend, int idproceso, int idprocesodetalle)
        {
            DataSet dsx = NegRendProcDeta.RendimientoGuardar(anio, dni, rend, idproceso, idprocesodetalle);
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
            return serializer.Serialize(rows.ToList());
        }

        [WebMethod]
        public object ViewDetalleProceso(RendimientoProcesoDetalleBE obj)
        {
            EntDetProc.vnIdEmpresa = 1;
            EntDetProc.vnIdArea = 1;
            EntDetProc.vdFeInic = obj.vdFeInic;
            DataSet dsx = NegDetProc.ViewRendimientoProcesoDetalle(EntDetProc);
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
        public object AGrupoList(AreaGrupoBE obj)
        {
            EntArGr.vnIdEmpresa = 1;
            EntArGr.vnIdArea = 1;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            DataSet dsx = NegArGr.ListAreaGrupo(EntArGr);
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
        public object Verifytk(PersonaBE obj)
        {
            if (Convert.ToInt32(negUtil.Decrypt(obj.vcIds)) != 0)
            {
                EntPersona.vnIdEmpresa = 1;
                EntPersona.vnIdPersona = Convert.ToInt32(negUtil.Decrypt(obj.vcIds)); ;
                EntPersona.vcNroDocumento = "";
                EntPersona.vcNombres = "";
                EntPersona.vnEstado = 0;
                DataSet dsx = NegPersona.ListPersona(EntPersona);
                DataTable dt = dsx.Tables[0];
                //Serializacion
                DataTable dt2 = new DataTable();
                dt2.Columns.AddRange(new DataColumn[2] {
                new DataColumn("nombres"),
                new DataColumn("Vu") })
                    ;
                foreach (DataRow rowx in dt.Rows)
                {
                    dt2.Rows.Add(
                    rowx["nombres"].ToString(),
                    rowx["Vu"].ToString()
                    );
                }

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
            else {
                JavaScriptSerializer serializer = new JavaScriptSerializer();
                serializer.MaxJsonLength = Int32.MaxValue;
                var rpta = new
                {
                    vcnombre = "",
                    Vu = "0"
                };
                return serializer.Serialize(rpta);
            }
        }

        [WebMethod]
        public object UpdateInfo(PersonaBE obj)
        {
            EntPersona.vnIdPersona = Convert.ToInt32(negUtil.Decrypt(obj.vcIds));
            EntPersona.vcFile = obj.vcFile;
            EntPersona.vExt = obj.vExt;
            int dsx = NegPersona.UpdateInfoPersona(EntPersona);

            JavaScriptSerializer serializer = new JavaScriptSerializer();

            var existfile = "";
            if (obj.vcFile != "" && obj.vExt != "" && dsx != 0)
            {
                string folderPath = Server.MapPath("~/Mod_RRHH/DocPersonal/");

                string fileName = dsx + "." + obj.vExt;
                string FilePath = folderPath + fileName;

                string base64StringData = obj.vcFile;
                byte[] data = System.Convert.FromBase64String(base64StringData);
                MemoryStream ms = new MemoryStream(data);
                FileStream file = new FileStream(FilePath, FileMode.Create, FileAccess.Write);
                ms.WriteTo(file);
                file.Close();
                ms.Close();

                FileInfo filev = new FileInfo(FilePath);

                if (filev.Exists.Equals(true))
                {
                    existfile = fileName;
                }
                else
                {
                    existfile = "0";
                }
            }
            else
            {
                existfile = "0";
            }

            var rpta = new
            {
                file = existfile,
            };
            return serializer.Serialize(rpta);

        }


        [WebMethod]
        public object Comparaciontickets(RendimientoProcesoRegistroBE obj)
        {
            string _persona = "";
            List<object> _noleidos = new List<object>();
            List<object> _sileidos = new List<object>();
            List<object> _hoyleidos = new List<object>();
            string _leidos = "";

            RendimientoProcesoRegistroBL rrBL = new RendimientoProcesoRegistroBL();

            DataSet dsx = rrBL.Comparaciontickets(obj);

            DataTable dt0 = dsx.Tables[0];
            foreach (DataRow item0 in dt0.Rows)
            {
                _persona = item0.ItemArray[0].ToString() + " " + item0.ItemArray[1].ToString() + " " + item0.ItemArray[2].ToString();
                break;
            }

            DataTable dt1 = dsx.Tables[1];
            foreach (DataRow item1 in dt1.Rows)
            {
                _noleidos.Add(new { cantidad = item1.ItemArray[0].ToString(), dFechaImp = item1.ItemArray[1].ToString(), cLabor = item1.ItemArray[2].ToString() });
            }

            DataTable dt2 = dsx.Tables[2];
            foreach (DataRow item2 in dt2.Rows)
            {
                _leidos = item2.ItemArray[0].ToString();
                break;
            }

            DataTable dt3 = dsx.Tables[3];
            foreach (DataRow item3 in dt3.Rows)
            {
                _sileidos.Add(new { cantidad = item3.ItemArray[0].ToString(), dFechaImp = item3.ItemArray[1].ToString() });
            }

            DataTable dt4 = dsx.Tables[4];
            foreach (DataRow item4 in dt4.Rows)
            {
                _hoyleidos.Add(new { cantidad = item4.ItemArray[0].ToString(), dFechaImp = item4.ItemArray[1].ToString() });
            }


            object rpta = new
            {
                persona = _persona,
                emitidos = _noleidos,
                leidos = _leidos,
                emitidos2 = _sileidos,
                hoyleidos = _hoyleidos
            };

            return rpta;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<object> Reporte_PaletsPorTunelYPorDia(PersonalBE obj)
        {
            List<object> res = new List<object>();
            RegPaletBL regPaletBL = new RegPaletBL();
            foreach (DataRow item in regPaletBL.Reporte_PaletsPorTunelYPorDia(obj).Tables[0].Rows)
            {
                res.Add(new { palet = item.ItemArray[3].ToString(), tunel = item.ItemArray[1].ToString(), registro = item.ItemArray[2].ToString(), codigobarras = item.ItemArray[0].ToString() });
            }
            return res;
        }


        [WebMethod]
        public object vrfdni(PersonalBE obj)
        {
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;

            DataSet dsx = NegPersonal.ListPersonalNS(EntPersonal);
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
        public object ListCultivoPacking(CultivoPackingBE obj)
        {
            EntCultivoPacking.vnIdEmpresa = 1;
            EntCultivoPacking.vnIdCultivo = 0;
            DataSet dsx = NegCultivoPacking.ListCultivoPacking(EntCultivoPacking);
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
        public object ListCargo(ConsNisiraBE obj)
        {
            EntConsNis.vnIdEmpresa = 1;
            DataSet dsx = NegConsNis.ListCargos(EntConsNis);
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
        public object RegiPersona(PersonaBE obj)
        {
            if (obj.vcImg.Contains("data:image/png;base64,") && obj.vcImg != "")
            {
                obj.vImg = "jpg";
            }
            else {
                obj.vImg = "";
            }
                EntPersona.vnIdTemporada = obj.vnIdTemporada;
            EntPersona.vcTipoDocumento = obj.vcTipoDocumento;
            EntPersona.vcNroDocumento = obj.vcNroDocumento;
            EntPersona.vcApPaterno = obj.vcApPaterno;
            EntPersona.vcApMaterno = obj.vcApMaterno;
            EntPersona.vcNombres = obj.vcNombres;
            EntPersona.vcSexo = obj.vcSexo;
            EntPersona.vcFechaNacimiento = obj.vcFechaNacimiento;
            EntPersona.vcNacionalidad = obj.vcNacionalidad;
            EntPersona.vcDireccion = obj.vcDireccion;
            EntPersona.vcDistrito = obj.vcDistrito;
            EntPersona.vcDepartamento = obj.vcDepartamento;
            EntPersona.vcCelular = obj.vcCelular;
            EntPersona.vcEmail = obj.vcEmail;
            EntPersona.vcTurno = obj.vcTurno;
            EntPersona.vcImg = obj.vcImg;
            EntPersona.vbReingresante = obj.vbReingresante;
            EntPersona.vcReCargos = obj.vcReCargos;
            EntPersona.vcReOtroCargo = obj.vcReOtroCargo;
            EntPersona.vcReAnios = obj.vcReAnios;
            EntPersona.vcReCapanias = obj.vcReCapanias;
            EntPersona.vnidCargoPost = obj.vnidCargoPost;
            EntPersona.vcDescCargo = obj.vcDescCargo;
            EntPersona.vcFile = obj.vcFile;
            EntPersona.vExt = obj.vExt;
            EntPersona.vImg = obj.vImg;
            EntPersona.vcGradoInstruccion = obj.vcGradoInstruccion;
            EntPersona.vcExpOEmpresa = obj.vcExpOEmpresa;
            int dsx = NegPersona.RegiPersona(EntPersona);

            JavaScriptSerializer serializer = new JavaScriptSerializer();

            var existimg = "";
            if (obj.vcImg.Contains("data:image/png;base64,") && obj.vcImg != "" && dsx != 0)
            {
                string folderPath = Server.MapPath("~/Mod_RRHH/ImgPersonal/");  //Create a Folder in your Root directory on your solution.
                string fileName = dsx + ".jpg";
                string imagePath = folderPath + fileName;

                string base64StringData = obj.vcImg; // Your base 64 string data
                string cleandata = base64StringData.Replace("data:image/png;base64,", "");
                byte[] data = System.Convert.FromBase64String(cleandata);
                MemoryStream ms = new MemoryStream(data);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms);

                img.Save(imagePath, System.Drawing.Imaging.ImageFormat.Jpeg);

                FileInfo file = new FileInfo(imagePath);
                if (file.Exists.Equals(true))
                {
                    existimg = obj.vnIdPersonal + ".jpg";
                }
                else
                {
                    existimg = "";
                }
            }
            else
            {
                existimg = "";
            }

            var existfile = "";
            if (obj.vcFile != "" && obj.vExt != "" && dsx != 0)
            {
                string folderPath = Server.MapPath("~/Mod_RRHH/DocPersonal/");
                //string folderPath = Server.MapPath(@"\\172.16.16.16\Nisira File\Fotos_personal\Formatos_sfe\FOT\");
                
                string fileName = dsx + "." + obj.vExt;
                string FilePath = folderPath + fileName;

                string base64StringData = obj.vcFile;
                byte[] data = System.Convert.FromBase64String(base64StringData);
                MemoryStream ms = new MemoryStream(data);
                FileStream file = new FileStream(FilePath, FileMode.Create, FileAccess.Write);
                ms.WriteTo(file);
                file.Close();
                ms.Close();

                FileInfo filev = new FileInfo(FilePath);

                if (filev.Exists.Equals(true))
                {
                    existfile = fileName;
                }
                else
                {
                    existfile = "0";
                }
            }
            else
            {
                existfile = "0";
            }

            var rpta = new
            {
                rpta = dsx,
                img = existimg,
                file = existfile,
            };
            return serializer.Serialize(rpta);

        }


        [WebMethod]
        public void RegiFichaSC(List<FichaRespuestaBE> array)
        {
            foreach (var i in array)
            {
                EntFRespuesta.vnIdFichaPregunta = i.vnIdFichaPregunta;
                EntFRespuesta.vnIdPersonal = i.vnIdPersonal; 
                EntFRespuesta.vnIdFichaMes = i.vnIdFichaMes;
                EntFRespuesta.vnEdad = i.vnEdad; 
                EntFRespuesta.vcFechaNac = i.vcFechaNac;
                //EntFRespuesta.vdFechaNac = DateTime.ParseExact(i.vcFechaNac, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                EntFRespuesta.vcDireccion = i.vcDireccion;
                EntFRespuesta.vcCelular = i.vcCelular;
                EntFRespuesta.vcRespuesta = i.vcRespuesta;
                EntFRespuesta.vcObs = i.vcObs;
                DataSet dsx = NegFRespuesta.RegiFichaRespuesta(EntFRespuesta);
                var dt = dsx.Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                }
            }
            //Serializacion
        }

        [WebMethod]
        public object VerifyMes(FichaMesBE obj)
        {
            EntFichaMes.vnIdEmpresa = 1;
            EntFichaMes.vnIdFichaMes = 0;
            EntFichaMes.vnIdFicha = 0;
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
        public object Vp_Sf(PersonalBE obj)
        {
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vdFechaNacimiento = Convert.ToDateTime(obj.vdFechaNacimiento);

            DataSet dsx = NegPersonal.VerificaPersonal(EntPersonal);
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
        public object ConsultaUtilidad(PersonalBE obj)
        {
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcFechaNacimiento = obj.vcFechaNacimiento;
            EntPersonal.vnEstado = obj.vnEstado;

            DataSet dsx = NegPersonal.ConsultaUtilidad(EntPersonal);
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
        public object DispositivoList(DispositivoBE obj)
        {
            EntDisp.vnIdEmpresa = 1;
            //  EntDisp.vcIdSucursal = ddlIdFundo.SelectedValue;
            EntDisp.vnIdDispositivo = obj.vnIdDispositivo;
            EntDisp.vcTipo = "PDAM";
            DataSet dsx = NegDisp.ListDispositivos(EntDisp);
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
        public object UpdatePersonalNuevo2(PersonalBE obj)
        {
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcApPaterno = obj.vcApPaterno;
            EntPersonal.vcApMaterno = obj.vcApMaterno;
            EntPersonal.vcNombres = obj.vcNombres;
            DataSet dsx = NegPersonal.ActualizaPersonal(EntPersonal);
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
        public object RegitrarAsistencia(AsistenciaBE obj)
        {
            EntAsis.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntAsis.vcNroDocumento = obj.vcNroDocumento;
            EntAsis.vnIdDispositivo = obj.vnIdDispositivo;
            EntAsis.vnTipoMarca = obj.vnTipoMarca;


            DataSet ds = NegAsis.RegiAsis(EntAsis);
            // DataTable ds = dsx.Tables[0];
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            string dFechaRegistro = ds.Tables["get"].Rows[0]["dFechaRegistro"].ToString();
            string cNombresApellidos = ds.Tables["get"].Rows[0]["cNombresApellidos"].ToString();
            string nEstado = ds.Tables["get"].Rows[0]["nEstado"].ToString();
            int nIdp = Int32.Parse(ds.Tables["get"].Rows[0]["nIdp"].ToString());

            if (cNombresApellidos != "")
            {

                row = new Dictionary<string, object>();
                row.Add("dFechaRegistro", dFechaRegistro);
                row.Add("cNombresApellidos", cNombresApellidos);
                row.Add("nEstado", nEstado);
                row.Add("nIdp", nIdp);
                rows.Add(row);
            }
            else
            {
                var nom = "";
                var estadod = 6;

                string url = "http://204.199.164.92/reniec/index.php?dni=" + obj.vcNroDocumento;
                ServicePointManager.CertificatePolicy = new MyPolicy();
                var jsonObject = "";
                try
                {
                    HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                    request.KeepAlive = true;
                    request.Method = "GET";
                    request.ReadWriteTimeout = 5000;
                    request.ContentType = "text/html;charset=UTF-8";
                    HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                    Stream myResponseStream = response.GetResponseStream();
                    StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));

                    // devolver contenido
                    jsonObject = myStreamReader.ReadToEnd();

                    List<Root> listRegistro = serializer.Deserialize<List<Root>>(jsonObject);
                    if (listRegistro[0].data != null)
                    {
                        EntPersonal.vnIdPersonal = nIdp;
                        EntPersonal.vcNroDocumento = obj.vcNroDocumento;
                        EntPersonal.vcApPaterno = listRegistro[0].data.apellido_paterno;
                        EntPersonal.vcApMaterno = listRegistro[0].data.apellido_materno;
                        EntPersonal.vcNombres = listRegistro[0].data.nombres;
                        DataSet dsv = NegPersonal.ActualizaPersonal(EntPersonal);
                        cNombresApellidos = listRegistro[0].data.nombre_completo;
                        estadod = 1;
                    }
                    else
                    {
                        cNombresApellidos = "PERSONA NO ENCONTRADO - VERIFIQUE DNI";
                        estadod = 6;
                    }

                }
                catch (Exception ee)
                {
                    cNombresApellidos = "FALLA AL RECUPERAR INFORMACION";
                    estadod = 6;
                }

                row = new Dictionary<string, object>();
                row.Add("dFechaRegistro", dFechaRegistro);
                row.Add("cNombresApellidos", cNombresApellidos);
                row.Add("nEstado", nEstado);
                row.Add("nIdp", nIdp);
                rows.Add(row);
            }
            //Serializacion


            return serializer.Serialize(rows);
        }

        public class Data
        {
            public string numero { get; set; }
            public string nombre_completo { get; set; }
            public string nombres { get; set; }
            public string apellido_paterno { get; set; }
            public string apellido_materno { get; set; }
            public string direccion { get; set; }
            public string direccion_completa { get; set; }
            public string departamento { get; set; }
            public string provincia { get; set; }
            public string distrito { get; set; }
            public string nombre_o_razon_social { get; set; }
            public int codigo_verificacion { get; set; }
            public string ubigeo_reniec { get; set; }
            public List<string> ubigeo { get; set; }
        }

        public class Root
        {
            public bool success { get; set; }
            public Data data { get; set; }
        }



        [WebMethod]
        public object GetPersonExt(PersonalBE obj)
        {
            string url = "http://204.199.164.92/reniec/index.php?dni=" + obj.vcNroDocumento;
            ServicePointManager.CertificatePolicy = new MyPolicy();
            var jsonObject = new object();
            try
            {
                //HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                //req.KeepAlive = false;
                //req.ProtocolVersion = HttpVersion.Version10;
                //req.Method = "GET";
                //req.ContentType = "application/x-www-form-urlencoded";
                //byte[] postBytes = System.Text.Encoding.ASCII.GetBytes("dni=" + obj.vcNroDocumento);
                //req.ContentType = "application/x-www-form-urlencoded";
                //req.ContentLength = postBytes.Length;
                //Stream requestStream = req.GetRequestStream();
                //requestStream.Write(postBytes, 0, postBytes.Length);
                //requestStream.Close();
                ////
                //HttpWebResponse response = (HttpWebResponse)req.GetResponse();
                //Stream resStream = response.GetResponseStream();
                ////
                //var sr = new StreamReader(response.GetResponseStream());
                //var serializer = new JavaScriptSerializer();
                //jsonObject = sr.ReadToEnd();
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);

                // OBTENER solicitud
                request.Method = "GET";
                request.ReadWriteTimeout = 5000;
                request.ContentType = "text/html;charset=UTF-8";
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream myResponseStream = response.GetResponseStream();
                StreamReader myStreamReader = new StreamReader(myResponseStream, Encoding.GetEncoding("utf-8"));

                // devolver contenido
                string retString = myStreamReader.ReadToEnd();
                jsonObject = retString;
            }
            catch (Exception ee)
            {

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
        public List<string> PrintRendimiento(PersonalBE obj)
        {
            List<String> lst = new List<String>();

            ThreadUtl negTh = new ThreadUtl();
            EntRend.vcNroDocumento = obj.vcNroDocumento;
            EntRend.vnIdTiRow = obj.vnIdTiRow;
            EntRend.vcLabor = obj.vcCodigoLabor;
            DataSet dt = NegRend.ListTicketPrint(EntRend);
            int vnValor = Convert.ToInt32(dt.Tables[0].Rows[0]["nValor"].ToString());
            if (vnValor > 0) {
                Thread th = new Thread(delegate ()
                {
                    negTh.PrintTickPRNQR(dt.Tables[1], obj.vcIpLocal);
                });
                th.Start();
            }
            lst.Add(vnValor.ToString());
            lst.Add(dt.Tables[0].Rows[0]["Pendiente"].ToString());
            lst.Add(dt.Tables[0].Rows[0]["cNombres"].ToString());
            return lst;
        }

        [WebMethod]
        public object ListControlGarita(ControlGaritaBE obj)
        {

            EntControlGarita.vnIdEmpresa = 1;
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
        public int RegiTrack(int vnIdEmpresa, string vcIP, int vnIdTrack,
            double vnLatitud, double vnLongitud, int vnTiempo) {
            EntTrac.vnIdEmpresa = vnIdEmpresa;
            EntTrac.vcIP = vcIP;
            EntTrac.vnIdTrack = vnIdTrack;
            EntTrac.vnLatitud = vnLatitud;
            EntTrac.vnLongitud = vnLongitud;
            EntTrac.vdFecha = DateTime.Now;
            EntTrac.vnTiempo = vnTiempo;
            int vnReturn = negTrac.RegiTrack(EntTrac);
            return vnReturn;
        }

        [WebMethod]
        public List<string> RegiTicket(PersonalBE obj)
        {
            List<string> lst = new List<string>();
            EntTick.vcIdCodigoGeneral = obj.vcNroDocumento;
            DataSet ds = NegTick.RegiTicket(EntTick);
            int vnRet = Convert.ToInt32(ds.Tables[0].Rows[0]["nNoRegistro"].ToString());
            if (vnRet > 0) {
                ThreadUtl negTh = new ThreadUtl();
                string vvpath = Server.MapPath("~/Mod_Repo/reports/Crt_TicketAlimento.rpt");

                Thread th = new Thread(delegate ()
                {
                    negTh.PrintDoc(ds, vvpath);
                });
                th.Start();

            }
            lst.Add(vnRet.ToString());
            lst.Add(ds.Tables[0].Rows[0]["cNombres"].ToString());
            return lst;
        }
        [WebMethod]
        public object RegiAsis(string nrodocumento, int nIdDispositivo) {
            EntAsis.vcNroDocumento = nrodocumento;
            EntAsis.vnIdDispositivo = nIdDispositivo;
            DataSet dsx = NegAsis.RegiAsis(EntAsis);
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
        public object ListMonitor(MonitorSubLineaBE obj)
        {
            EntMonitor.vnIdMonitor = 0;
            EntMonitor.vcIpMonitor = obj.vcIpLocal;
            DataSet dsx = NegMonitor.ListMonitor(EntMonitor);
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
        public object ListMonitorArea(MonitorBE obj)
        {
            EntMoni.vnIdEmpresa = 1;
            EntMoni.vnIdArea = obj.vnIdArea;
            DataSet dsx = NegMoni.ListMonitorArea(EntMoni);
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
        public object DispositivosMonitoreo_Listado()
        {
            DataSet dsx = dispositivosMonitoreoBL.Listado();
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
        public void DispositivosMonitoreo_Servicio(string Ip, int Bateria)
        {
            dispositivosMonitoreoBL.Servicio(Ip, Bateria);
        }

        [WebMethod]
        public object DispositivosMonitoreo_Servicio_Url(string Ip)
        {
            DataSet dsx = dispositivosMonitoreoBL.Servicio_Url(Ip);
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
        public object ListMonitorSubLinea(MonitorSubLineaBE obj)
        {
            EntMoniSl.vnIdEmpresa = 0;
            EntMoniSl.vnIdMonitor = obj.vnIdMonitor;
            DataSet dsx = NegMoniSl.ListMonitorSubLinea(EntMoniSl);
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
        public object ListRecepcionMercancia(ConsHispBE obj)
        {

            EntConsHisp.vcFecha = obj.vcFecha;

            DataSet dsx = NegConsHisp.ListRecepcionMercancia(EntConsHisp);
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
        public object ListPaletsProducidosAbast(ConsHispBE obj)
        {

            EntConsHisp.vcFecha = obj.vcFecha;

            DataSet dsx = NegConsHisp.ListPaletsProducidosAbast(EntConsHisp);
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
        public object ListMonitorRendimiento(RendimientoProcesoRegistroBE obj)
        {

            EntRend.vnIdEmpresa = 0;
            EntRend.vnIdMonitor = obj.vnIdMonitor;
            EntRend.vcFecha = obj.vcFecha;

            DataSet dsx = NegRend.ListMonitorRendimiento(EntRend);
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
        public object ListMonitorRendimiento_Mod(RendimientoProcesoRegistroBE obj)
        {

            EntRend.vnIdEmpresa = 0;
            EntRend.vnIdMonitor = obj.vnIdMonitor;
            EntRend.vcFecha = obj.vcFecha;

            DataSet dsx = NegRend.ListMonitorRendimiento_Mod(EntRend);
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
        public object ListRendimientoProcesoDetalle(RendimientoProcesoRegistroBE obj)
        {

            EntRend.vnIdEmpresa = 0;
            EntRend.vnIdMonitor = obj.vnIdMonitor;
            EntRend.vcFecha = obj.vcFecha;

            DataSet dsx = NegRend.ListRendimientoProcesoDetalle(EntRend);
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
        public object InfoAreaGrupoCliente(AreaGrupoClienteBE obj)
        {
            EntAreaGrupoCliente.vnIdEmpresa = 1;
            EntAreaGrupoCliente.vnIdGrupo = obj.vnIdGrupo;
            DataSet dsx = NegAreaGrupoCliente.InfoAreaGrupoCliente(EntAreaGrupoCliente);
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
        public object AppCalidadRecepcion()
        {
            DataSet ds = NegCalidadBL.CalidadRe();
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
            var data = new
            {
                d1 = rows
            };
            return serializer.Serialize(data);
        }



        [WebMethod]
        public object RegiRendProcRegistro_Mod(RendimientoProcesoRegistroBE obj)
        {
            DataTable dt = new DataTable();
            EntRendProcRegi.vnIdEmpresa = 1;
            EntRendProcRegi.vcLabor = obj.vcLabor;
            EntRendProcRegi.vcAnio = obj.vcAnio;
            EntRendProcRegi.vcNroDocumento = obj.vcNroDocumento;
            EntRendProcRegi.vnIdRendPack = obj.vnIdRendPack;
            EntRendProcRegi.vnIdProceso = obj.vnIdProceso;
            EntRendProcRegi.vnIdProcesoDetalle = obj.vnIdProcesoDetalle;
            //
            DataSet dsx = new DataSet();
            //DataTable dt = new DataTable();
            Thread th = new Thread(delegate ()
            {
                dsx = NegRendProcRegi.RegiRendProcRegistro_Mod(EntRendProcRegi);
            });
            th.Start();
            th.Join();
            dt = dsx.Tables[0];
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




        #region Para recepción
        RecepciontiempoBL recepciontiempoBL = new RecepciontiempoBL();
        RecepciontiempodetalleBL recepciontiempodetalleBL = new RecepciontiempodetalleBL();
        ClientesYProductoreBL clientesYProductoreBL = new ClientesYProductoreBL();
        RecepciontiempoconfiguracionBL recepciontiempoconfiguracionBL = new RecepciontiempoconfiguracionBL();

        [WebMethod]
        public void RecepciontiempodetalleInsert(RecepciontiempodetalleBE obj)
        {
            DataSet dsx = recepciontiempodetalleBL.Insert(obj);
        }

        [WebMethod]
        public List<object> RecepciontiempodetalleSelect(RecepciontiempodetalleBE e)
        {
            List<object> res = new List<object>();
            DataSet dsx = recepciontiempodetalleBL.Select(e);
            return res;
        }

        [WebMethod]
        public void RecepciontiempodetalleUpdate(RecepciontiempodetalleBE e)
        {
            DataSet dsx = recepciontiempodetalleBL.Update(e);
        }

        [WebMethod]
        public void RecepciontiempodetalleDelete(RecepciontiempodetalleBE obj)
        {
            DataSet dsx = recepciontiempodetalleBL.Delete(obj);
        }

        [WebMethod]
        public object RecepciontiempodetalleOneById(RecepciontiempodetalleBE e)
        {
            DataSet dsx = recepciontiempodetalleBL.OneById(e);
            return e;
        }

        [WebMethod]
        public object RecepciontiempodetalleListadoPorCabeceraId(RecepciontiempodetalleBE obj)
        {
            return Util.Serializar(recepciontiempodetalleBL.ListadoPorCabeceraId(obj).Tables[0]);
        }

        [WebMethod]
        public void RecepciontiempodetalleActualizarCampoHora(RecepciontiempodetalleBE obj)
        {
            recepciontiempodetalleBL.ActualizarCampoHora(obj);
        }

        [WebMethod]
        public void RecepciontiempoInsert(RecepciontiempoBE obj)
        {
            DataSet dsx = recepciontiempoBL.Insert(obj);
        }

        [WebMethod]
        public object RecepciontiempoInsertReturn(RecepciontiempoBE obj)
        {
            return Util.Serializar(recepciontiempoBL.InsertReturn(obj).Tables[0]);
        }

        [WebMethod]
        public List<object> RecepciontiempoSelect(RecepciontiempoBE e)
        {
            List<object> res = new List<object>();
            DataSet dsx = recepciontiempoBL.Select(e);
            return res;
        }

        [WebMethod]
        public void RecepciontiempoUpdate(RecepciontiempoBE e)
        {
            DataSet dsx = recepciontiempoBL.Update(e);
        }

        [WebMethod]
        public void RecepciontiempoDelete(RecepciontiempoBE obj)
        {
            DataSet dsx = recepciontiempoBL.Delete(obj);
        }

        [WebMethod]
        public object RecepciontiempoOneById(RecepciontiempoBE e)
        {
            return Util.Serializar(recepciontiempoBL.OneById(e).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object SeleccionarPorFecha(RecepciontiempoBE obj)
        {
            return Util.Serializar(recepciontiempoBL.SeleccionarPorFecha(obj).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoReporte1(RecepciontiempoBE obj)
        {
            return Util.Serializar(recepciontiempoBL.Reporte1(obj).Tables[0]);
        }

        /// <summary>
        /// Obtiene la lista de clientes y productores registrados en la tabla ClienteProd
        /// </summary>
        /// <param name="e">Nombre  del productor</param>
        /// <returns>lista de objetos</returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object ClientesYProductoresList(string obj)
        {
            return Util.Serializar(clientesYProductoreBL.List(obj).Tables[0]);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoconfiguracionSelect(RecepciontiempoconfiguracionBE obj)
        {
            return Util.Serializar(recepciontiempoconfiguracionBL.Select(obj).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoconfiguracionUpdate(RecepciontiempoconfiguracionBE obj)
        {
            return Util.Serializar(recepciontiempoconfiguracionBL.Update(obj).Tables[0]);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void RecepciontiempoconfiguracionActualizarminmax(RecepciontiempoconfiguracionBE obj)
        {
            recepciontiempoconfiguracionBL.Actualizarminmax(obj);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object RecepciontiempoconfiguracionOneById(RecepciontiempoconfiguracionBE obj)
        {
            return Util.Serializar(recepciontiempoconfiguracionBL.OneById(obj).Tables[0]);
        }
        #endregion



    }
}
