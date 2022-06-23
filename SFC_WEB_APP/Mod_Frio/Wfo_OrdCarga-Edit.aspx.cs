using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Frio
{

    public partial class Wfo_OrdCarga_Edit : System.Web.UI.Page
    {
        ConsExternaBE EntCons = new ConsExternaBE();
        ConsExternaBL NegCons = new ConsExternaBL();
        OrdenCargaBE EntOrdc = new OrdenCargaBE();
        OrdenCargaBL NegOrdc = new OrdenCargaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DdlDestLoad();
            ddlCultivoLoad();
            PageInit();
        }
        private void DdlDestLoad()
        {
            EntCons.vnIdEmpresa = 1;
            EntCons.vnSistema = 1;
            ddlDest.DataSource = NegCons.ListPuertos(EntCons);
            ddlDest.DataValueField = "CODIGO";
            ddlDest.DataTextField = "DESCRIPCION";
            ddlDest.DataBind();
            this.ddlDest.Items.Insert(0, new ListItem("Selecciona", "00"));
        }
        private void ddlCultivoLoad()
        {
            EntCons.vnIdEmpresa = 1;
            EntCons.vnSistema = 1;
            EntCons.vctipo = "P";
            ddlCultivo.DataSource = NegCons.ListCultivos(EntCons);
            ddlCultivo.DataValueField = "IDCULTIVO";
            ddlCultivo.DataTextField = "DESCRIPCION";
            ddlCultivo.DataBind();
            this.ddlCultivo.Items.Insert(0, new ListItem("Selecciona", "00"));
        }
        private void PageInit()
        {
            int IdOrdc = Convert.ToInt32(Session["IdOrdC"]);
            if (IdOrdc != 0)
            {
                EntOrdc.vnIdEmpresa = 1;
                EntOrdc.vnIdOrdCarga = Convert.ToInt32(Session["IdOrdC"].ToString());
                EntOrdc.vcFecha = "";
                DataSet ds = NegOrdc.LitOrdenCarga(EntOrdc);
                txtNoCarga.Value = ds.Tables["get"].Rows[0].ItemArray[1].ToString();
                txtDescri.Value = ds.Tables["get"].Rows[0].ItemArray[2].ToString();
                ddlDest.SelectedValue = ds.Tables["get"].Rows[0].ItemArray[3].ToString();
                txtFeCarga.Value = ds.Tables["get"].Rows[0].ItemArray[4].ToString();
                txtHoCarga.Value = ds.Tables["get"].Rows[0].ItemArray[5].ToString();
                txtBook.Value = ds.Tables["get"].Rows[0].ItemArray[6].ToString();
                hdfCdClie.Value = ds.Tables["get"].Rows[0].ItemArray[7].ToString();
                txtCliente.Value = ds.Tables["get"].Rows[0].ItemArray[8].ToString();
                ddlCultivo.SelectedValue = ds.Tables["get"].Rows[0].ItemArray[9].ToString();
            }
            hdfIdOrden.Value = (string)(Session["IdOrdC"]);
        }
    }
}