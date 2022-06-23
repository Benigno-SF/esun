using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;


namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_DetalleProceso : System.Web.UI.Page
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

        ClienteBE EntCliente = new ClienteBE();
        ClienteBL NegCliente = new ClienteBL();

        PersonalBE EntPers = new PersonalBE();
        PersonalBL NegPers = new PersonalBL();

        RendimientoProcesoBE EntRenProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRenProc = new RendimientoProcesoBL();

        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

        CultivoPackingBE EntCultivoPacking = new CultivoPackingBE();
        CultivoPackingBL NegCultivoPacking = new CultivoPackingBL();

        CultivoPackingVariedadBE EntCultivoVariedad = new CultivoPackingVariedadBE();
        CultivoPackingVariedadBL NegCultivoVariedad = new CultivoPackingVariedadBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAreaLoad();
                ddlAreaLoad2();
                ddlCLienteLoad();
                ddlCultivoLoad();
                ddlSpervisorLoad();
                ddlAreaGrupoLoad_m();
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
        
        protected void ddlArea_m_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAreaGrupoLoad_m();
        }

        private void ddlAreaLoad2()
        {
            EntArPr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArPr.vnIdArea = 1;
            ddlAProceso.DataSource = NegArPr.ListAreaProceso(EntArPr);
            ddlAProceso.DataValueField = "nIdArea";
            ddlAProceso.DataTextField = "cDescAProceso";
            ddlAProceso.DataBind();
            this.ddlAProceso.Items.Insert(0, new ListItem("Selecciona Area", "00"));
        }

        private void ddlAreaGrupoLoad_m()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = Convert.ToInt32(ddlArea.SelectedValue);
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            ddlAreaGrupo_m.DataSource = NegArGr.ListAreaGrupo(EntArGr);
            ddlAreaGrupo_m.DataValueField = "nIdGrupo";
            ddlAreaGrupo_m.DataTextField = "cDescAGrupo";
            ddlAreaGrupo_m.DataBind();
            this.ddlAreaGrupo_m.Items.Insert(0, new ListItem("Selecciona Grupo", "0"));
        }

        private void ddlCLienteLoad()
        {
            EntCliente.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlCliente.DataSource = NegCliente.ListCliente(EntCliente);
            ddlCliente.DataValueField = "nIdClienteS";
            ddlCliente.DataTextField = "cDesClienteS";
            ddlCliente.DataBind();
            this.ddlCliente.Items.Insert(0, new ListItem("Selecciona Cliente", "0"));
        }

        private void ddlSpervisorLoad()
        {
            EntPers.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPers.vcNroDocumento = "";
            EntPers.vcNombres = "";
            EntPers.vcIdPlanilla = "";
            EntPers.vcCodigoLabor = "SUP ";
            ddlSupervisor.DataSource = NegPers.ListPersonal(EntPers);
            ddlSupervisor.DataValueField = "nIdPersonal";
            ddlSupervisor.DataTextField = "cNombres";
            ddlSupervisor.DataBind();
            this.ddlSupervisor.Items.Insert(0, new ListItem("Selecciona Supervisor", "0"));
        }

        private void ddlCultivoLoad()
        {
            EntCultivoPacking.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCultivoPacking.vnIdCultivo = 0;
            ddlCultivo.DataSource = NegCultivoPacking.ListCultivoPacking(EntCultivoPacking);
            ddlCultivo.DataValueField = "nIdCultivo";
            ddlCultivo.DataTextField = "cDesCultivo";
            ddlCultivo.DataBind();
            this.ddlCultivo.Items.Insert(0, new ListItem("Selecciona Cultivo", "0"));
        }

    }
}