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
    public partial class Wfo_IngresoVehiculos : System.Web.UI.Page
    {

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
                DdlTipoVehiculo();
                ddlCultivoLoad();
            }
        }

        //public void DdlTipoVehiculo()
        //{
        //    DataSet dt = ViewState["dt"] as DataSet;
        //    entParm.vcCodigo = "";
        //    entParm.vcCodigoMaster = "02";
        //    dt = negParm.ListParametroGeneral(entParm);
        //    ViewState["dt"] = dt;
        //}
        private void DdlTipoVehiculo()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "02";
            DataSet ds = negParm.ListParametroGeneral(entParm);
            ddlTipoVehiculo.DataSource = ds;
            ddlTipoVehiculo.DataValueField = "cCodigo";
            ddlTipoVehiculo.DataTextField = "cDescripcion";
            ddlTipoVehiculo.DataBind();

            ddlTipoVehiculoS.DataSource = ds;
            ddlTipoVehiculoS.DataValueField = "cCodigo";
            ddlTipoVehiculoS.DataTextField = "cDescripcion";
            ddlTipoVehiculoS.DataBind();

            this.ddlTipoVehiculo.Items.Insert(0, new ListItem("Selecciona Tipo Vehiculo", "00"));

            this.ddlTipoVehiculoS.Items.Insert(0, new ListItem("Selecciona Tipo Vehiculo", "00"));
        }

        private void ddlCultivoLoad()
        {
            EntCultivoPacking.vnIdEmpresa = 1;
            EntCultivoPacking.vnIdCultivo = 0;
            ddlCultivo.DataSource = NegCultivoPacking.ListCultivoPacking(EntCultivoPacking);
            ddlCultivo.DataValueField = "nIdCultivo";
            ddlCultivo.DataTextField = "cDesCultivo";
            ddlCultivo.DataBind();
            this.ddlCultivo.Items.Insert(0, new ListItem("Selecciona Cultivo", "00"));
        }

        private void ddlVariedadLoad()
        {
            EntCultivoVariedad.vnIdEmpresa = 1;
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