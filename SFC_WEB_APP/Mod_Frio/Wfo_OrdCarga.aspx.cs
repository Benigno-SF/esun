using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Frio
{
    public partial class Wfo_OrdCarga : System.Web.UI.Page
    {
        OrdenCargaBE EntOrdc = new OrdenCargaBE();
        OrdenCargaBL NegOrdc = new OrdenCargaBL();
        ConsExternaBE EntCons = new ConsExternaBE();
        ConsExternaBL NegCons = new ConsExternaBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            GvLoad();
        }
        private void GvLoad()
        {
            EntOrdc.vnIdEmpresa = 1;
            EntOrdc.vnIdOrdCarga = 0;
            EntOrdc.vcFecha = txtFeRegi.Value;
            GvList.DataSource = NegOrdc.ListOrdenCarga(EntOrdc);
            GvList.DataBind();
            //UpdGv.Update();
        }

        protected void btnAgregar_ServerClick(object sender, EventArgs e)
        {
            Session["IdOrdC"] = "0";
            Response.Redirect("Wfo_OrdCarga-Edit.aspx");

        }
        protected void btnGvEdit_ServerClick(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdOrdC"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Response.Redirect("Wfo_OrdCarga-Edit.aspx");
        }
        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }

        protected void btnGvRegi_ServerClick(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            EntOrdc.vnIdEmpresa = 1;
            EntOrdc.vnIdOrdCarga = Convert.ToInt32(GvList.DataKeys[row.RowIndex].Values[0].ToString());
            DataSet ds = NegOrdc.ListOrdenCarga(EntOrdc);
            ds.Tables[0].TableName = "CABE";
            //
            EntCons.vnIdEmpresa = 1;
            EntCons.vnSistema = 1;
            EntCons.vcIdCliente = "";
            EntCons.vcIdCultivo = "";
            EntCons.vcIdVariedad = "";
            EntCons.vcFecha = "";
            EntCons.vnIdOrdCarga = EntOrdc.vnIdOrdCarga;
            DataSet dsDet = NegCons.ListStockPallet(EntCons);
            DataTable dt = dsDet.Tables[0];
            dt.TableName = "DETA";
            ds.Tables.Add(dt.Copy());
            string ruta = Server.MapPath("~/temp");
            if (!System.IO.Directory.Exists(ruta))
                System.IO.Directory.CreateDirectory(ruta);
            string NoXml = "RepOrdeDocu";
            string DiXml = ruta + "/" + NoXml + ".xml";
            ds.WriteXml(DiXml, XmlWriteMode.WriteSchema);
            //Response.Redirect("~/Mod_Prod/Wfo_PreOrden.aspx");

        }
    }
}