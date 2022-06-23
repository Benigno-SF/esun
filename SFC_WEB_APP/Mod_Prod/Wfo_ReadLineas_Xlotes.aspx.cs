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
        public partial class Wfo_ReadLineas_Xlotes : System.Web.UI.Page
        {
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
                    ddlAreaGrupoLoad();
                    ddlEmbalajeLoad();
                    ddlCLienteLoad();
                    ddlCultivoLoad();
                    ddlSpervisorLoad();
                }
            }

            private void ddlCLienteLoad()
            {
                EntCliente.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                ddlCliente.DataSource = NegCliente.ListCliente(EntCliente);
                ddlCliente.DataValueField = "nIdClienteS";
                ddlCliente.DataTextField = "cDesClienteS";
                ddlCliente.DataBind();
                this.ddlCliente.Items.Insert(0, new ListItem("Selecciona Cliente", "00"));
            }
            private void ddlAreaGrupoLoad()
            {
                EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                EntArGr.vnIdArea = 1;
                EntArGr.vnIdGrupo = 0;
                EntArGr.vnEstadoUso = 0;
                ddlAreaGrupo.DataSource = NegArGr.ListAreaGrupo(EntArGr);
                ddlAreaGrupo.DataValueField = "nIdGrupo";
                ddlAreaGrupo.DataTextField = "cDescAGrupo";
                ddlAreaGrupo.DataBind();
                this.ddlAreaGrupo.Items.Insert(0, new ListItem("Selecciona Grupo", "00"));
            }

            private void ddlSpervisorLoad()
            {
                EntPers.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                EntPers.vcNroDocumento = "";
                EntPers.vcNombres = "";
                EntPers.vcIdPlanilla = "OBR";
                EntPers.vcCodigoLabor = "SUP";
                ddlSupervisor.DataSource = NegPers.ListPersonal(EntPers);
                ddlSupervisor.DataValueField = "nIdPersonal";
                ddlSupervisor.DataTextField = "cNombres";
                ddlSupervisor.DataBind();
                this.ddlSupervisor.Items.Insert(0, new ListItem("Selecciona Supervisor", "00"));
            }

            private void ddlEmbalajeLoad()
            {
                EntEmbalaje.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                ddlEmbalaje.DataSource = NegEmbalaje.ListEmbalaje(EntEmbalaje);
                ddlEmbalaje.DataValueField = "nIdEmbalaje";
                ddlEmbalaje.DataTextField = "cDesEmbalaje";
                ddlEmbalaje.DataBind();
                this.ddlEmbalaje.Items.Insert(0, new ListItem("Selecciona Embalaje", "00"));
            }

            private void ddlCultivoLoad()
            {
                EntCultivoPacking.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                EntCultivoPacking.vnIdCultivo = 0;
                ddlCultivo.DataSource = NegCultivoPacking.ListCultivoPacking(EntCultivoPacking);
                ddlCultivo.DataValueField = "nIdCultivo";
                ddlCultivo.DataTextField = "cDesCultivo";
                ddlCultivo.DataBind();
                this.ddlCultivo.Items.Insert(0, new ListItem("Selecciona Cultivo", "00"));
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
                this.ddlVariedad.Items.Insert(0, new ListItem("Selecciona Variedad", "00"));
            }


            protected void ddlCultivo_SelectedIndexChanged(object sender, EventArgs e)
            {
                ddlVariedadLoad();
            }
        }
    }