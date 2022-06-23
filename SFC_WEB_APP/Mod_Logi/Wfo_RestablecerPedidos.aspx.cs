using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Logi
{
    public partial class Wfo_RestablecerPedidos : System.Web.UI.Page
    {
        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvLoad();
            }
        }

        private void gvLoad()
        {
            EntNis.vcUsuario = this.Master.GetParamCokkie("cd_user");
            int vnIdPerfil = Convert.ToInt32(this.Master.GetParamCokkie("id_perf"));

            DataSet dt = NegNis.ListRequAprobados(EntNis);
            ViewState["dt"] = dt.Tables[1];
            GvList.DataSource = dt.Tables[0];
            GvList.DataBind();

        }

        protected void GvList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

                e.Row.TableSection = TableRowSection.TableHeader;
                e.Row.Cells[3].CssClass = "filter";


            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = ViewState["dt"] as DataTable;
                string IDDOCX = GvList.DataKeys[e.Row.RowIndex].Value.ToString();
                var filteredDataRows = dt.Select("IDDOCX = '" + IDDOCX + "'");
                var filteredDataTable = new DataTable();
                if (filteredDataRows.Length != 0)
                    filteredDataTable = filteredDataRows.CopyToDataTable();
                //dts.Rows.Remove(dts.Select("IdPedidoVenta <> '" + IdPedido + "'")[0]);
                //DataTable dts = dt.Select("IdPedidoVenta = '" + IdPedido + "'")
                GridView grdViewOrdersOfCustomer = (GridView)e.Row.FindControl("grdViewOrdersOfCustomer");
                grdViewOrdersOfCustomer.DataSource = filteredDataTable;
                grdViewOrdersOfCustomer.DataBind();
            }
        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GvList.Rows)
            {
                EntNis.vnIdc = GvList.DataKeys[row.RowIndex].Values[0].ToString();
                EntNis.vnEstado = Convert.ToInt32(((HiddenField)row.FindControl("hdfValue")).Value);
                EntNis.vcCodigo = GvList.DataKeys[row.RowIndex].Values[1].ToString();
                EntNis.vcEmpresa = GvList.DataKeys[row.RowIndex].Values[2].ToString();
                EntNis.vcAprobacion = GvList.DataKeys[row.RowIndex].Values[3].ToString();
                EntNis.vcUsuario = this.Master.GetParamCokkie("cd_user");
                NegNis.RegiEstadoRequerimientoNisira(EntNis);
            }
            gvLoad();

        }

        protected void btnActualizar_ServerClick(object sender, EventArgs e)
        {
            gvLoad();
        }

        protected void GvList_DataBound(object sender, EventArgs e)
        {


        }
    }
}