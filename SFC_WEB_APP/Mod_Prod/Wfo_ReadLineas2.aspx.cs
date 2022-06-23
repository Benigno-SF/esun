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
    public partial class Wfo_ReadLineas2 : System.Web.UI.Page
    {
        AreaProcesoBE EntProceso = new AreaProcesoBE();
        AreaProcesoBL NegProceso = new AreaProcesoBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        EmbalajeBE EntEmbalaje = new EmbalajeBE();
        EmbalajeBL NegEmbalaje = new EmbalajeBL();

        ClienteBE EntCliente = new ClienteBE();
        ClienteBL NegCliente = new ClienteBL();

        PersonalBE EntPers = new PersonalBE();
        PersonalBL NegPers = new PersonalBL();

        CultivoPackingBE EntCultivoPacking = new CultivoPackingBE();
        CultivoPackingBL NegCultivoPacking = new CultivoPackingBL();

        CultivoPackingVariedadBE EntCultivoVariedad = new CultivoPackingVariedadBE();
        CultivoPackingVariedadBL NegCultivoVariedad = new CultivoPackingVariedadBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAreaProc();
                ddlCLienteLoad();
                ddlCultivoLoad();
                ddlSpervisorLoad();
            }
        }

        private void ddlAreaProc()
        {
            EntProceso.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlAProceso.DataSource = NegProceso.ListAreaProceso(EntProceso);
            ddlAProceso.DataValueField = "nIdArea";
            ddlAProceso.DataTextField = "cDescAProceso";
            ddlAProceso.DataBind();
            this.ddlAProceso.Items.Insert(0, new ListItem("Selecciona Area Proceso", "0"));
        }

        private void ddlAreaGrupoLoad()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = Convert.ToInt32(ddlAProceso.SelectedValue);
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = 0;
            ddlAreaGrupo.DataSource = NegArGr.ListAreaGrupo(EntArGr);
            ddlAreaGrupo.DataValueField = "nIdGrupo";
            ddlAreaGrupo.DataTextField = "cDescAGrupo";
            ddlAreaGrupo.DataBind();
            this.ddlAreaGrupo.Items.Insert(0, new ListItem("Selecciona Grupo", "0"));
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

        private void ddlVariedadLoad()
        {
            EntCultivoVariedad.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCultivoVariedad.vnIdCultivo = Convert.ToInt32(ddlCultivo.SelectedValue);
            EntCultivoVariedad.vnIdVariedad = 0;
            ddlVariedad.DataSource = NegCultivoVariedad.ListCultivoVariedad(EntCultivoVariedad);
            ddlVariedad.DataValueField = "nIdVariedad";
            ddlVariedad.DataTextField = "cDescVariedad";
            ddlVariedad.DataBind();
            this.ddlVariedad.Items.Insert(0, new ListItem("Selecciona Variedad", "0"));
        }

        private void ddlEmbalajeLoad()
        {
            EntEmbalaje.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntEmbalaje.vnIdCultivo = Convert.ToInt32(ddlCultivo.SelectedValue);
            ddlEmbalaje.DataSource = NegEmbalaje.ListEmbalaje(EntEmbalaje);
            ddlEmbalaje.DataValueField = "nIdEmbalaje";
            ddlEmbalaje.DataTextField = "cDesEmbalaje";
            ddlEmbalaje.DataBind();
            this.ddlEmbalaje.Items.Insert(0, new ListItem("Selecciona Embalaje", "0"));
        }

        //protected void ddlAProceso_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlAreaGrupoLoad();
        //}

        //protected void ddlCultivo_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlVariedadLoad();
        //    ddlEmbalajeLoad();
        //}

    }
}