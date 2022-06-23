using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Pres
{
    public partial class Wfo_PresIndirecto_Edit : System.Web.UI.Page
    {
        PresupuestoBE EntPres = new PresupuestoBE();
        PresupuestoBL NegPres = new PresupuestoBL();
        FormatoBE EntForm = new FormatoBE();
        FormatoBL NegForm = new FormatoBL();

        FormatoDetalleBE EntFormDeta = new FormatoDetalleBE();
        FormatoDetalleBL NegFormDeta = new FormatoDetalleBL();

        FundoBE EntFund = new FundoBE();
        FundoBL NegFund = new FundoBL();

        CultivoBE EntCult = new CultivoBE();
        CultivoBL NegCult = new CultivoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlPresupLoad();
                ddlFormatLoad();
                ddlIdPresup.SelectedValue = this.Master.GetSessionN("IdPres").ToString();
                ddlIdForm.SelectedValue = this.Master.GetSessionN("IdForm").ToString();
                ddlFundoLoad();
                ddlCultivoLoad();
                ddlDriverLoad();
                ddlDestLoad();
            }
        }
        private void ddlPresupLoad()
        {
            EntPres.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPres.vnIdPresupuesto = 0;
            EntPres.vcDenominacion = "";
            EntPres.vbEstado = false;
            ddlIdPresup.DataSource = NegPres.ListPresupuesto(EntPres);
            ddlIdPresup.DataValueField = "nIdPresupuesto";
            ddlIdPresup.DataTextField = "cDenominacion";
            ddlIdPresup.DataBind();
            this.ddlIdPresup.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlFormatLoad()
        {
            EntForm.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntForm.vnIdFormato = 0;
            EntForm.vnIdTipo = 3;
            ddlIdForm.DataSource = NegForm.ListForm(EntForm); ;
            ddlIdForm.DataValueField = "nIdFormato";
            ddlIdForm.DataTextField = "cDescFormato";
            ddlIdForm.DataBind();
            this.ddlIdForm.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlDestLoad()
        {
            EntFormDeta.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntFormDeta.vnIdFormato = Convert.ToInt32(ddlIdForm.SelectedValue);
            EntFormDeta.vnNivel = 2;
            EntFormDeta.vnIdParamTitulo = 0;
            ddlDest.DataSource = NegFormDeta.ListFormDeta(EntFormDeta);
            ddlDest.DataValueField = "nIdParametro";
            ddlDest.DataTextField = "cDescParametro";
            ddlDest.DataBind();
            this.ddlDest.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlItemLoad()
        {
            EntFormDeta.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntFormDeta.vnIdFormato = Convert.ToInt32(ddlIdForm.SelectedValue);
            EntFormDeta.vnNivel = 0;
            EntFormDeta.vnIdParamTitulo = Convert.ToInt32(ddlDest.SelectedValue);
            ddlItem.DataSource = NegFormDeta.ListFormDeta(EntFormDeta); ;
            ddlItem.DataValueField = "nIdParametro";
            ddlItem.DataTextField = "cDescParametro";
            ddlItem.DataBind();
            this.ddlItem.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlFundoLoad()
        {
            EntFund.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlFundo.DataSource = NegFund.ListFundo(EntFund);
            ddlFundo.DataValueField = "nIdFundo";
            ddlFundo.DataTextField = "cDescFundo";
            ddlFundo.DataBind();
            this.ddlFundo.Items.Insert(0, new ListItem("Todos", "0"));
        }
        private void ddlCultivoLoad()
        {
            EntCult.vnIdCultivo = 0;
            EntCult.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCult.vnIdFundo = Convert.ToInt32(ddlFundo.SelectedValue);
            ddlCult.DataSource = NegCult.ListCultivo(EntCult);
            ddlCult.DataValueField = "nIdCultivo";
            ddlCult.DataTextField = "cDesCultivo";
            ddlCult.DataBind();
            this.ddlCult.Items.Insert(0, new ListItem("Todos", "0"));
        }
        private void ddlDriverLoad()
        {
            this.ddlDriver.Items.Insert(0, new ListItem("Ha", "Ha"));
            this.ddlDriver.Items.Insert(0, new ListItem("Atribuido", "Atribuido"));
        }
        protected void ddlIdForm_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDestLoad();
        }

        protected void ddlDest_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlItemLoad();
        }

        protected void ddlFundo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCultivoLoad();
        }
    }
}