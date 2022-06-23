using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;
using System.Globalization;

namespace SFC_WEB_APP.Mod_RRHH
{
    public partial class Wfo_FichaCovid19 : System.Web.UI.Page
    {
        CultureInfo myCIintl = new CultureInfo("es-ES", false);

        FichaMesBE EntFichaMes = new FichaMesBE();
        FichaMesBL NegFichaMes = new FichaMesBL();


        UtilBL negUtil = new UtilBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnInicProc.Visible = false;
                btnFinProc.Visible = false;
                ValidarProceso();
            }
        }

        private void ValidarProceso()
        {
            EntFichaMes.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntFichaMes.vnIdFichaMes = 0;
            EntFichaMes.vnIdFicha = 4;
            DataSet ds = NegFichaMes.ListFichaMes(EntFichaMes);
            if (ds.Tables[0].Rows.Count == 0)
            {
                btnInicProc.Visible = true;
                btnFinProc.Visible = false;
                txtProc.InnerText = "Mes de llenado de Ficha No Iniciado";
            }
            else
            {
                btnInicProc.Visible = false;
                btnFinProc.Visible = true;
                int nMes = Int32.Parse(ds.Tables[0].Rows[0][3].ToString());
                var cultureEs = "es-ES";
                var MesEs = CultureInfo.CreateSpecificCulture(cultureEs).DateTimeFormat.GetMonthName(nMes);

                txtProc.InnerText = "Ficha de " + MesEs + " Habilitado";
            }
        }
    }
}