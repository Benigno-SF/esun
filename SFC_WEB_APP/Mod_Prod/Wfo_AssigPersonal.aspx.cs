using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;


using System.Text;
using System.Net;
using System.IO;

namespace SFC_WEB_APP.Mod_Prod
{
    public partial class Wfo_AssigPersonal : System.Web.UI.Page
    {
        PersonalBE EntPers = new PersonalBE();
        PersonalBL NegPers = new PersonalBL();

        ParametroGeneralBE entParm = new ParametroGeneralBE();
        ParametroGeneralBL negParm = new ParametroGeneralBL();

        RendimientoProcesoRegistroBE entRend = new RendimientoProcesoRegistroBE();
        RendimientoProcesoRegistroBL negRend = new RendimientoProcesoRegistroBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DdlLabor();
               GvLoad();
            }
        }
        public void GvLoad()
        {
            EntPers.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntPers.vcNroDocumento = txtDni.Value;
            EntPers.vcNombres = txtNomApe.Value;
            EntPers.vcIdPlanilla = "OBR";
            EntPers.vcCodigoLabor = "";
            GvList.DataSource = NegPers.ListPersonal(EntPers);
            GvList.DataBind();
            //UpdGv.Update();
        }
        public void DdlLabor() {
            DataSet dt = ViewState["dt"] as DataSet;
            entParm.vcCodigo = "";
            entParm.vcCodigoMaster = "01";
            dt = negParm.ListParametroGeneral(entParm);
            ViewState["dt"] = dt;
        }
        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }

        protected void GvList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            DataSet dt = ViewState["dt"] as DataSet;
            if (e.Row.RowType == DataControlRowType.DataRow){
                LinkButton btn = (e.Row.FindControl("btnGvLimpia") as LinkButton);
                if (Convert.ToInt32(e.Row.Cells[5].Text) < 99 )
                    btn.Visible = false;
                else
                    btn.Visible = true;
                DropDownList ddl = (e.Row.FindControl("ddlLabor") as DropDownList);
                HiddenField hdf = (e.Row.FindControl("hdfcCodigoLabor") as HiddenField);
                ddl.DataSource = dt;
                ddl.DataValueField = "cCodigo";
                ddl.DataTextField = "cDescripcion";
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem("Asignar Labor", ""));
                ddl.SelectedValue = hdf.Value;

            }
        }
        public void myListDropDown_Change(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            string vvstr = GvList.DataKeys[row.RowIndex].Values[1].ToString();
            
            EntPers.vcNroDocumento = vvstr;
            EntPers.vcCodigoLabor = ddl.SelectedItem.Value;
           // EntPers.vcCodigoLabor = row;
            String vvMsje = NegPers.ActualizaLabor(EntPers);

        }
        protected void btnEliminar_ServerClick(object sender, EventArgs e)
        {
            string Cd = this.Master.GetParamURL("Cd", true);
            entRend.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            entRend.vnIdPersonal = Convert.ToInt32(hdfIdElimina.Value);
            int a = negRend.DelRendimientoProcesoRegistro(entRend);
            GvLoad();
        }
    }
}