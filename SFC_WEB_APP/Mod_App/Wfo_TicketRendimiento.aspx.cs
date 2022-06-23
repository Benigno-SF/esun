using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;
using System.Data;


namespace SFC_WEB_APP.Mod_App
{
    public partial class Wfo_TicketRendimiento : System.Web.UI.Page
    {
        DispositivoBE entDisp = new DispositivoBE();
        DispositivoBL negDisp = new DispositivoBL();


        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetPrintDisp();
            ddlLaborLoad();
        }
        protected string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            return context.Request.ServerVariables["REMOTE_HOST"];
        }
        protected void GetPrintDisp() {
            entDisp.vcIP = GetIPAddress();
            entDisp.vcTipo = "IMPR";

            DataSet ds = negDisp.ListDispositivosChild(entDisp);
            if (ds.Tables[0].Rows.Count > 0)
            {
                hdfPrintIp.Value = ds.Tables[0].Rows[0]["cIP"].ToString();
                lblError.Text = "";
                txtCodigo.Visible = true;
            }
            else 
            {
                lblError.Text = "No tiene ningun dispositivo asociado.";
                txtCodigo.Visible = false;
            }
        }

        private void ddlLaborLoad()
        {
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "01";
            ddlLabor.DataSource = negParm.ListParametroGeneral(entParm);
            ddlLabor.DataValueField = "cCodigo";
            ddlLabor.DataTextField = "cDescripcion";
            ddlLabor.DataBind();
            this.ddlLabor.Items.Insert(0, new ListItem("Clamshell", "C"));
            this.ddlLabor.Items.Insert(0, new ListItem("Selecciona Labor", " "));
        }

    }
}