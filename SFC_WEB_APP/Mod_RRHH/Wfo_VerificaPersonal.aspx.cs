using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using SFC_BE;
using SFC_BL;

using System.IO;
using System.Net;
using Newtonsoft.Json;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_VerificaPersonal : System.Web.UI.Page
    {
        PersonalBE EntPersonal = new PersonalBE();
        PersonalBL NegPersonal = new PersonalBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //loaddata.Visible = false;
                //GvLoad();
            }
        }
        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
            //loaddata.Visible = true;
        }

        public void GvLoad()
        {
           // loaddata.Visible = true;
            DataTable dt = ViewState["dt"] as DataTable;
            EntPersonal.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPersonal.vcNroDocumento = "";
            dt = NegPersonal.ListPersonalNuevo(EntPersonal).Tables[0];
            
            DataTable dt2 = new DataTable();
            dt2.Columns.AddRange(new DataColumn[10] { new DataColumn("nIdPersonal"), new DataColumn("cNroDocumento"), new DataColumn("cApPaterno"), new DataColumn("cApMaterno"), new DataColumn("cNombres"), new DataColumn("cSexo"), new DataColumn("dFechaNac"), new DataColumn("dFechaRegistro"), new DataColumn("bEstado"), new DataColumn("nEstado") });

            foreach (DataRow row in dt.Rows)
            {


                var estado = ""; 
                if (row["nEstado"].ToString() == "0") { estado = "0"; } 
                else if (row["nEstado"].ToString() == "3") { estado = "3"; }
                else if (row["nEstado"].ToString() == "4") { estado = "4"; }

                if (row["cApPaterno"].ToString() == "" && row["cNombres"].ToString() == "")
                {
                    string url = "https://ww1.essalud.gob.pe/sisep/postulante/postulante/postulante_obtenerDatosPostulante.htm";
                    ServicePointManager.CertificatePolicy = new MyPolicy();
                    //var jsonObject = new object();
                    string jsonObject;

                    HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
                    req.KeepAlive = false;
                    req.ProtocolVersion = HttpVersion.Version10;
                    req.Method = "POST";
                    req.ContentType = "application/x-www-form-urlencoded";
                    byte[] postBytes = System.Text.Encoding.ASCII.GetBytes("strDni=" + row["cNroDocumento"].ToString());
                    req.ContentType = "application/x-www-form-urlencoded";
                    req.ContentLength = postBytes.Length;
                    Stream requestStream = req.GetRequestStream();
                    requestStream.Write(postBytes, 0, postBytes.Length);
                    requestStream.Close();
                    //
                    HttpWebResponse response = (HttpWebResponse)req.GetResponse();
                    Stream resStream = response.GetResponseStream();
                    //
                    var sr = new StreamReader(response.GetResponseStream());
                    jsonObject = sr.ReadToEnd();
                    var obj = JsonConvert.DeserializeObject<personalJson>(jsonObject);
                    foreach (var personal in obj.DatosPerson)
                    {
                        var sex = ""; if (personal.Sexo == "2"){ sex = "M"; } else if (personal.Sexo == "3") { sex = "F"; }
                        dt2.Rows.Add(row["nIdPersonal"].ToString(), row["cNroDocumento"].ToString(), personal.ApellidoPaterno, personal.ApellidoMaterno, personal.Nombres, sex, personal.FechaNacimiento, row["dFechaRegistro"].ToString(), row["bEstado"].ToString(), estado);
                    }
                }
                else {
                        dt2.Rows.Add(row["nIdPersonal"].ToString(), row["cNroDocumento"].ToString(), row["cApPaterno"].ToString(), row["cApMaterno"].ToString(), row["cNombres"].ToString(), "", "", row["dFechaRegistro"].ToString(), row["bEstado"].ToString(), estado);
                }
            }
            //GvList.DataSource = dt2;
            ViewState["dt2"] = dt2;
           // GvList.DataBind();
            //UpdGv.Update();

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

        //protected void btnGvDelete_ServerClick(object sender, EventArgs e)
        //{
        //    System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
        //    GridViewRow row = (GridViewRow)btn.NamingContainer;
        //    string cIdCodigo = GvList.DataKeys[row.RowIndex].Values[0].ToString();
        //    //
        //    DataTable dt = ViewState["dt2"] as DataTable;
        //    dt.Rows.Remove(dt.Select("nIdPersonal='" + cIdCodigo + "'")[0]);
        //    GvList.DataSource = dt;
        //    ViewState["dt2"] = dt;
        //    GvList.DataBind();
        //}

      /*  public void GvAdd()
        {
            DataTable dt = ViewState["dt"] as DataTable;
            var row = dt.NewRow();
            row["cIdCodigoGeneral"] = hdfCodigo.Value;
            row["cCodigoControl"] = hdfTarjeta.Value;
            row["cNombres"] = hdfcNombres.Value;
            row["Checktime"] = DateTime.Now.ToString();
            row["cGrupoTrabajo"] = hdfcGrupo.Value;
            dt.Rows.InsertAt(row, 0);
            GvList.DataSource = dt;
            ViewState["dt"] = dt;
            GvList.DataBind();
        }*/

        protected void btnaddExecep_ServerClick(object sender, EventArgs e)
        {
            //GvAdd();
        }

        protected void SendMarcas_ServerClick(object sender, EventArgs e)
        {
            DataTable dt = ViewState["dt2"] as DataTable;
            foreach (DataRow row in dt.Rows)
            {
               
                EntPersonal.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                EntPersonal.vnIdPersonal = Convert.ToInt32(row["nIdPersonal"]);
                EntPersonal.vcNroDocumento = row["cNroDocumento"].ToString();
                EntPersonal.vcApPaterno = row["cApPaterno"].ToString();
                EntPersonal.vcApMaterno = row["cApMaterno"].ToString();
                EntPersonal.vcNombres = row["cNombres"].ToString();
                EntPersonal.vcSexo = row["cSexo"].ToString();
                EntPersonal.vdFechaNacimiento = Convert.ToDateTime(row["dFechaNac"]); 
                EntPersonal.vdFechaRegistro = Convert.ToDateTime(row["dFechaRegistro"]);
                //EntPersonal.vnEstado = Convert.ToInt32(row["nEstado"]);
                String vvMsje = NegPersonal.RegiPersonalNuevo(EntPersonal);

            }

            dt.Rows.Clear();
           // GvList.DataSource = dt;
            ViewState["dt2"] = dt;
            //GvList.DataBind();
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


    }
}