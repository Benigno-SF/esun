using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Sis
{
    public partial class Wfo_SeleccionarEmpresa : Page
    {
        public string usuario { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            usuario = null;

            if (Request.Cookies["eSunUser"] != null)
            {
                usuario = Request.Cookies["eSunUser"]["cd_user"];
            }

            if (!IsPostBack)
            {
                ddlProveedorLoad();
                txtClienteActual.Value = Request.Cookies["UmdsMXD"]["Lj_ksiDgS"];
            }   
        }

        private void ddlProveedorLoad()
        {
            UsuarioBL usuarioBL = new UsuarioBL();
            ddlProveedor.DataSource = usuarioBL.ListProveedoresPorUsuario(usuario);
            ddlProveedor.DataValueField = "Id";
            ddlProveedor.DataTextField = "Nombre";
            ddlProveedor.DataBind();
            this.ddlProveedor.Items.Insert(0, new ListItem("Selecciona Cliente", "0"));
        }

        protected void btnCambiar_ServerClick(object sender, EventArgs e)
        {
            HttpCookie Cookie = new HttpCookie("UmdsMXD", DateTime.Now.ToString());
            UsuarioBL usuarioBL = new UsuarioBL();
            DataTable dataTable = usuarioBL.ListProveedoresPorUsuario(usuario).Tables[0];
            foreach (DataRow item in dataTable.Rows)
            {
                if (ddlProveedor.SelectedValue.ToString() == item.ItemArray[0].ToString())
                {
                    Cookie["Un_z2SmST"] = item.ItemArray[0].ToString(); // Id deL proveedor
                    Cookie["Lj_ksiDgS"] = item.ItemArray[1].ToString(); // Nombre del proveedor
                    break;
                }
            }
            Cookie.Expires = DateTime.Today.AddDays(1).AddSeconds(-1);
            Response.Cookies.Add(Cookie);
            txtClienteActual.Value = Cookie["Lj_ksiDgS"];
            
        }
    }
}
