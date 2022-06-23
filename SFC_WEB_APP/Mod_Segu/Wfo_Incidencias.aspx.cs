using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Segu
{
    public partial class Wfo_Incidencias : System.Web.UI.Page
    {
        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

        PersonalBE EntPers = new PersonalBE();
        PersonalBL NegPers = new PersonalBL();

        FundoBE EntFundo = new FundoBE();
        FundoBL NegFundo = new FundoBL();

        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TipoIncidencia();
                ListFundo();
                ddlVigilanteLoad();
                //ddlDispositivoLoad();
            }
        }
        private void TipoIncidencia()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "03";
            ddlTipoIncidencia.DataSource = negParm.ListParametroGeneral(entParm);
            ddlTipoIncidencia.DataValueField = "cCodigo";
            ddlTipoIncidencia.DataTextField = "cDescripcion";
            ddlTipoIncidencia.DataBind();
            this.ddlTipoIncidencia.Items.Insert(0, new ListItem("Tipo Incidencia", "00"));
        }

        //private void ddlDispositivoLoad()
        //{
        //    EntDisp.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
        //    //  EntDisp.vcIdSucursal = ddlIdFundo.SelectedValue;
        //    EntDisp.vnIdDispositivo = 0;
        //    EntDisp.vcTipo = "AVSS";
        //    ddlnIdDisp.DataSource = NegDisp.ListDispositivos(EntDisp);
        //    ddlnIdDisp.DataValueField = "nIdDispositivo";
        //    ddlnIdDisp.DataTextField = "cNombre";
        //    ddlnIdDisp.DataBind();
        //    this.ddlnIdDisp.Items.Insert(0, new ListItem("Seleccione", "0"));

        //}

        private void ListFundo()
        {
            EntFundo.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlFundo.DataSource = NegFundo.ListFundo(EntFundo);
            ddlFundo.DataValueField = "nIdFundo";
            ddlFundo.DataTextField = "cDescFundo";
            ddlFundo.DataBind();
            this.ddlFundo.Items.Insert(0, new ListItem("Fundo", "00"));
        }

        private void ddlVigilanteLoad()
        {
            EntPers.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPers.vcNroDocumento = "";
            EntPers.vcNombres = "";
            EntPers.vcIdPlanilla = "OAC";
            EntPers.vcCodigoLabor = "VIG ";
            ddlVigilante.DataSource = NegPers.ListPersonal(EntPers);
            ddlVigilante.DataValueField = "nIdPersonal";
            ddlVigilante.DataTextField = "cNombres";
            ddlVigilante.DataBind();
            this.ddlVigilante.Items.Insert(0, new ListItem("Selecciona Vigilante", "00"));
        }
    }
}