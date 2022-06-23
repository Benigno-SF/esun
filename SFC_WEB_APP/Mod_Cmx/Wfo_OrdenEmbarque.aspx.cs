
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;
using System.Web.Http.Results;

namespace SFC_WEB_APP.Mod_Cmx
{
    public partial class Wfo_OrdenEmbarque : System.Web.UI.Page
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

        CampanaBE EntCampana = new CampanaBE();
        CampanaBL NegCampana = new CampanaBL();

        ConsHispBE EntConsHisp = new ConsHispBE();
        ConsHispBL NegConsHisp = new ConsHispBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlShipperLoad();
                ddlCampanaLoad();
                ddlCultivoLoad();
            }
        }
        private void ddlShipperLoad()
        {
            EntConsHisp.vnId = 0;
            EntConsHisp.vcNombre = "";
            ddlShipper.DataSource = NegConsHisp.ListShipper(EntConsHisp);
            ddlShipper.DataValueField = "Id";
            ddlShipper.DataTextField = "Nombre";
            ddlShipper.DataBind();
            this.ddlShipper.Items.Insert(0, new ListItem("Seleccione", "0"));
            this.ddlShipper.Items[0].Selected = true;
            //this.ddlShipper.Items[0].Attributes["disabled"] = "disabled";
            
        }

        
        private void ddlCampanaLoad()
        {
            EntCampana.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            //EntCampana.cultivo = 4;
            EntCampana.vnIdCampana = 0;
            ddlCampana.DataSource = NegCampana.ListCampana(EntCampana);
            ddlCampana.DataValueField = "nIdCampana";
            ddlCampana.DataTextField = "cCampNombre";
            ddlCampana.DataBind();
            this.ddlCampana.Items.Insert(0, new ListItem("Selecciona Campaña", "0"));
            this.ddlCampana.Items[0].Selected = true;
           // this.ddlCampana.Items[0].Attributes["disabled"] = "disabled";
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
            this.ddlCultivo.Items[0].Selected = true;
            //this.ddlCultivo.Items[0].Attributes["disabled"] = "disabled";
        }
    }
}