using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Cali
{
    public partial class Wfo_ContrList : System.Web.UI.Page
    {
        ControlBE EntCont = new ControlBE();
        ControlBL NegCont = new ControlBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            GvLoad();
        }
        private void GvLoad()
        {
            EntCont.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
            EntCont.vcFecha = txtFeCont.Value;
            EntCont.vcDescripcion = txtDescri.Value;
            GvList.DataSource = NegCont.ListControl(EntCont);
            GvList.DataBind();
            //UpdGv.Update();
        }
        protected void btnGvRegi_ServerClick(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdForm"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Session["IdCont"] = GvList.DataKeys[row.RowIndex].Values[1].ToString();
            Session["IdMues"] = "0";
            Session["IdFoto"] = "0";
            Response.Redirect("Wfo_ContrList-Edit.aspx?Cd=" + (this.Master.GetParamURL("Cd", true)));

        }
        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
            GvLoad();
        }
        protected void btnGvRepo_ServerClick(object sender, EventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlButton btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            GridViewRow row = (GridViewRow)btn.NamingContainer;
            Session["IdForm"] = GvList.DataKeys[row.RowIndex].Values[0].ToString();
            Session["IdCont"] = GvList.DataKeys[row.RowIndex].Values[1].ToString();
            Response.Redirect("Wfo_ContrParam.aspx");

        }
    }
}