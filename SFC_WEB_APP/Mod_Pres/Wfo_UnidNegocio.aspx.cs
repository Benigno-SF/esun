using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Pres
{
    public partial class Wfo_UnidNegocio : System.Web.UI.Page
    {
        PresupuestoUnidadNegBE EntPresUni = new PresupuestoUnidadNegBE();
        PresupuestoUnidadNegBL NegPresUni = new PresupuestoUnidadNegBL();
        
        PresupuestoBE EntPres = new PresupuestoBE();
        PresupuestoBL NegPres = new PresupuestoBL();

        FormatoBE EntForm = new FormatoBE();
        FormatoBL NegForm = new FormatoBL();

        CultivoBE EntCult = new CultivoBE();
        CultivoBL NegCult = new CultivoBL();

        UnidadNegBE EntUnid = new UnidadNegBE();
        UnidadNegBL NegUnid = new UnidadNegBL();

        FundoBE EntFund = new FundoBE();
        FundoBL NegFund = new FundoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
                ddlPresupLoad();
                ddlFundoLoad();
                ddlCultivoLoad();
                ddlFormatLoad();
                GvLoad();
            }
        }
        private void ddlPresupLoad()
        {
            EntPres.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPres.vnIdPresupuesto = 0;
            EntPres.vcDenominacion = "";
            EntPres.vbEstado = false;
            ddlPresup.DataSource = NegPres.ListPresupuesto(EntPres);
            ddlPresup.DataValueField = "nIdPresupuesto";
            ddlPresup.DataTextField = "cDenominacion";
            ddlPresup.DataBind();
            this.ddlPresup.Items.Insert(0, new ListItem("Selecciona", "0"));
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
            ddlCultivo.DataSource = NegCult.ListCultivo(EntCult);
            ddlCultivo.DataValueField = "nIdCultivo";
            ddlCultivo.DataTextField = "cDesCultivo";
            ddlCultivo.DataBind();
            this.ddlCultivo.Items.Insert(0, new ListItem("Todos", "0"));
        }
        private void ddlFormatLoad()
        {
            EntForm.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntForm.vnIdTipo = 2;
            EntForm.vnIdCultivo = Convert.ToInt32(ddlCultivo.SelectedValue);
            EntForm.vcUsuario = this.Master.GetParamCokkie("cd_user");
            DataSet ds = NegForm.ListFormUser(EntForm);
            ddlFormato.DataSource = ds;
            ddlFormato.DataValueField = "nIdFormato";
            ddlFormato.DataTextField = "cDescFormato";
            ddlFormato.DataBind();
            this.ddlFormato.Items.Insert(0, new ListItem("Todos", "0"));
        }
        private void GvLoad()
        {
            EntPresUni.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPresUni.vnIdPresupuesto = Convert.ToInt32(ddlPresup.SelectedValue);
            EntPresUni.vnIdFundo = Convert.ToInt32(ddlFundo.SelectedValue);
            EntPresUni.vnIdCultivo = Convert.ToInt32(ddlCultivo.SelectedValue);
            EntPresUni.vnIdFormato = Convert.ToInt32(ddlFormato.SelectedValue);
            EntPresUni.vnIdUnidadNeg = 0;
            EntPresUni.vcUsuario = this.Master.GetParamCokkie("cd_user");
            GvList.DataSource = NegPresUni.ListPresUnidNeg(EntPresUni);
            GvList.DataBind();
        }
        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }

        protected void btnGvEdit_ServerClick(object sender, EventArgs e)
        {
            string Cd = this.Master.GetParamURL("Cd", true);
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdPres"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Session["IdUNeg"] = GvList.DataKeys[row.RowIndex].Values[1].ToString();
            Session["IdForm"] = GvList.DataKeys[row.RowIndex].Values[2].ToString();
            Response.Redirect("Wfo_UnidNegocio-Edit.aspx?Cd=" + Cd);
        }

        protected void btnAgregar_ServerClick(object sender, EventArgs e)
        {
            Session["IdPres"] = 0;
            Session["IdUNeg"] = 0;
            Session["IdForm"] = 0;
            Response.Redirect("Wfo_UnidNegocio-Edit.aspx?Cd=" + (this.Master.GetParamURL("Cd", true)));
        }

        protected void ddlFundo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCultivoLoad();
        }

        protected void ddlCultivo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlFormatLoad();
        }

        protected void btnRepo_ServerClick(object sender, EventArgs e)
        {
            string Cd = this.Master.GetParamURL("Cd", true);
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdPres"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Session["IdUNeg"] = GvList.DataKeys[row.RowIndex].Values[1].ToString();
            Session["IdForm"] = GvList.DataKeys[row.RowIndex].Values[2].ToString();
            Session["IdNive"] = "4";
            Response.Redirect("Wfo_UnidNegocio-Repo.aspx?Cd=" + Cd);
        }
    }
}