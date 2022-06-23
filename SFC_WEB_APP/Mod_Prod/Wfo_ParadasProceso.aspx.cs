using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_ParadasProceso : System.Web.UI.Page
    {
        AreaProcesoBE EntProceso = new AreaProcesoBE();
        AreaProcesoBL NegProceso = new AreaProcesoBL();

        AreaGrupoBE EntArGr = new AreaGrupoBE();
        AreaGrupoBL NegArGr = new AreaGrupoBL();

        PanelInfoBE EntPane = new PanelInfoBE();
        PanelInfoBL NegPane = new PanelInfoBL();

        CultivoBE EntCult = new CultivoBE();
        CultivoBL NegCult = new CultivoBL();

        CultivoCaracteristicaBE EntCultCara = new CultivoCaracteristicaBE();
        CultivoCaracteristicaBL NegCultCara = new CultivoCaracteristicaBL();

        PanelInfoBE EntPaneInfo = new PanelInfoBE();
        PanelInfoBL NegPaneInfo = new PanelInfoBL();

        RendimientoProcesoBE EntRendProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRendProc = new RendimientoProcesoBL();

        ParadasProcesoBE EntParadaProc = new ParadasProcesoBE();
        ParadasProcesoBL NegParadaProc = new ParadasProcesoBL();

        UtilBL negUtil = new UtilBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAreaProc();

                ddlAreaRepLoad();

                ddlCultivoLoad();

                _ddlAreaPorcesoLoad();

                _ddlCultivoLoad();


            }
        }

        private void ddlAreaProc()
        {
            EntProceso.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlAProceso.DataSource = NegProceso.ListAreaProceso(EntProceso);
            ddlAProceso.DataValueField = "nIdArea";
            ddlAProceso.DataTextField = "cDescAProceso";
            ddlAProceso.DataBind();
            this.ddlAProceso.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlAreaGrupoLoad()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = Convert.ToInt32(ddlAProceso.SelectedValue);
            EntArGr.vnIdGrupo = 0;
            EntArGr.vcUsuario = GetParamCokkie("cd_user");
            EntArGr.vnIdTiRow = 1;
            ddlAreaGrupo.DataSource = NegArGr.ListAreaGrupoc(EntArGr);
            ddlAreaGrupo.DataValueField = "nIdGrupo";
            ddlAreaGrupo.DataTextField = "linea";
            ddlAreaGrupo.DataBind();
            this.ddlAreaGrupo.Items.Insert(0, new ListItem("Selecciona Grupo", "0"));
        }

        protected void ddlAProceso_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAreaGrupoLoad();
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }



        //////////////////////////////////////////////////////////////////
        EventoProgBE EntProg = new EventoProgBE();
        EventoProgBL NegProg = new EventoProgBL();

        TipoEventoBE EntTeven = new TipoEventoBE();
        TipoEventoBL NegTeven = new TipoEventoBL();

        EmbalajeBE EntEmbalaje = new EmbalajeBE();
        EmbalajeBL NegEmbalaje = new EmbalajeBL();

        AreaProcesoBE EntArPr = new AreaProcesoBE();
        AreaProcesoBL NegArPr = new AreaProcesoBL();



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


        private void ddlAreaRepLoad()
        {
            EntArPr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArPr.vnIdArea = 1;
            ddlAreaRep.DataSource = NegArPr.ListAreaProceso(EntArPr);
            ddlAreaRep.DataValueField = "nIdArea";
            ddlAreaRep.DataTextField = "cDescAProceso";
            ddlAreaRep.DataBind();
            this.ddlAreaRep.Items.Insert(0, new ListItem("Selecciona Area", "0"));
        }

        private void ddlAreaGrupoRepLoad()
        {
            EntArGr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArGr.vnIdArea = Convert.ToInt32(ddlAreaRep.SelectedValue); ;
            EntArGr.vnIdGrupo = 0;
            EntArGr.vnEstadoUso = -1;
            ddlAreaGrupoRep.DataSource = NegArGr.ListAreaGrupo(EntArGr);
            ddlAreaGrupoRep.DataValueField = "nIdGrupo";
            ddlAreaGrupoRep.DataTextField = "cDescAGrupo";
            ddlAreaGrupoRep.DataBind();
            this.ddlAreaGrupoRep.Items.Insert(0, new ListItem("Selecciona Grupo", "0"));
        }

        protected void ddlAreaRep_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlAreaGrupoRepLoad();
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

        private void _ddlCultivoLoad()
        {
            EntCultivoPacking.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCultivoPacking.vnIdCultivo = 0;
            _ddlCultivo.DataSource = NegCultivoPacking.ListCultivoPacking(EntCultivoPacking);
            _ddlCultivo.DataValueField = "nIdCultivo";
            _ddlCultivo.DataTextField = "cDesCultivo";
            _ddlCultivo.DataBind();
            this._ddlCultivo.Items.Insert(0, new ListItem("Selecciona Cultivo", "0"));
        }

        private void _ddlAreaPorcesoLoad()
        {
            EntArPr.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntArPr.vnIdArea = 1;
            _ddlAreaProceso.DataSource = NegArPr.ListAreaProceso(EntArPr);
            _ddlAreaProceso.DataValueField = "nIdArea";
            _ddlAreaProceso.DataTextField = "cDescAProceso";
            _ddlAreaProceso.DataBind();
            this._ddlAreaProceso.Items.Insert(0, new ListItem("Selecciona Area", "0"));
        }


    }
}