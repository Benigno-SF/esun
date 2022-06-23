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
    public partial class Wfo_AvancePersonal : System.Web.UI.Page
    {
        EventoProgBE EntProg = new EventoProgBE();
        EventoProgBL NegProg = new EventoProgBL();

        TipoEventoBE EntTeven = new TipoEventoBE();
        TipoEventoBL NegTeven = new TipoEventoBL();

        EmbalajeBE EntEmbalaje = new EmbalajeBE();
        EmbalajeBL NegEmbalaje = new EmbalajeBL();

        AreaProcesoBE EntArPr = new AreaProcesoBE();
        AreaProcesoBL NegArPr = new AreaProcesoBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        PersonalBE EntPers = new PersonalBE();
        PersonalBL NegPers = new PersonalBL();

        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

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

        private void ddlAreaGrupoLoad()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = Convert.ToInt32(ddlArea.SelectedValue); ;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            ddlAreaGrupo.DataSource = NegArGr.ListAreaGrupo(EntArGr);
            ddlAreaGrupo.DataValueField = "nIdGrupo";
            ddlAreaGrupo.DataTextField = "cDescAGrupo";
            ddlAreaGrupo.DataBind();
            this.ddlAreaGrupo.Items.Insert(0, new ListItem("Selecciona Grupo", "00"));
        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAreaGrupoLoad();
        }
    }
}