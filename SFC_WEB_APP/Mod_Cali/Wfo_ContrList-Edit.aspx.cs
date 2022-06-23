using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Cali
{
    public partial class Wfo_ContrList_Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hidIdForm.Value = this.Master.GetSessionN("IdForm").ToString();
                hidIdCont.Value = this.Master.GetSessionN("IdCont").ToString();
                hidIdMues.Value = this.Master.GetSessionN("IdMues").ToString();
                hidIdFoto.Value = this.Master.GetSessionN("IdFoto").ToString();

            }
            
        }
    }
}