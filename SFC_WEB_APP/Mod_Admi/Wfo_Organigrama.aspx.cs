using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;
using System.IO;


namespace SFC_WEB_APP.Mod_Admi
{
    public partial class Wfo_Organigrama : System.Web.UI.Page
    {

        OrganigramaBE EntOrganigrama = new OrganigramaBE();
        OrganigramaBL NegOrganigrama = new OrganigramaBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        private void ddlItemsLoad()
        {
            EntOrganigrama.vnIdEmpresa = 1;
            EntOrganigrama.vnidOrganigrama = 0;
            EntOrganigrama.vnIdNivel = 0;
            EntOrganigrama.vnIdNivelMaster = 0;
            ddlItems.DataSource = NegOrganigrama.ListOrganigrama(EntOrganigrama);
            ddlItems.DataValueField = "nIdNivel";
            ddlItems.DataTextField = "cDesOrgItem";
            ddlItems.DataBind();
            this.ddlItems.Items.Insert(0, new ListItem("Selecciona Padre", "0"));
        }





    }
}