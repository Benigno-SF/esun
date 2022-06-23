using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Agro
{
    public partial class Wfo_TareoCampo : System.Web.UI.Page
    {
            ConsNisiraBE EntNisira = new ConsNisiraBE();
            ConsNisiraBL NegNisira = new ConsNisiraBL();

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    //ddlAnioLoad();
                }
            }

            //private void ddlAnioLoad()
            //{
            //    EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            //    EntNisira.vnIdPlanilla = "OBR";
            //    EntNisira.vcAnio = "";
            //    EntNisira.vcPeriodo = "";
            //    EntNisira.vcSemana = "";
            //    EntNisira.vcType = "P";
            //    ddlPeriodo.DataSource = NegNisira.ListPeriodo(EntNisira);
            //    ddlPeriodo.DataValueField = "PERIODO";
            //    ddlPeriodo.DataTextField = "PERIODO";
            //    ddlPeriodo.DataBind();
            //    this.ddlPeriodo.Items.Insert(0, new ListItem("Selecciona Periodo", "000000"));
            //}

            //private void ddlSemanaLoad()
            //{
            //    EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            //    EntNisira.vnIdPlanilla = "OBR";
            //    EntNisira.vcAnio = "";
            //    EntNisira.vcPeriodo = ddlPeriodo.SelectedValue;
            //    EntNisira.vcSemana = "";
            //    EntNisira.vcType = "SS";
            //    ddlSemana.DataSource = NegNisira.ListPeriodo(EntNisira);
            //    ddlSemana.DataValueField = "SEMANA";
            //    ddlSemana.DataTextField = "SEMANADESC";
            //    ddlSemana.DataBind();
            //    this.ddlSemana.Items.Insert(0, new ListItem("Selecciona Semana", "0"));
            //}

            //protected void ddlPeriodo_SelectedIndexChanged(object sender, EventArgs e)
            //{
            //    ddlSemanaLoad();
            //}
    }
}