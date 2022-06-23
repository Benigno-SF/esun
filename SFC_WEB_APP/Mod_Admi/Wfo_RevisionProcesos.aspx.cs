using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Admi
{
    public partial class Wfo_RevisionProcesos : System.Web.UI.Page
    {
        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAnioLoad();
            }
        }

        protected void btnRec_ServerClick(object sender, EventArgs e)
        {
            gvLoad();
        }

        private void gvLoad()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vcUsuario = this.Master.GetParamCokkie("cd_user");
            EntNisira.vcPeriodo = ddlPeriodo.SelectedValue;
            EntNisira.vcSemana = ddlSemana.SelectedValue;
            EntNisira.vnDetalle = 3;

            DataSet dt = NegNisira.ListRevisionProcesos(EntNisira);
            ViewState["dt"] = dt.Tables[1];
            GvList.DataSource = dt.Tables[0];
            GvList.DataBind();
        }

        private void ddlAnioLoad()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = "";
            EntNisira.vcPeriodo = "";
            EntNisira.vcSemana = "";
            EntNisira.vcType = "A";
            ddlAnio.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlAnio.DataValueField = "ANIO";
            ddlAnio.DataTextField = "ANIO";
            ddlAnio.DataBind();
            this.ddlAnio.Items.Insert(0, new ListItem("Selecciona Año", "0000"));
        }

        private void ddlPeriodoLoad()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = ddlAnio.SelectedValue;
            EntNisira.vcPeriodo = "";
            EntNisira.vcSemana = "";
            EntNisira.vcType = "P";
            ddlPeriodo.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlPeriodo.DataValueField = "PERIODO";
            ddlPeriodo.DataTextField = "PERIODO";
            ddlPeriodo.DataBind();
            this.ddlPeriodo.Items.Insert(0, new ListItem("Selecciona Periodo", "0"));
        }

        private void ddlSemanaLoad()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = ddlAnio.SelectedValue;
            EntNisira.vcPeriodo = ddlPeriodo.SelectedValue;
            EntNisira.vcSemana = "";
            EntNisira.vcType = "S";
            ddlSemana.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlSemana.DataValueField = "SEMANA";
            ddlSemana.DataTextField = "SEMANA";
            ddlSemana.DataBind();
            this.ddlSemana.Items.Insert(0, new ListItem("Selecciona Semana", "0"));
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
                string Id = GvList.DataKeys[e.Row.RowIndex].Value.ToString();
                var filteredDataRows = dt.Select("id = '" + Id+ "'");
                var filteredDataTable = new DataTable();
                if (filteredDataRows.Length != 0)
                    filteredDataTable = filteredDataRows.CopyToDataTable();
                GridView grdViewOrdersOfCustomer = (GridView)e.Row.FindControl("grdViewOrdersOfCustomer");
                grdViewOrdersOfCustomer.DataSource = filteredDataTable;
                grdViewOrdersOfCustomer.DataBind();
            }
        }

        protected void GvList_DataBound(object sender, EventArgs e)
        {


        }

        protected void ddlAnio_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPeriodoLoad();
        }

        protected void ddlPeriodo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSemanaLoad();
        }

    }
}