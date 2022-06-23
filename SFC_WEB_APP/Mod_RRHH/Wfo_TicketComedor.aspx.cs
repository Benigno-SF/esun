using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_TicketComedor : System.Web.UI.Page
    {


        ConsExternaBE EntCons = new ConsExternaBE();
        ConsExternaBL NegCons = new ConsExternaBL();

        TicketAlimentoBE EntTickAli = new TicketAlimentoBE();
        TicketAlimentoBL NegTickAli = new TicketAlimentoBL();

        TipoEventoBE EntTeven = new TipoEventoBE();
        TipoEventoBL NegTeven = new TipoEventoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GvLoad();
                ddlTipoEventoLoad();
            }
        }

        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
             GvLoad();
        }

        private void ddlTipoEventoLoad()
        {
            EntTeven.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntTeven.vnIdTipoEvento = 0;
            ddlTipoEvento.DataSource = NegTeven.ListTipEventos(EntTeven);
            ddlTipoEvento.DataValueField = "nIdTipoEvento";
            ddlTipoEvento.DataTextField = "cDescEvento";
            ddlTipoEvento.DataBind();
            this.ddlTipoEvento.Items.Insert(0, new ListItem("Selecciona Evento", "00"));
        }

        public void GvLoad()
        {
            DataTable dt = ViewState["dt"] as DataTable;
            // EntTickCom.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCons.vcFechaIni = txtFeIni.Value;
            EntCons.vcFechaFin = txtFeFin.Value;
            dt = NegCons.ConsultaMarcasList(EntCons).Tables[0];
            GvList.DataSource = dt;
            ViewState["dt"] = dt;
            GvList.DataBind();
            //UpdGv.Update();
        }

        public void GvAdd() {
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
        }
        
        protected void btnaddExecep_ServerClick(object sender, EventArgs e)
        {
            GvAdd();
        }

        protected void btnGvDelete_ServerClick(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            string cIdCodigo = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            //
            DataTable dt = ViewState["dt"] as DataTable;
            dt.Rows.Remove(dt.Select("cIdcodigogeneral = '" + cIdCodigo + "'")[0]);
            GvList.DataSource = dt;
            ViewState["dt"] = dt;
            GvList.DataBind();
        }

        protected void SendMarcas_ServerClick(object sender, EventArgs e)
        {
            DataTable dt = ViewState["dt"] as DataTable;
            int rest;
            EntTickAli.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntTickAli.vnIdTipoEvento = Convert.ToInt32(ddlTipoEvento.SelectedValue);
            //03/09/2019 17:50
            EntTickAli.vdFechaAut = DateTime.ParseExact(FechaEnvio.Value,
              "dd/MM/yyyy HH:mm", System.Globalization.CultureInfo.InvariantCulture);
            rest = NegTickAli.RegiProvTicket(EntTickAli, dt);


            dt.Rows.Clear();
            GvList.DataSource = dt;
            ViewState["dt"] = dt;
            GvList.DataBind();

            //string script = @"<script type='text/javascript'> crg(); </script>";
            //ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
        }

    }
}