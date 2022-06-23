using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Maes
{
    public partial class Wfo_RepoReparaciones_ADL : System.Web.UI.Page
    {

        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();

        protected void Page_Load(object sender, EventArgs e)
        {
               // ddlMesLoad();
        }

    }
}