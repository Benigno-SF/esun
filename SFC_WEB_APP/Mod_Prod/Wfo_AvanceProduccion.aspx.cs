using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_AvanceProduccion : System.Web.UI.Page
    {
        AreaProcesoBE EntArPr = new AreaProcesoBE();
        AreaProcesoBL NegArPr = new AreaProcesoBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAreaLoad();
            }
        }
        private void ddlAreaLoad()
        {
            EntArPr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArPr.vnIdArea = 1;
            ddlArea.DataSource = NegArPr.ListAreaProceso(EntArPr);
            ddlArea.DataValueField = "nIdArea";
            ddlArea.DataTextField = "cDescAProceso";
            ddlArea.DataBind();
            this.ddlArea.Items.Insert(0, new ListItem("Selecciona Area", "00"));
        }
    }
}