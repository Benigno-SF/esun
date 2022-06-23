using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Cmx
{
    public partial class Wfo_OrdenEmbarque_Edit : System.Web.UI.Page
    {
        EmbalajeBE EntEmbalaje = new EmbalajeBE();
        EmbalajeBL NegEmbalaje = new EmbalajeBL();

        ClienteProdBE EntCliente = new ClienteProdBE();
        ClienteProdBL NegCliente = new ClienteProdBL();

        PersonalBE EntPers = new PersonalBE();
        PersonalBL NegPers = new PersonalBL();

        CultivoPackingBE EntCultivoPacking = new CultivoPackingBE();
        CultivoPackingBL NegCultivoPacking = new CultivoPackingBL();

        CultivoPackingVariedadBE EntCultivoVariedad = new CultivoPackingVariedadBE();
        CultivoPackingVariedadBL NegCultivoVariedad = new CultivoPackingVariedadBL();

        InstruccionEmbarqueBE EntInstruccion = new InstruccionEmbarqueBE();
        InstruccionEmbarqueBL NegInstruccion = new InstruccionEmbarqueBL();

        LugarBE EntLugar = new LugarBE();
        LugarBL NegLugar = new LugarBL();

        PlantaBE EntPlanta = new PlantaBE();
        PlantaBL NegPlanta = new PlantaBL();

        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

        NavioBE EntNavio = new NavioBE();
        NavioBL NegNavio = new NavioBL();

        ConsHispBE EntConsHisp = new ConsHispBE();
        ConsHispBL NegConsHisp = new ConsHispBL();

        CampanaBE EntCampana = new CampanaBE();
        CampanaBL NegCampana = new CampanaBL();

        LineaNavieraBE EntLineaNav= new LineaNavieraBE();
        LineaNavieraBL NegLineaNav = new LineaNavieraBL();

        OrdenEmbarqueBE EntOrdenEmbarque = new OrdenEmbarqueBE();
        OrdenEmbarqueBL NegOrdenEmbarque = new OrdenEmbarqueBL();

        EmpresaBL empresaBL = new EmpresaBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCampanaLoad();
                ddlCultivoLoad();
                ddlPersonalLoad();
                ddlInstruccionlLoad();
                ddlDestinoLoad();
                ddlPlantaLoad();
                ddlTipoEmbarqueLoad();
                ddlFleteLoad();
                ddlEmisionBLLoad();
                ddlTipoTransporteLoad();
                //ddlNavioLoad();
               // ddlLugarSalidaLoad();
                ddlShipperLoad();
                ddlLineaNavieraLoad();
            }
        }



        private void ddlLineaNavieraLoad()
        {
            EntLineaNav.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntLineaNav.vnIdLineaNaviera = 0;
            ddlLineaNaviera.DataSource = NegLineaNav.ListLineaNaviera(EntLineaNav);
            ddlLineaNaviera.DataValueField = "nIdLineaNaviera";
            ddlLineaNaviera.DataTextField = "cDescLineaNaviera";
            ddlLineaNaviera.DataBind();
            this.ddlLineaNaviera.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlCampanaLoad()
        {
            EntCampana.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCampana.vnIdCampana = 0;
            ddlCampana.DataSource = NegCampana.ListCampana(EntCampana);
            ddlCampana.DataValueField = "nIdCampana";
            ddlCampana.DataTextField = "cCampNombre";
            ddlCampana.DataBind();
            this.ddlCampana.Items.Insert(0, new ListItem("Selecciona Campaña", "0"));
        }

        //private void ddlNavioLoad()
        //{
        //    EntNavio.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
        //    EntNavio.vnIdNavio = 0;
        //    ddlNavio.DataSource = NegNavio.ListNavio(EntNavio);
        //    ddlNavio.DataValueField = "nIdNavio";
        //    ddlNavio.DataTextField = "cDescNavio";
        //    ddlNavio.DataBind();
        //    this.ddlNavio.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        //}

        private void ddlTipoTransporteLoad()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "06";
            ddlTipoTransporte.DataSource = negParm.ListParametroGeneral(entParm);
            ddlTipoTransporte.DataValueField = "cCodigo";
            ddlTipoTransporte.DataTextField = "cDescripcion";
            ddlTipoTransporte.DataBind();
            this.ddlTipoTransporte.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlFleteLoad()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "07";
            ddlFlete.DataSource = negParm.ListParametroGeneral(entParm);
            ddlFlete.DataValueField = "cCodigo";
            ddlFlete.DataTextField = "cDescripcion";
            ddlFlete.DataBind();
            this.ddlFlete.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlEmisionBLLoad()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "08";
            ddlEmisionBL.DataSource = negParm.ListParametroGeneral(entParm);
            ddlEmisionBL.DataValueField = "cCodigo";
            ddlEmisionBL.DataTextField = "cDescripcion";
            ddlEmisionBL.DataBind();
            this.ddlEmisionBL.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlTipoEmbarqueLoad()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "10";
            ddlTipoEmbarque.DataSource = negParm.ListParametroGeneral(entParm);
            ddlTipoEmbarque.DataValueField = "cCodigo";
            ddlTipoEmbarque.DataTextField = "cDescripcion";
            ddlTipoEmbarque.DataBind();
            this.ddlTipoEmbarque.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlPlantaLoad()
        {
            EntPlanta.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPlanta.vnIdPlanta = 0;
            ddlPlanta.DataSource = NegPlanta.ListPlanta(EntPlanta);
            ddlPlanta.DataValueField = "nIdPlanta";
            ddlPlanta.DataTextField = "cDescPlanta";
            ddlPlanta.DataBind();
            this.ddlPlanta.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlShipperLoad()
        {
            EntConsHisp.vnId = 0;
            EntConsHisp.vcNombre = "";
            ddlShipper.DataSource = NegConsHisp.ListShipper(EntConsHisp);
            ddlShipper.DataValueField = "Id";
            ddlShipper.DataTextField = "Nombre";
            ddlShipper.DataBind();
            this.ddlShipper.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlDestinoLoad()
        {
            EntConsHisp.vnId = 0;
            EntConsHisp.vcNombre = "";
            ddlDestino.DataSource = NegConsHisp.ListLocalizacion(EntConsHisp);
            ddlDestino.DataValueField = "Id";
            ddlDestino.DataTextField = "Nombre";
            ddlDestino.DataBind();
            this.ddlDestino.Items.Insert(0, new ListItem("Selecciona Destino", "0"));
        }

        //private void ddlLugarSalidaLoad()
        //{
        //    EntConsHisp.vnId = 0;
        //    EntConsHisp.vcNombre = "";
        //    ddlLugarSalida.DataSource = NegConsHisp.ListLocalizacion(EntConsHisp);
        //    ddlLugarSalida.DataValueField = "Id";
        //    ddlLugarSalida.DataTextField = "Nombre";
        //    ddlLugarSalida.DataBind();
        //    this.ddlLugarSalida.Items.Insert(0, new ListItem("Selecciona ", "0"));
        //}

        private void ddlPersonalLoad()
        {
            EntPers.vnIdEmpresa = 0;
            EntPers.vcNroDocumento = "";
            EntPers.vcNombres = "";
            EntPers.vcIdPlanilla = "";
            EntPers.vcCodigoLabor = "CMX";
            ddlPersonal.DataSource = NegPers.ListPersonal(EntPers);
            ddlPersonal.DataValueField = "nIdPersonal";
            ddlPersonal.DataTextField = "cNombres";
            ddlPersonal.DataBind();
            this.ddlPersonal.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }

        private void ddlInstruccionlLoad()
        {
            EntInstruccion.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntInstruccion.vnIdInstruccion = 0;
            EntInstruccion.vnIdCliente = 0;
            EntInstruccion.vnIdLocalizacion = 0;
            EntInstruccion.vnIdConsignee = 0;
            EntInstruccion.vnIdNotify = 0;
            EntInstruccion.vnIdNotify2 = 0;
            ddlInstruccion.DataSource = NegInstruccion.InstruccionEmbarqueList(EntInstruccion);
            ddlInstruccion.DataValueField = "nIdInstruccion";
            ddlInstruccion.DataTextField = "cDescInstruccion";
            ddlInstruccion.DataBind();
            this.ddlInstruccion.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
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