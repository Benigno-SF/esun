using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_BoletaRep : System.Web.UI.Page
    {
        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlDispLoad();
            }
        }
        private void ddlDispLoad()
        {   
            EntDisp.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntDisp.vnIdDispositivo = 0;
            EntDisp.vcTipo = "TRBO";
            ddlImpresoras.DataSource = NegDisp.ListDispositivos(EntDisp);
            ddlImpresoras.DataValueField = "nIdDispositivo";
            ddlImpresoras.DataTextField = "cNombre";
            ddlImpresoras.DataBind();
            this.ddlImpresoras.Items.Insert(0, new ListItem("Mostrar en Pantalla", "0"));
        }
    }
}