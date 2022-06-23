using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_ComedorRepo : System.Web.UI.Page
    {
        TipoEventoBE EntTeven = new TipoEventoBE();
        TipoEventoBL NegTeven = new TipoEventoBL();

        TicketAlimentoBE EntTickAli = new TicketAlimentoBE();
        TicketAlimentoBL NegTickAli = new TicketAlimentoBL();

        protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                ddlTipoEventoLoad();
                }
            }

        private void ddlTipoEventoLoad()
        {
            EntTeven.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntTeven.vnIdTipoEvento = 0;
            ddlTipoEvento.DataSource = NegTeven.ListTipEventos(EntTeven);
            ddlTipoEvento.DataValueField = "nIdTipoEvento";
            ddlTipoEvento.DataTextField = "cDescEvento";
            ddlTipoEvento.DataBind();
            this.ddlTipoEvento.Items.Insert(0, new ListItem("Selecciona Evento", "00"));
        }
    }
    }