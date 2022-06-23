using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_InfoLine : System.Web.UI.Page
    {
        AreaProcesoBE EntProceso = new AreaProcesoBE();
        AreaProcesoBL NegProceso = new AreaProcesoBL();

        PanelInfoBE EntPane = new PanelInfoBE();
        PanelInfoBL NegPane = new PanelInfoBL();

        CultivoBE EntCult = new CultivoBE();
        CultivoBL NegCult = new CultivoBL();

        CultivoCaracteristicaBE EntCultCara = new CultivoCaracteristicaBE();
        CultivoCaracteristicaBL NegCultCara = new CultivoCaracteristicaBL();

        PanelInfoBE EntPaneInfo = new PanelInfoBE();
        PanelInfoBL NegPaneInfo = new PanelInfoBL();

        RendimientoProcesoBE EntRendProc = new RendimientoProcesoBE();
        RendimientoProcesoBL NegRendProc = new RendimientoProcesoBL();



        UtilBL negUtil = new UtilBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAreaProc();
                ddlCultivoLoad();
                GvLoad();
                btnInicProc.Visible = false;
                btnFinProc.Visible = false;
            }
        }

        private void ddlAreaProc() {
            EntProceso.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            ddlAProceso.DataSource = NegProceso.ListAreaProceso(EntProceso);
            ddlAProceso.DataValueField = "nIdArea";
            ddlAProceso.DataTextField = "cDescAProceso";
            ddlAProceso.DataBind();
            this.ddlAProceso.Items.Insert(0, new ListItem("Selecciona", "0"));
        }

        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }

        protected void GvLoad() {
            EntPane.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPane.vnIdArea = Convert.ToInt32(ddlAProceso.SelectedValue);
            EntPane.vnIdSubLinea = Convert.ToInt32(hdfSubLi.Value);
            EntPane.vnIdPanelInfo = 0;
            GvList.DataSource = NegPane.LisPanelInfo(EntPane);
            GvList.DataBind();

        }
        protected void DdlAreaCtrl() {
            EntPane.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPane.vnIdArea = Convert.ToInt32(ddlAProceso.SelectedValue);
            EntPane.vnIdSubLinea = 0;
            EntPane.vnIdPanelInfo = 0;
            DataSet ds = NegPane.LisPanelInfo(EntPane);
            ddlIdCult.SelectedValue = "0";
            ddlIdCult.Enabled = true;
            if (ds.Tables[0].Rows.Count > 0)
            {
                ddlIdCult.SelectedValue = ds.Tables[0].Rows[0]["nIdCultivo"].ToString();
                ddlIdCult.Enabled = false;
                ddlCaliLoad();
                ddlCateLoad();
            }
        }

        private void ddlCultivoLoad()
        {
            EntCult.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCult.vnIdCultivo = 0;
            EntCult.vnIdFundo = 0;
            ddlIdCult.DataSource = NegCult.ListCultivo(EntCult);
            ddlIdCult.DataValueField = "nIdCultivo";
            ddlIdCult.DataTextField = "cDesCultivo";
            ddlIdCult.DataBind();
            this.ddlIdCult.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlCateLoad() {
            EntCultCara.vnIdCultivo = Convert.ToInt32(ddlIdCult.SelectedValue);
            EntCultCara.vcTipo = "CAT";
            ddlIdCate.DataSource = NegCultCara.ListCultivoCarcteristica(EntCultCara);
            ddlIdCate.DataValueField = "nIdCaracteristica";
            ddlIdCate.DataTextField = "cDesCarcateristica";
            ddlIdCate.DataBind();
            this.ddlIdCate.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ddlCaliLoad()
        {
            EntCultCara.vnIdCultivo = Convert.ToInt32(ddlIdCult.SelectedValue);
            EntCultCara.vcTipo = "CAL";
            ddlIdCali.DataSource = NegCultCara.ListCultivoCarcteristica(EntCultCara);
            ddlIdCali.DataValueField = "nIdCaracteristica";
            ddlIdCali.DataTextField = "cDesCarcateristica";
            ddlIdCali.DataBind();
            this.ddlIdCali.Items.Insert(0, new ListItem("Selecciona", "0"));
        }
        private void ValidarProceso() {
            EntRendProc.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntRendProc.vnIdProceso = 0;
            EntRendProc.vnIdArea = Convert.ToInt32(ddlAProceso.SelectedValue);
            DataSet ds = NegRendProc.ListRendimientoProceso(EntRendProc);
            if (ds.Tables[0].Rows.Count == 0)
            {
                btnInicProc.Visible = true;
                btnFinProc.Visible = false;
                txtProc.InnerText = "Proceso No Iniciado";
            }
            else {
                btnInicProc.Visible = false;
                btnFinProc.Visible = true;
                string fecha = ds.Tables[0].Rows[0][2].ToString();
                txtProc.InnerText = "Proceso Iniciado del dia "+fecha;
            }
        }

        protected void ddlIdCult_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCaliLoad();
            ddlCateLoad();
        }

        protected void btnGvEdit_ServerClick(object sender, EventArgs e)
        {
            string Cd = this.Master.GetParamURL("Cd", true);
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            EntPaneInfo.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(Cd));
            EntPaneInfo.vnIdSubLinea = Convert.ToInt32(GvList.DataKeys[row.RowIndex].Values[0].ToString());
            EntPaneInfo.vnIdPanelInfo = Convert.ToInt32(GvList.DataKeys[row.RowIndex].Values[1].ToString());
            EntPaneInfo.vnIdCultivo = 0;
            EntPaneInfo.vnIdCategoria = 0;
            EntPaneInfo.vnIdCalibre = 0;
            EntPaneInfo.vbEstado = false;
            EntPaneInfo.vcUsuario = this.Master.GetParamCokkie("cd_user");
            NegPaneInfo.RegiPanelInfo(EntPaneInfo);
            GvLoad();
        }

        protected void ddlAProceso_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ddlAProceso.SelectedValue) != 0)
            {
                ValidarProceso();
            }
            else
            {
                btnInicProc.Visible = false;
                btnFinProc.Visible = false;
            }

            DdlAreaCtrl();
        }
        protected void btnDdlIdCul_ServerClick(object sender, EventArgs e)
        {
            DdlAreaCtrl();
        }

        private void Actdata() {



        }

    }
}