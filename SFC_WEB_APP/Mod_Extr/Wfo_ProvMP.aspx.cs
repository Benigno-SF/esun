using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP.Mod_Admi
{
    public partial class Wfo_ProvMP : System.Web.UI.Page
    {
        ProveedorAlmacenBL proveedorAlmacen = new ProveedorAlmacenBL(); 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarAlmacenes();
            }
        }

        private void CargarAlmacenes()
        {
            int proveedoractual = 0;
            string par_cookie = string.Empty;
            if (Request.Cookies["UmdsMXD"] != null)
            {
                par_cookie = Request.Cookies["UmdsMXD"]["Un_z2SmST"];
            }

            if (par_cookie == string.Empty)
            {
                proveedoractual = 0;
            }
            else
            {
                proveedoractual = Convert.ToInt32(par_cookie);
            }
            pidproveedor.Value = proveedoractual.ToString();

            ddlAlmacen.DataSource = proveedorAlmacen.ListAlmacenPorProveedor(proveedoractual);
            ddlAlmacen.DataValueField = "Id_Almacen";
            ddlAlmacen.DataTextField = "Nombre";
            ddlAlmacen.DataBind();
            this.ddlAlmacen.Items.Insert(0, new ListItem("(Seleccionar)", "0"));
        }
    }
}
