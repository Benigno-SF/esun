using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Cali
{
    public partial class Wfo_ContrParam : System.Web.UI.Page
    {
        ControlNroMuestraBE EntCont = new ControlNroMuestraBE();
        ControlNroMuestraBL NegCont = new ControlNroMuestraBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            GvLoad();
        }
        private void GvLoad()
        {
            EntCont.vnIdEmpresa = 1;
            EntCont.vnIdFormato = Convert.ToInt32(Session["IdForm"]);
            EntCont.vnIdControl = Convert.ToInt32(Session["IdCont"]);

            GvList.DataSource = NegCont.ListParamDeta(EntCont);
            GvList.DataBind();
            //UpdGv.Update();
        }
    }
}