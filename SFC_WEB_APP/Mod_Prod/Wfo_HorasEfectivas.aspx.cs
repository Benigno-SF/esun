using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;
using System.Text;
using System.Net;
using System.IO;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_HorasEfectivas : System.Web.UI.Page
    {
        RendimientoProcesoDetalleBE EntRendProcDeta = new RendimientoProcesoDetalleBE();
        RendimientoProcesoDetalleBL NegRendProcDeta = new RendimientoProcesoDetalleBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              //  GvLoad();
            }
        }
        public void GvLoad()
        {
            EntRendProcDeta.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            //Gvlist.DataSource = NegRendProcDeta.RegiRendimientoProcesoDetalle(EntRendProcDeta);
          //  Gvlist.DataBind();
            //UpdGv.Update();
        }
    }
}