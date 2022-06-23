using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_App
{
    public partial class Wfo_Presentacion : System.Web.UI.Page
    {
        public string canal;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["p"] != null)
            {
                canal = Request["p"].ToString().Trim();
                if (canal == "" || canal == string.Empty)
                {
                    canal = "0";
                }
            }
            else
            {
                canal = "0";
            }
        }
    }
}