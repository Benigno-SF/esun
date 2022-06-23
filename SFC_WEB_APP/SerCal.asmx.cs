using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SFC_BE;
using SFC_BL;
using System.Net.Mail;
using System.Text;
using System.Net;
using System.ComponentModel;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.IO;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Data;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerCal
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerCal : System.Web.Services.WebService
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


        //DataSupervisor
        [WebMethod]
        public object Select_Dinamico(ConsNisiraBE obj)
        {
            EntConsNisira.vcEmpresa = obj.vcEmpresa;
            EntConsNisira.IDBUSCADOR = obj.IDBUSCADOR;
            EntConsNisira.ITEMBUSCADOR = obj.ITEMBUSCADOR;
            DataSet ds = NegConsNisira.Select_Dinamico(EntConsNisira);
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

        //ObtenerData
        [WebMethod]
        public object DataObtenerData_List(ConsNisiraBE obj)
        {
            EntConsNisira.vcEmpresa = obj.vcEmpresa;
            EntConsNisira.vidcertificado = obj.vidcertificado;
            EntConsNisira.vidvariable = obj.vidvariable;
            DataSet ds = NegConsNisira.SN_ObtenerData_list(EntConsNisira);
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
    }
}
