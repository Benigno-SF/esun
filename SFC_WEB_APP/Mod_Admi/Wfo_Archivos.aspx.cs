using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Agro
{
    public partial class Wfo_Archivos : System.Web.UI.Page
    {
        ClienteBE EntCliente = new ClienteBE();
        ClienteBL NegCliente = new ClienteBL();

        TipoDocumentoBE EntTipoDoc = new TipoDocumentoBE();
        TipoDocumentoBL NegTipoDoc = new TipoDocumentoBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCLienteLoad();
               // ddlTipoDocLoad();
            }
        }

        private void ddlCLienteLoad()
        {
            EntCliente.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlCliente.DataSource = NegCliente.ListCliente(EntCliente);
            ddlCliente.DataValueField = "nIdClienteS";
            ddlCliente.DataTextField = "cDesClienteS";
            ddlCliente.DataBind();
            this.ddlCliente.Items.Insert(0, new ListItem("Selecciona Proveedor", "0"));
        }

        private void ddlTipoDocLoad()
        {
            EntTipoDoc.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntTipoDoc.vnIdTipoDoc = 0;
            EntTipoDoc.vcDescTipoDoc = "";
            ddlTipoDoc.DataSource = NegTipoDoc.ListTipoDocumento(EntTipoDoc);
            ddlTipoDoc.DataValueField = "nIdTipoDoc";
            ddlTipoDoc.DataTextField = "cDescTipoDoc";
            ddlTipoDoc.DataBind();
            this.ddlTipoDoc.Items.Insert(0, new ListItem("Selec. Tipo Documento", "0"));
        }
    }
}