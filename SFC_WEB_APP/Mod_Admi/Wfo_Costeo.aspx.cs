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
    public partial class Wfo_Costeo : System.Web.UI.Page
    {
        ConsNisiraBE EntNisira = new ConsNisiraBE();
        ConsNisiraBL NegNisira = new ConsNisiraBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlAnioLoad();
                ddlAnioLoad1();
            }
        }

        private void gvLoad()
        {
            if (ddlPeriodo.SelectedValue != "" && ddlPeriodo.SelectedValue != "0")
            {
                EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
                EntNisira.vcUsuario = this.Master.GetParamCokkie("cd_user");
                EntNisira.vcPeriodo = ddlPeriodo.SelectedValue;
                DataSet dt = NegNisira.ListCosteoMensual(EntNisira);
                ViewState["dt"] = dt.Tables[1];
                GvList.DataSource = dt.Tables[0];
                GvList.DataBind();
            }
        }

        protected void btnRec_ServerClick(object sender, EventArgs e)
        {
            gvLoad();
            string am = "loadSH()";
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "myFuncionAlerta", am, true);
        }

        private void ddlAnioLoad1()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = "";
            EntNisira.vcPeriodo = "";
            EntNisira.vcSemana = "";
            EntNisira.vcType = "A";
            ddlAnio1.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlAnio1.DataValueField = "ANIO";
            ddlAnio1.DataTextField = "ANIO";
            ddlAnio1.DataBind();
            this.ddlAnio1.Items.Insert(0, new ListItem("Selecciona Año", "0000"));
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

        private void ddlPeriodoLoad1()
        {
            EntNisira.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntNisira.vnIdPlanilla = "OBR";
            EntNisira.vcAnio = ddlAnio1.SelectedValue;
            EntNisira.vcPeriodo = "";
            EntNisira.vcSemana = "";
            EntNisira.vcType = "P";
            ddlPeriodo1.DataSource = NegNisira.ListPeriodo(EntNisira);
            ddlPeriodo1.DataValueField = "PERIODO";
            ddlPeriodo1.DataTextField = "PERIODO";
            ddlPeriodo1.DataBind();
            this.ddlPeriodo1.Items.Insert(0, new ListItem("Selecciona Periodo", "0"));
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

        protected void ddlAnio_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlPeriodoLoad();
        }
        protected void ddlAnio_SelectedIndexChanged1(object sender, EventArgs e)
        {
            ddlPeriodoLoad1();
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
                var filteredDataRows = dt.Select("id = '" + Id + "'");
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

    }
}