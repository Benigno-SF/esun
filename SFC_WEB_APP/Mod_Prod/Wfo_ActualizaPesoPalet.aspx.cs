using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_ActualizaPesoPalet : System.Web.UI.Page
    {
        DispositivoBE EntDisp = new DispositivoBE();
        DispositivoBL NegDisp = new DispositivoBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlDispositivoLoad();
            }
        }
        private void ddlDispositivoLoad() {
            EntDisp.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntDisp.vnIdDispositivo = 0;
            EntDisp.vcTipo = "BLZA";
            ddlDispositivo.DataSource = NegDisp.ListDispositivos(EntDisp);
            ddlDispositivo.DataValueField = "nIdDispositivo";
            ddlDispositivo.DataTextField = "cNombre";
            ddlDispositivo.DataBind();
            this.ddlDispositivo.Items.Insert(0, new ListItem("Seleccione", "0"));

        }

        protected void btnRegi_ServerClick(object sender, EventArgs e)
        {
            //TCPListenerBL tcp = new TCPListenerBL();
            //tcp.GetPeso("");

        }
    }
}