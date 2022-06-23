using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Agro
{
    public partial class Wfo_TrackView : System.Web.UI.Page
    {
        FundoBE EntFund = new FundoBE();
        FundoBL NegFund = new FundoBL();

        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlFundoLoad();
            }
        }
        private void ddlFundoLoad()
        {
            EntFund.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlIdFundo.DataSource = NegFund.ListFundo(EntFund);
            ddlIdFundo.DataValueField = "nIdFundo";
            ddlIdFundo.DataTextField = "cDescFundo";
            ddlIdFundo.DataBind();
            this.ddlIdFundo.Items.Insert(0, new ListItem("Seleccione", "0"));
        }
        private void ddlDispositivoLoad()
        {
            EntDisp.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
          //  EntDisp.vcIdSucursal = ddlIdFundo.SelectedValue;
            EntDisp.vnIdDispositivo = 0;
            EntDisp.vcTipo = "CFEU";
            ddlnIdDisp.DataSource = NegDisp.ListDispositivos(EntDisp);
            ddlnIdDisp.DataValueField = "nIdDispositivo";
            ddlnIdDisp.DataTextField = "cNombre";
            ddlnIdDisp.DataBind();
            this.ddlnIdDisp.Items.Insert(0, new ListItem("Seleccione", "0"));

        }

        protected void ddlnIdDisp_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDispositivoLoad();
        }
    }
}