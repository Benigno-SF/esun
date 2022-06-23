using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_SyncTareo : System.Web.UI.Page
    {
        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAnioLoad();
            }
        }

        private void ddlAnioLoad()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = "";
            EntNisira.vcPeriodo = "";
            EntNisira.vcSemana = "";
            EntNisira.vcType = "A";
            ddlAnio.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlAnio.DataValueField = "ANIO";
            ddlAnio.DataTextField = "ANIO";
            ddlAnio.DataBind();
            this.ddlAnio.Items.Insert(0, new ListItem("Selecciona Año", "0000"));
        }

        private void ddlSemanaLoad()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = ddlAnio.SelectedValue;
            EntNisira.vcPeriodo = "";
            EntNisira.vcSemana = "";
            EntNisira.vcType = "S";
            ddlSemana.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlSemana.DataValueField = "SEMANA";
            ddlSemana.DataTextField = "SEMANA";
            ddlSemana.DataBind();
            this.ddlSemana.Items.Insert(0, new ListItem("Selecciona Semana", "0"));
        }

        protected void ddlAnio_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSemanaLoad();
        }
    }
}