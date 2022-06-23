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
    public partial class Wfo_PresMaster : System.Web.UI.Page
    {
        PresupuestoBE EntPres = new PresupuestoBE();
        PresupuestoBL NegPres = new PresupuestoBL();

        CultivoBE EntCult = new CultivoBE();
        CultivoBL NegCult = new CultivoBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                ddlInEstaLoad();
                ddlCultivoLoad();
                GvLoad();
            }
        }
        private void GvLoad()
        {
            EntPres.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPres.vnIdPresupuesto = 0;
            EntPres.vcDenominacion = txtDescri.Value;
            EntPres.vbEstado = Convert.ToBoolean(Convert.ToInt32(ddlInEsta.SelectedItem.Value));
            GvList.DataSource = NegPres.ListPresupuesto(EntPres);
            GvList.DataBind();
            //UpdGv.Update();
        }
        public void ddlInEstaLoad() {
            this.ddlInEsta.Items.Insert(0, new ListItem("Aprobado", "1"));
            this.ddlInEsta.Items.Insert(1, new ListItem("Pendiente", "0"));
            ddlInEsta.SelectedValue = "0";
        }
        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }

        protected void btnGvRepo_ServerClick(object sender, EventArgs e)
        {
            string Cd = this.Master.GetParamURL("Cd", true);
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdPres"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Response.Redirect("Wfo_PresMaster-Repo.aspx?Cd=" + Cd);
        }
        private void ddlCultivoLoad()
        {
            EntCult.vnIdCultivo = 0;
            EntCult.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCult.vnIdFundo = 0;
            ddlCultivo.DataSource = NegCult.ListCultivo(EntCult);
            ddlCultivo.DataValueField = "nIdCultivo";
            ddlCultivo.DataTextField = "cDesCultivo";
            ddlCultivo.DataBind();
            this.ddlCultivo.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
    }
}