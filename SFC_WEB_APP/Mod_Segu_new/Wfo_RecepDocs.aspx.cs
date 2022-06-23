using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Segu
{
    public partial class Wfo_RecepDocs : System.Web.UI.Page
    {

        RecepcionBE EntRecep = new RecepcionBE();
        RecepcionBL NegRecep = new RecepcionBL();

        UsuarioBE EntUser = new UsuarioBE();
        UsuarioBL NegUser = new UsuarioBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             //   GvLoad();
               // ddlUsuariosLoad();

            }
        }

        protected void btnBusc_ServerClick(object sender, EventArgs e)
        {
         //   GvLoad();
        }
        private void GvLoad()
        {
           // EntRecep.vnIdEmpresa = Convert.ToInt32(this.Master.GetParamURL("Cd", false));
          /*  EntRecep.vnIdRecepcion = 0;
            EntRecep.vcFecha = txtFeCont.Value;
            GvList.DataSource = NegRecep.ListRecepcion(EntRecep);
            GvList.DataBind();*/
            //UpdGv.Update();
        }
        private void ddlUsuariosLoad()
        {
            EntUser.vcUsuario = "";
            ddlUsuarios.DataSource = NegUser.ListUser(EntUser);
            string strA = "cNombres ";
            string strB = "cApellidos";
            string str;
            str = String.Concat(strA, strB);
            ddlUsuarios.DataValueField = "cUsuario";
            ddlUsuarios.DataTextField = str;
            ddlUsuarios.DataBind();
            this.ddlUsuarios.Items.Insert(0, new ListItem("Selecciona Usuario", "00"));
        }

   


    }
}