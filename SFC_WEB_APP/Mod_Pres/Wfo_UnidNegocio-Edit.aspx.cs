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
    public partial class Wfo_UnidNegocio_Edit : System.Web.UI.Page
    {
        UnidadNegBE EntUnid = new UnidadNegBE();
        UnidadNegBL NegUnid = new UnidadNegBL();

        FormatoBE EntForm = new FormatoBE();
        FormatoBL NegForm = new FormatoBL();

        PresupuestoBE EntPres = new PresupuestoBE();
        PresupuestoBL NegPres = new PresupuestoBL();
        UnidadNegBE EntUNeg = new UnidadNegBE();
        UnidadNegBL NegUNeg = new UnidadNegBL();

        PresupuestoVersionBE EntPresVers = new PresupuestoVersionBE();
        PresupuestoVersionBL NegPresVers = new PresupuestoVersionBL();

        PresupuestoUnidadNegBE EntPresUni = new PresupuestoUnidadNegBE();
        PresupuestoUnidadNegBL NegPresUni = new PresupuestoUnidadNegBL();

        FundoBE EntFund = new FundoBE();
        FundoBL NegFund = new FundoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlPresupLoad();
                ddlFormatLoad();
                ddlFundoLoad();
                ddlUnidNegLoad();
                int IdPres = Convert.ToInt32(Session["IdPres"] == null ? "0" : Session["IdPres"].ToString());
                if (IdPres > 0)
                    LoadData();
                ddlVersLoad();
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
            EntForm.vnIdTipo = 2;
            EntForm.vnIdCultivo = Convert.ToInt32(hdfIdCult.Value);
            EntForm.vcUsuario = this.Master.GetParamCokkie("cd_user");
            ddlIdForm.DataSource = NegForm.ListFormUser(EntForm); ;
            ddlIdForm.DataValueField = "nIdFormato";
            ddlIdForm.DataTextField = "cDescFormato";
            ddlIdForm.DataBind();
            this.ddlIdForm.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlFundoLoad()
        {
            EntFund.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlCdFundo.DataSource = NegFund.ListFundo(EntFund);
            ddlCdFundo.DataValueField = "nIdFundo";
            ddlCdFundo.DataTextField = "cDescFundo";
            ddlCdFundo.DataBind();
            this.ddlCdFundo.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlUnidNegLoad()
        {
            EntUNeg.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntUNeg.vnIdUnidadNeg = 0;
            EntUNeg.vnIdFundo = Convert.ToInt32(ddlCdFundo.SelectedValue);
            EntUNeg.vnIdCultivo = 0;
            EntUNeg.vcDescUnidadNeg = "";
            EntUNeg.vcUsuario = this.Master.GetParamCokkie("cd_user");

            ddlIdUnidNeg.DataSource = NegUNeg.ListUnidNeg(EntUNeg);
            ddlIdUnidNeg.DataValueField = "nIdUnidadNeg";
            ddlIdUnidNeg.DataTextField = "cDescUnidadNeg";
            ddlIdUnidNeg.DataBind();
            this.ddlIdUnidNeg.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlVersLoad()
        {
            EntPresVers.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPresVers.vnIdPresupuesto = Convert.ToInt32(ddlIdPresup.SelectedItem.Value);
            EntPresVers.vnIdUnidadNeg = Convert.ToInt32(ddlIdUnidNeg.SelectedItem.Value);
            EntPresVers.vnIdFormato = Convert.ToInt32(ddlIdForm.SelectedItem.Value);
            EntPresVers.vnVersion = 0;
            ddlVersion.DataSource = NegPresVers.ListPresupVersion(EntPresVers);
            ddlVersion.DataValueField = "Codigo";
            ddlVersion.DataTextField = "Nombre";
            ddlVersion.DataBind();
            this.ddlVersion.Items.Insert(0, new ListItem("Nuevo", "0"));
            if (hdfIdVers.Value != "0") {
                ddlVersion.SelectedValue = hdfIdVers.Value;
                chkFinal.Enabled = false;
            }
        }
        protected void ddlCdFundo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlUnidNegLoad();
        }
        protected void ddlIdUnidNeg_SelectedIndexChanged(object sender, EventArgs e)
        {
            EntUNeg.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntUNeg.vnIdUnidadNeg = Convert.ToInt32(ddlIdUnidNeg.SelectedValue);
            EntUNeg.vcFundo = ddlCdFundo.SelectedValue;
            EntUNeg.vnIdCultivo = 0;
            EntUNeg.vcDescUnidadNeg = "";
            EntUNeg.vcUsuario = this.Master.GetParamCokkie("cd_user");
            DataSet ds = NegUNeg.ListUnidNeg(EntUNeg);
            lblNumHA.Text = ds.Tables["get"].Rows[0]["nHa"].ToString();
            hdfIdCult.Value = ds.Tables["get"].Rows[0]["nIdCultivo"].ToString();
            lblCult.Text = ds.Tables["get"].Rows[0]["cDesCultivo"].ToString();
            ddlFormatLoad();
        }
        private void LoadData() {
            EntPresUni.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPresUni.vnIdPresupuesto = Convert.ToInt32(Session["IdPres"] == null ? "0" : Session["IdPres"].ToString());
            EntPresUni.vnIdFundo = 0;
            EntPresUni.vnIdCultivo = 0;
            EntPresUni.vnIdUnidadNeg = Convert.ToInt32(Session["IdUNeg"] == null ? "0" : Session["IdUNeg"].ToString());
            EntPresUni.vnIdFormato = Convert.ToInt32(Session["IdForm"] == null ? "0" : Session["IdForm"].ToString());
            EntPresUni.vcUsuario = this.Master.GetParamCokkie("cd_user");
            DataSet ds = NegPresUni.ListPresUnidNeg(EntPresUni);
            if (ds.Tables[0].Rows.Count > 0) {
                ddlCdFundo.SelectedValue = ds.Tables["get"].Rows[0]["cFundo"].ToString();
                ddlIdUnidNeg.SelectedValue = ds.Tables["get"].Rows[0]["nIdUnidadNeg"].ToString();
                ddlIdPresup.SelectedValue = ds.Tables["get"].Rows[0]["nIdPresupuesto"].ToString();
                ddlIdForm.SelectedValue = ds.Tables["get"].Rows[0]["nIdFormato"].ToString();
                lblNumHA.Text = ds.Tables["get"].Rows[0]["nHa"].ToString();
                lblCult.Text = ds.Tables["get"].Rows[0]["cDesCultivo"].ToString();
                //ddlVersion.SelectedValue = ds.Tables["get"].Rows[0]["nVersion"].ToString();
                hdfIdCult.Value = ds.Tables["get"].Rows[0]["nIdCultivo"].ToString();
                hdfIdVers.Value = ds.Tables["get"].Rows[0]["nVersion"].ToString();
                hdfEstado.Value = "D";
                int rdb = Convert.ToInt32(ds.Tables["get"].Rows[0]["nFRegistro"].ToString());
                if (rdb == 0){
                    rdbHect.Checked = true;
                    rdbLote.Checked = false;
                } else {
                    rdbHect.Checked = false;
                    rdbLote.Checked = true;
                }
            }
        }
    }
}