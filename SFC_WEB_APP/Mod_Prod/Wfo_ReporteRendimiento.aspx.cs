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
    public partial class Wfo_ReporteRendimiento : System.Web.UI.Page
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

        RendimientoProcesoBE EntRenProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRenProc = new RendimientoProcesoBL();

        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

        RendimientoProcesoBE EntRendProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRendProc = new RendimientoProcesoBL();

        UtilBL negUtil = new UtilBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAreaLoad();
                ddlLaborLoad();
                ddlSpervisorLoad();
                ddlEmbalajeLoad();
                btnInicProc.Visible = false;
                btnFinProc.Visible = false;
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

        private void ddlEmbalajeLoad()
        {
            EntEmbalaje.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlEmbalaje.DataSource = NegEmbalaje.ListEmbalaje(EntEmbalaje);
            ddlEmbalaje.DataValueField = "nIdEmbalaje";
            ddlEmbalaje.DataTextField = "cDesEmbalaje";
            ddlEmbalaje.DataBind();
            this.ddlEmbalaje.Items.Insert(0, new ListItem("Selecciona Presentacion", "00"));
        }

        private void ddlLaborLoad()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "01";
            ddlLabor.DataSource = negParm.ListParametroGeneral(entParm);
            ddlLabor.DataValueField = "cCodigo";
            ddlLabor.DataTextField = "cDescripcion";
            ddlLabor.DataBind();
            this.ddlLabor.Items.Insert(0, new ListItem("Selecciona Labor", " "));
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
            this.ddlSupervisor.Items.Insert(0, new ListItem("Selecciona Supervisor", "00"));
        }

        private void ddlAreaGrupoLoad_c()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = 1;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;

        }

        private void ValidarProceso()
        {
            EntRendProc.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntRendProc.vnIdProceso = 0;
            EntRendProc.vnIdArea = Convert.ToInt32(ddlArea.SelectedValue);
            DataSet ds = NegRendProc.ListRendimientoProceso(EntRendProc);
            if (ds.Tables[0].Rows.Count == 0)
            {
                btnInicProc.Visible = true;
                btnFinProc.Visible = false;
                txtProc.InnerText = "Proceso No Iniciado";
            }
            else
            {
                btnInicProc.Visible = false;
                btnFinProc.Visible = true;
                string fecha = ds.Tables[0].Rows[0][2].ToString();
                txtProc.InnerText = "Proceso Iniciado del dia " + fecha;
            }
        }


        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAreaGrupoLoad();

            if (Convert.ToInt32(ddlArea.SelectedValue) != 0)
            {
                ValidarProceso();
            }
            else
            {
                btnInicProc.Visible = false;
                btnFinProc.Visible = false;
            }
        }
    }
}