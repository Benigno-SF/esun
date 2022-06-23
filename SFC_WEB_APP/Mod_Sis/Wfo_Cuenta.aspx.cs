using SFC_BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BL;

namespace SFC_WEB_APP.Mod_Sis
{
    public partial class Wfo_Perfil : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string usuario = string.Empty;
                if (Request.Cookies["eSunUser"] != null)
                {
                    usuario = Request.Cookies["eSunUser"]["cd_user"];
                }

                UsuarioBE usuarioBE = new UsuarioBE();
                usuarioBE.vcUsuario = usuario;
                UsuarioBL usuarioBL = new UsuarioBL();
                foreach (DataRow item in usuarioBL.ListUser(usuarioBE).Tables[0].Rows)
                {
                    apellidos.Value = item["cApellidos"].ToString();
                    nombres.Value = item["cNombres"].ToString();
                    telefono.Value = item["cMovil"].ToString();
                    break;
                }
            }
        }

        public void btnActualizar_ServerClick(object sender, EventArgs e)
        {
            UsuarioBE usuarioBE = new UsuarioBE();
            usuarioBE.vcMovil = telefono.Value;

            UsuarioBL usuarioBL = new UsuarioBL();
            usuarioBL.ActualizarInformacion(usuarioBE);
        }
    }
}
