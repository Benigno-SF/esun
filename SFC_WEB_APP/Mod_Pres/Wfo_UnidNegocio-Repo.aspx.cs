using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Pres
{
    public partial class Wfo_UnidNegocio_Repo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                hdfIdPres.Value = this.Master.GetSessionN("IdPres").ToString();
                hdfIdUnid.Value = this.Master.GetSessionN("IdUNeg").ToString();
                hdfIdForm.Value = this.Master.GetSessionN("IdForm").ToString();
                hdfIdNive.Value = this.Master.GetSessionN("IdNive").ToString();
            }
        }
    }
}