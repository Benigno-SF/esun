using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_HorComedor : System.Web.UI.Page
    {

        EventoProgBE EntProg = new EventoProgBE();
        EventoProgBL NegProg = new EventoProgBL();

        TipoEventoBE EntTeven = new TipoEventoBE();
        TipoEventoBL NegTeven = new TipoEventoBL();

        AreaProcesoBE EntArPr = new AreaProcesoBE();
        AreaProcesoBL NegArPr = new AreaProcesoBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GvLoad();
                ddlTipoEventoLoad();
                ddlAreaProcesoLoad();
                ddlAreaGrupoLoad();

            }
        }

        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }
        private void GvLoad()
        {
            EntProg.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntProg.vnIdEventoProg = 0;
            EntProg.vcFecha = txtFeCont.Value;
            GvList.DataSource = NegProg.EventoProgList(EntProg);
            GvList.DataBind();
            //UpdGv.Update();
        }
        private void ddlTipoEventoLoad()
        {
            EntTeven.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntTeven.vnIdTipoEvento = 0;
            ddlTipoEvento.DataSource = NegTeven.ListTipEventos(EntTeven);
            ddlTipoEvento.DataValueField = "nIdTipoEvento";
            ddlTipoEvento.DataTextField = "cDescEvento";
            ddlTipoEvento.DataBind();
            this.ddlTipoEvento.Items.Insert(0, new ListItem("Selecciona Evento", "00"));
        }
        private void ddlAreaProcesoLoad()
        {
            EntArPr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlAreaProceso.DataSource = NegArPr.ListAreaProceso(EntArPr);
            ddlAreaProceso.DataValueField = "nIdArea";
            ddlAreaProceso.DataTextField = "cDescAProceso";
            ddlAreaProceso.DataBind();
            this.ddlAreaProceso.Items.Insert(0, new ListItem("Selecciona Area", "00"));
        }
        private void ddlAreaGrupoLoad()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = 1;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            ddlAreaGrupo.DataSource = NegArGr.ListAreaGrupo(EntArGr);
            ddlAreaGrupo.DataValueField = "nIdGrupo";
            ddlAreaGrupo.DataTextField = "cDescAGrupo";
            ddlAreaGrupo.DataBind();
            this.ddlAreaGrupo.Items.Insert(0, new ListItem("Selecciona Grupo", "00"));
        }

       
    }
}