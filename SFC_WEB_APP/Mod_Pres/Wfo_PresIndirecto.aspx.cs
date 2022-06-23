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
    public partial class Wfo_PresIndirecto : System.Web.UI.Page
    {
        FormatoBE EntForm = new FormatoBE();
        FormatoBL NegForm = new FormatoBL();
        PresupuestoBE EntPres = new PresupuestoBE();
        PresupuestoBL NegPres = new PresupuestoBL();
        PresupuestoIndirectoBE EntPresIndi = new PresupuestoIndirectoBE();
        PresupuestoIndirectoBL NegPresIndi = new PresupuestoIndirectoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                ddlPresupLoad();
                ddlFormatLoad();
                gvLoad();
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

        private void ddlFormatLoad()
        {
            EntForm.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntForm.vnIdFormato = 0;
            EntForm.vnIdTipo = 3;
            ddlFormato.DataSource = NegForm.ListForm(EntForm);
            ddlFormato.DataValueField = "nIdFormato";
            ddlFormato.DataTextField = "cDescFormato";
            ddlFormato.DataBind();
            this.ddlFormato.Items.Insert(0, new ListItem("Todos", "0"));
        }

        private void ddlFormLoad() {

        }

        private void gvLoad()
        {
            EntPresIndi.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPresIndi.vnIdPresupuesto = Convert.ToInt32(ddlPresup.SelectedItem.Value);
            EntPresIndi.vnIdFormato = Convert.ToInt32(ddlFormato.SelectedItem.Value);
            //EntPresUni.vcDenominacion = txtDescri.Value;
            GvList.DataSource = NegPresIndi.ListPresupIndi(EntPresIndi);
            GvList.DataBind();
        }

        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            gvLoad();
        }

        protected void btnGvEdit_ServerClick(object sender, EventArgs e)
        {
            string Cd = this.Master.GetParamURL("Cd", true);
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdPres"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Session["IdForm"] = GvList.DataKeys[row.RowIndex].Values[1].ToString();
            Response.Redirect("Wfo_PresIndirecto-Edit.aspx?Cd=" + Cd);
        }

        protected void btnAgregar_ServerClick(object sender, EventArgs e)
        {
            Session["IdPres"] = 0;
            Session["IdForm"] = 0;
            Response.Redirect("Wfo_PresIndirecto-Edit.aspx?Cd=" + (this.Master.GetParamURL("Cd", true)));
        }
    }
}