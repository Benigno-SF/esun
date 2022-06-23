using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Data;
using SFC_BE;
using SFC_BL;
using System.IO;


namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerAgro
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    [System.Web.Script.Services.ScriptService]
    public class SerAdmi : System.Web.Services.WebService
    {

            UbicacionBE EntUbic = new UbicacionBE();
            UbicacionBL NegUbic = new UbicacionBL();

            PalletMovBE EntPaleMov = new PalletMovBE();
            PalletMovBL NegPale = new PalletMovBL();

            ConsExternaBE EntCons = new ConsExternaBE();
            ConsExternaBL NegCons = new ConsExternaBL();

            OrdenCargaBE EntOrdc = new OrdenCargaBE();
            OrdenCargaBL NegOrdc = new OrdenCargaBL();

            MonitorSubLineaBE EntMoniSl = new MonitorSubLineaBE();
            MonitorSubLineaBL NegMoniSl = new MonitorSubLineaBL();

            CultivoCaracteristicaBE EntCarac = new CultivoCaracteristicaBE();
            CultivoCaracteristicaBL NegCarac = new CultivoCaracteristicaBL();

            AreaGrupoBE EntArGr = new AreaGrupoBE();
            AreaGrupoBL NegArGr = new AreaGrupoBL();

            SubLineaBE EntSubL = new SubLineaBE();
            SubLineaBL NegSubL = new SubLineaBL();

            PanelInfoBE EntPaneInfo = new PanelInfoBE();
            PanelInfoBL NegPaneInfo = new PanelInfoBL();

            PersonalBE EntPersonal = new PersonalBE();
            PersonalBL NegPersonal = new PersonalBL();

            SmsBE EntSms = new SmsBE();

            DispositivoBE EntDevice = new DispositivoBE();
            DispositivoBL NegDevice = new DispositivoBL();

            ConsHispBE EntHisp = new ConsHispBE();
            ConsHispBL NegHisp = new ConsHispBL();

            OrganigramaBE EntOrganigrama = new OrganigramaBE();
            OrganigramaBL NegOrganigrama = new OrganigramaBL();

            IntegranteBE EntIntegrante = new IntegranteBE();
            IntegranteBL NegIntegrante = new IntegranteBL();

            DocumentoBE EntFiles = new DocumentoBE();
            DocumentoBL NegFiles = new DocumentoBL();

            TipoDocumentoBE EntTipoDoc = new TipoDocumentoBE();
            TipoDocumentoBL NegTipoDoc = new TipoDocumentoBL();

            ConsNisiraBE EntConsNisira = new ConsNisiraBE();
            ConsNisiraBL NegConsNisira = new ConsNisiraBL();

            //Nuevo
            SaldoxCobrarBE Entsxco = new SaldoxCobrarBE();
            SxCobrarBL Negsxo = new SxCobrarBL();

        UtilBL negUtil = new UtilBL();
        //
        [WebMethod]
        public object CostosDistribuidos_List(ConsNisiraBE obj, List<ConsNisiraBE> arrayXMLCC, List<ConsNisiraBE> arrayXMLPC)
        {
            string xmlStringXMLCC = "";

            if (arrayXMLCC != null && arrayXMLCC.Count != 0)
            {
                string xmlStringXMLCC1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData>" +
                    "<tmpcc>";
                string xmlStringXMLCC2 = "";

                foreach (var i in arrayXMLCC)
                {
                    xmlStringXMLCC2 += "<idccosto>" + i.vcId + "</idccosto>";
                }

                string xmlStringXMLCC3 = "</tmpcc>" +
                    "</VFPData>";

                xmlStringXMLCC = xmlStringXMLCC1 + xmlStringXMLCC2 + xmlStringXMLCC3;
            }
            else
            {
                xmlStringXMLCC = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData/>";
            }

            string vcXMLCCO = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData/>";

            string xmlStringXMLPC = "";

            if (arrayXMLPC != null && arrayXMLPC.Count != 0)
            {
                string xmlStringXMLPC1 = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData>" +
                    "<tmpcc>";
                string xmlStringXMLPC2 = "";

                foreach (var i in arrayXMLPC)
                {
                    xmlStringXMLPC2 += "<idccosto>" + i.vcId + "</idccosto>";
                }
                string xmlStringXMLPC3 = "</tmpcc>" +
                    "</VFPData>";

                xmlStringXMLPC = xmlStringXMLPC1 + xmlStringXMLPC2 + xmlStringXMLPC3;
            }
            else
            {
                xmlStringXMLPC = "<?xml version = '1.0' encoding='Windows-1252' standalone='yes'?>" +
                "<VFPData/>";
            }

            EntConsNisira.vcIdEmpresa = obj.vcIdEmpresa;
            EntConsNisira.vcFecha = obj.vcFecha;
            EntConsNisira.vcFechaFin = obj.vcFechaFin;
            EntConsNisira.vcXMLCC = xmlStringXMLCC;
            EntConsNisira.vcXMLCCO = vcXMLCCO;
            EntConsNisira.vcXMLPC = xmlStringXMLPC;
            EntConsNisira.vcAGRUP_CC = obj.vcAGRUP_CC;
            EntConsNisira.vcAGRUP_CTA = obj.vcAGRUP_CTA;
            EntConsNisira.vcC_TIPO_CC = obj.vcC_TIPO_CC;

            DataSet ds = NegConsNisira.CostosDistribuidos_List(EntConsNisira);
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
        public object GrupoCecoCuenta_List(ConsNisiraBE obj)
        {
            EntConsNisira.vnId = obj.vnId;
            EntConsNisira.vcType = obj.vcType;
            EntConsNisira.vcNombre = obj.vcNombre;
            DataSet ds = NegConsNisira.GrupoCecoCuenta_List(EntConsNisira);
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
        public object GrupoCecoCuenta_Regi(ConsNisiraBE obj)
        {
            EntConsNisira.vcId = obj.vcId;
            EntConsNisira.vcType = obj.vcType;
            EntConsNisira.vcNombre = obj.vcNombre;
            EntConsNisira.vcCecos = obj.vcCecos;
            EntConsNisira.vcCuenta = obj.vcCuenta;
            DataSet ds = NegConsNisira.GrupoCecoCuenta_Merge(EntConsNisira);
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
        public object GRUPOCC(ConsNisiraBE obj)
        {
            EntConsNisira.vcType = obj.vcType;
            EntConsNisira.vcEmpresa = obj.vcEmpresa;
            EntConsNisira.vcSucursal = obj.vcSucursal;
            DataSet ds = NegConsNisira.SN_DateNisira_list(EntConsNisira);
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
        public object DateNisira_list(ConsNisiraBE obj)
        {
            EntConsNisira.vcType = obj.vcType;
            EntConsNisira.vcEmpresa = obj.vcEmpresa;
            EntConsNisira.vcSucursal = obj.vcSucursal;
            DataSet ds = NegConsNisira.SN_DateNisira_list(EntConsNisira);
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
        public object RepVentasList(ConsNisiraBE obj)
        {
            EntConsNisira.vcIdEmpresa = obj.vcIdEmpresa;
            EntConsNisira.vcFecha = obj.vcFecha;
            EntConsNisira.vcFechaFin = obj.vcFechaFin;
            EntConsNisira.vcCampana = obj.vcCampana;
            DataSet dsx = NegConsNisira.RepVentasList(EntConsNisira);
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
        public object ListGastosxAgrupador(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcPeriodo = obj.vcPeriodo;
            EntConsNisira.vcPeriodoHasta = obj.vcPeriodoHasta;
            EntConsNisira.vcAgrupadorCC = obj.vcAgrupadorCC;
            EntConsNisira.vcAgrupadorCTA = obj.vcAgrupadorCTA;
            EntConsNisira.vbEstado = obj.vbEstado;
            DataSet dsx = NegConsNisira.ListGastosxAgrupador(EntConsNisira);
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
        public object ListCostosMOSemana(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcAnio = obj.vcAnio;
            EntConsNisira.vcSemana = obj.vcSemana;
            DataSet dsx = NegConsNisira.ListCostosMOSemana(EntConsNisira);
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
        public object ListPakingListFac(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vnFormato = obj.vnFormato;
            DataSet dsx = NegConsNisira.ListPakingListFac(EntConsNisira);
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
        public object ListGerCostos(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcUsuario = GetParamCokkie("cd_user");
            EntConsNisira.vcPeriodo = obj.vcPeriodo;
            EntConsNisira.vcAmbito = obj.vcAmbito;
            DataSet dsx = NegConsNisira.ListReporteGerencialCostos(EntConsNisira);
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
        public object ListSaldoAlmacen(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = obj.vnIdEmpresa;
            EntConsNisira.vcSucursal = obj.vcSucursal;
            EntConsNisira.vcUsuario = GetParamCokkie("cd_user");
            var fr = DateTime.ParseExact(obj.vcFecha, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntConsNisira.vdFecha = fr.Date;
            EntConsNisira.vnDetalle = 1;
            DataSet dsx = NegConsNisira.ListSaldoAlmacen(EntConsNisira);
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
        public object ListCosteo(ConsNisiraBE obj)
        {

            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntConsNisira.vcUsuario = GetParamCokkie("cd_user");
            EntConsNisira.vcPeriodo = obj.vcPeriodo;
            EntConsNisira.vcAmbito = obj.vcAmbito;
            DataSet dsx = NegConsNisira.ListCosteo(EntConsNisira);
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
        public object VerifiPathImage(DocumentoBE obj)
        {

            string folderPath = Server.MapPath("~/Mod_Agro/Files/");
            string imagePath = folderPath+obj.vcFilename;
            FileInfo myFile = new FileInfo(imagePath);

            if (myFile.Exists.Equals(true))
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

        [WebMethod]
        public object ListFechaAct(ConsNisiraBE obj)
        {
            EntConsNisira.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            var fr = DateTime.ParseExact(obj.vcFecha, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            EntConsNisira.vdFecha = fr.Date; 
            DataSet dsx = NegConsNisira.ListFechaAct(EntConsNisira);
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

            EntOrganigrama.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrganigrama.vnidOrganigrama = obj.vnidOrganigrama;
            EntOrganigrama.vnIdNivel = obj.vnIdNivel;
            EntOrganigrama.vnIdNivelMaster = obj.vnIdNivelMaster;
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
        public object ListIntegrante(IntegranteBE obj)
        {

            EntIntegrante.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIntegrante.vnidIntegrante = obj.vnidIntegrante;
            EntIntegrante.vnIdNivel = obj.vnIdNivel;
            EntIntegrante.vnIdPersonal = obj.vnIdPersonal;
            DataSet dsx = NegIntegrante.ListIntegrante(EntIntegrante);
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
        public object DeleteItem(OrganigramaBE obj)
        {

            EntOrganigrama.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrganigrama.vnidOrganigrama = obj.vnidOrganigrama;
            EntOrganigrama.vnIdNivel = obj.vnIdNivel;
            EntOrganigrama.vnIdNivelMaster = obj.vnIdNivelMaster;
            DataSet dsx = NegOrganigrama.DeleteItem(EntOrganigrama);
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
        public object DeleteIntegrante(IntegranteBE obj)
        {

            EntIntegrante.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIntegrante.vnidIntegrante = obj.vnidIntegrante;
            EntIntegrante.vnIdNivel = obj.vnIdNivel;
            EntIntegrante.vnIdPersonal = obj.vnIdPersonal;
            DataSet dsx = NegIntegrante.DeleteIntegrante(EntIntegrante);
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
        public string[] ArrayPersonal(PersonalBE obj)
        {
            EntPersonal.vnIdEmpresa = 0;
            EntPersonal.vnIdPersonal = obj.vnIdPersonal;
            EntPersonal.vcNroDocumento = obj.vcNroDocumento;
            EntPersonal.vcNombres = obj.vcNombres;
            EntPersonal.vcIdPlanilla = obj.vcIdPlanilla;
            EntPersonal.vcCodigoLabor = obj.vcCodigoLabor;
            return NegPersonal.ArrayPersonal(EntPersonal);
        }

        [WebMethod]
        public object RegiOrganigrama(OrganigramaBE obj)
        {
            int longitud = 3;
            Guid miGuid = Guid.NewGuid();
            string token = Convert.ToBase64String(miGuid.ToByteArray());
            token = token.Replace("=", "").Replace("+", "").Replace("/", "");
            token.Substring(0, longitud);

            EntOrganigrama.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntOrganigrama.vnidOrganigrama = obj.vnidOrganigrama;
            EntOrganigrama.vnIdNivel = obj.vnIdNivel;
            EntOrganigrama.vnIdNivelMaster = obj.vnIdNivelMaster;
            EntOrganigrama.vnNivel = obj.vnNivel;
            EntOrganigrama.vcNomOrg = obj.vcNomOrg;
            if (obj.vcImg.Contains("data:image/png;base64,") && obj.vcImg != "" && obj.vcImg != "/Img/avatar/avatar.png")
            {
                string folderPath = Server.MapPath("~/Img/avatar/");  //Create a Folder in your Root directory on your solution.
                string fileName = obj.vnIdNivel+token+".jpg";
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
                    EntOrganigrama.vcImg = obj.vnIdNivel + token + ".jpg";
                }
                else
                {
                    EntOrganigrama.vcImg = "";
                }
            }
            else
            {
                EntOrganigrama.vcImg = obj.vcImg.Replace("/Img/avatar/", "");
            }
            
            EntOrganigrama.vcDesOrgItem = obj.vcDesOrgItem;
            EntOrganigrama.vcDesInfoItem = obj.vcDesInfoItem;
            EntOrganigrama.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegOrganigrama.RegiOrganigrama(EntOrganigrama);
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
        public object RegiIntegrante(IntegranteBE obj)
        {
            int longitud = 3;
            Guid miGuid = Guid.NewGuid();
            string token = Convert.ToBase64String(miGuid.ToByteArray());
            token = token.Replace("=", "").Replace("+", "").Replace("/", "");
            token.Substring(0, longitud);

            EntIntegrante.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntIntegrante.vnidIntegrante = obj.vnidIntegrante;
            EntIntegrante.vnIdNivel = obj.vnIdNivel;
            EntIntegrante.vcDescCargo = obj.vcDescCargo;
            EntIntegrante.vnIdPersonal = obj.vnIdPersonal;
            if (obj.vcImg.Contains("data:image/png;base64,") && obj.vcImg != "" && obj.vcImg != "/Img/avatar/avatar.png")
            {
                string folderPath = Server.MapPath("~/Img/avatar/");  //Create a Folder in your Root directory on your solution.
                string fileName = obj.vnIdPersonal + ".jpg";
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
                    EntIntegrante.vcImg = obj.vnIdPersonal + ".jpg";
                }
                else
                {
                    EntIntegrante.vcImg = "";
                }
            }
            else
            {
                EntIntegrante.vcImg = obj.vcImg.Replace("/Img/avatar/", "");
            }


            DataSet dsx = NegIntegrante.RegiIntegrante(EntIntegrante);
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
        public object ListTipoDoc(TipoDocumentoBE obj)
        {

            EntTipoDoc.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntTipoDoc.vnIdTipoDoc = obj.vnIdTipoDoc;
            EntTipoDoc.vcDescTipoDoc = obj.vcDescTipoDoc;
            DataSet dsx = NegTipoDoc.ListTipoDocumento(EntTipoDoc);
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
        public object RegiTipoDoc(TipoDocumentoBE obj)
        {
            EntTipoDoc.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntTipoDoc.vnIdTipoDoc = obj.vnIdTipoDoc;
            EntTipoDoc.vcDescTipoDoc = obj.vcDescTipoDoc;
            EntTipoDoc.vcUsuario = GetParamCokkie("cd_user");
            DataSet dsx = NegTipoDoc.RegiTipoDocumento(EntTipoDoc);
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
        public object ListDocumento(DocumentoBE obj)
        {

            EntFiles.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFiles.vnIdDocumento = obj.vnIdDocumento;
            EntFiles.vnIdTipoDoc = obj.vnIdTipoDoc;
            DataSet dsx = NegFiles.ListDocumento(EntFiles);
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
        public object RegiDocumento(DocumentoBE obj)
        {
            int longitud = 3;
            Guid miGuid = Guid.NewGuid();
            string token = Convert.ToBase64String(miGuid.ToByteArray());
            token = token.Replace("=", "").Replace("+", "").Replace("/", "");
            token.Substring(0, longitud);

            EntFiles.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFiles.vnIdDocumento = obj.vnIdDocumento;
            EntFiles.vcTitulo = obj.vcTitulo;
            EntFiles.vcDescripcion = obj.vcDescripcion;
            EntFiles.vnIdClieProv = obj.vnIdClieProv;
            EntFiles.vnIdTipoDoc = obj.vnIdTipoDoc;
            EntFiles.vnNumero = obj.vnNumero;
            EntFiles.vnSerie = obj.vnSerie;
            EntFiles.vcReferencia = obj.vcReferencia;
            EntFiles.vbDownload = obj.vbDownload;
            EntFiles.vbPublico = obj.vbPublico;

            EntFiles.vcUsuarioCrea = GetParamCokkie("cd_user");

            if (obj.vFiles != "" && obj.vExt != "")
            {
                string folderPath = Server.MapPath("~/Mod_Agro/Files/");
                //string folderPath = Server.MapPath(@"\\172.16.16.16\Nisira File\Fotos_personal\Formatos_sfe\FOT\");
                
                string fileName = token+"."+obj.vExt;
                string FilePath = folderPath + fileName;

                string base64StringData = obj.vFiles; // Your base 64 string data
                byte[] data = System.Convert.FromBase64String(base64StringData);
                MemoryStream ms = new MemoryStream(data);
                //write to file
                FileStream file = new FileStream(FilePath, FileMode.Create, FileAccess.Write);
                ms.WriteTo(file);
                file.Close();
                ms.Close();

                FileInfo filev = new FileInfo(FilePath);



                string FileforDelete = folderPath + obj.vFileName;
                FileInfo FileDelete = new FileInfo(FileforDelete);
                if (FileDelete.Exists.Equals(true))
                {
                    File.Delete(FileforDelete);
                }

                if (filev.Exists.Equals(true))
                {
                    EntFiles.vcFilename = fileName;
                }
                else
                {
                    EntFiles.vcFilename = "0";
                }
            }
            else
            {
                EntFiles.vcFilename = obj.vFileName;
            }


            DataSet dsx = NegFiles.RegiDocumento(EntFiles);
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
        public object DeleteDocumento(DocumentoBE obj)
        {

            EntFiles.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntFiles.vnIdDocumento = obj.vnIdDocumento;
            EntFiles.vnIdTipoDoc = obj.vnIdTipoDoc;

       
                string folderPath = Server.MapPath("~/Mod_Agro/Files/");
    
                string FileforDelete = folderPath + obj.vFileName;
                FileInfo FileDelete = new FileInfo(FileforDelete);
                if (FileDelete.Exists.Equals(true))
                {
                    File.Delete(FileforDelete);
                }

            DataSet dsx = NegFiles.DeleteDocumento(EntFiles);
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


        /*ANGEL GONZALES CASTILLA - TI*/

        [WebMethod]
        public object mostrarambitos_WBS()
        {
            int x = 0;
            DataSet dsx = Negsxo.MostrarAmbitoxDocumento_BL();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];
            //Recorremos todas las filas del DATATABLE
            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["idambitoxc"]) + '-' + Convert.ToString(row["descripcion"]);
                x++;
            }
            return arr;
        }


        [WebMethod]
        public string[] mostrarvendedor_WBS()
        {
            int x = 0;
            DataSet dsx = Negsxo.MostrarVendedor_BL();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];
            //Recorremos todas las filas del DATATABLE
            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["IDVENDEDOR"]) + '-' + Convert.ToString(row["DESCRIPCION"]);
                x++;
            }
            return arr;
        }

        [WebMethod]
        public string[] mostrarcliente_WBS()
        {
            int x = 0;
            DataSet dsx = Negsxo.MostrarCliente_BL();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];
            //Recorremos todas las filas del DATATABLE
            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["IDCLIEPROV"]) + '-' + Convert.ToString(row["RAZON_SOCIAL"]);
                x++;
            }
            return arr;
        }

        [WebMethod]
        public string[] mostrarcampanaSXC_WBS()
        {
            int x = 0;
            DataSet dsx = Negsxo.MostrarCampana_BL();
            DataTable dt = dsx.Tables[0];

            //Cuenta la cantidad de filas que me devuelve mi DATASET
            string[] arr = new string[dt.Rows.Count];
            //Recorremos todas las filas del DATATABLE
            foreach (DataRow row in dt.Rows)
            {
                arr[x] = Convert.ToString(row["IDFECHA"]) + '-' + Convert.ToString(row["DESCRIPCION"]);
                x++;
            }
            return arr;
        }

        [WebMethod]
        public object PivotTablaSXCobrar(SaldoxCobrarBE objtable)
        {
            Entsxco.idempresa = 001;
            Entsxco.ambito = objtable.ambito;
            Entsxco.vendedor = objtable.vendedor;
            Entsxco.destino = objtable.destino;
            Entsxco.clie_prov = objtable.clie_prov;
            Entsxco.campana = objtable.campana;

            DataSet dsx = Negsxo.TablaPivot_BL(Entsxco);
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

            var data = new
            {
                d1 = rows
            };

            return serializer.Serialize(data);
        }


        /********************************************************************************************/





        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

    }
}
