using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Cmx
{
    public partial class Wfo_InstruccionEmbarque : System.Web.UI.Page
    {
        LugarBE EntLugar = new LugarBE();
        LugarBL NegLugar = new LugarBL();

        ClienteProdBE EntCliente = new ClienteProdBE();
        ClienteProdBL NegCliente = new ClienteProdBL();

        CultivoPackingBE EntCultivoPacking = new CultivoPackingBE();
        CultivoPackingBL NegCultivoPacking = new CultivoPackingBL();

        CampanaBE EntCampana = new CampanaBE();
        CampanaBL NegCampana = new CampanaBL();

        ConsHispBE EntConsHisp = new ConsHispBE();
        ConsHispBL NegConsHisp = new ConsHispBL();

        protected void Page_Load(object sender, EventArgs e)
        {
               
                ddlDestinoLoad();
                ddlCampanaLoad();
        }
        private void ddlCampanaLoad()
        {
            EntCampana.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCampana.vnIdCampana = 0;
            ddlCampana.DataSource = NegCampana.ListCampana(EntCampana);
            ddlCampana.DataValueField = "nIdCampana";
            ddlCampana.DataTextField = "cCampNombre";
            ddlCampana.DataBind();
            this.ddlCampana.Items.Insert(0, new ListItem("Selecciona Campana", "0"));
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

    }
}