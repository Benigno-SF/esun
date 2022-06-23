using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP
{
    public partial class wfo : System.Web.UI.Page
    {
        ConsHispBE EntHisp = new ConsHispBE();
        ConsHispBL NegHisp = new ConsHispBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvLoad();
        }
        public string GetParamCokkie(string Param)
        {
            string a = HttpContext.Current.User.Identity.Name;
            string Value = "";
            try
            {
                HttpCookie GetCookie = Request.Cookies["eSunUser"];
                Value = GetCookie[Param].ToString();
            }
            catch
            {
                Session.Abandon();
                System.Web.Security.FormsAuthentication.SignOut();
                Response.Redirect("~/");
            }
            return Value;
        }
        private void gvLoad()
        {
            EntHisp.vcUsuario = GetParamCokkie("cd_user");

            DataSet dt = NegHisp.ListRequConsumo(EntHisp);
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
                e.Row.Cells[4].CssClass = "filter";
                e.Row.Cells[5].CssClass = "filter";
                e.Row.Cells[6].CssClass = "filter";


            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = ViewState["dt"] as DataTable;
                string IdPedido = GvList.DataKeys[e.Row.RowIndex].Value.ToString();
                var filteredDataRows = dt.Select("IdPedidoVenta = '" + IdPedido + "'");
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
        protected void GvList_DataBound(object sender, EventArgs e)
        {


        }
    }
}