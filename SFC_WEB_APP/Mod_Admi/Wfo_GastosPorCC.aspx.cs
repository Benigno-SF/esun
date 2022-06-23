using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Admi
{
    public partial class Wfo_GastosPorCC : System.Web.UI.Page
    {
        ConsExternaBE EntCons = new ConsExternaBE();
        ConsExternaBL NegCons = new ConsExternaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlEstructuraLoad();
            ddlCuentaLoad();
        }
        private void ddlEstructuraLoad()
        {
            EntCons.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCons.vctipo = "CC";
            ddlEstructura.DataSource = NegCons.AgrupadorCC(EntCons);
            ddlEstructura.DataValueField = "IDAGRUPADORPCC";
            ddlEstructura.DataTextField = "DESCRIPCION";
            ddlEstructura.DataBind();
            this.ddlEstructura.Items.Insert(0, new ListItem("Selecciona", "00"));
        }
        private void ddlCuentaLoad()
        {
            EntCons.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCons.vctipo = "PC";
            ddlCuenta.DataSource = NegCons.AgrupadorCC(EntCons);
            ddlCuenta.DataValueField = "IDAGRUPADORPCC";
            ddlCuenta.DataTextField = "DESCRIPCION";
            ddlCuenta.DataBind();
            this.ddlCuenta.Items.Insert(0, new ListItem("Selecciona", "00"));
        }
    }
}