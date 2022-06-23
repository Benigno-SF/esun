using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Agro
{
    public partial class Wfo_CreateGuiaRemision : System.Web.UI.Page
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

        LineaNavieraBE EntLineaNav = new LineaNavieraBE();
        LineaNavieraBL NegLineaNav = new LineaNavieraBL();

        OrdenEmbarqueBE EntOrdenEmbarque = new OrdenEmbarqueBE();
        OrdenEmbarqueBL NegOrdenEmbarque = new OrdenEmbarqueBL();

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        EmpresaBL empresaBL = new EmpresaBL();

        protected void Page_Load(object sender, EventArgs e)
        {
        }



    }
}