using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP
{
    public partial class login : System.Web.UI.Page
    {
        UsuarioBE entUser = new UsuarioBE();
        UsuarioBL negUser = new UsuarioBL();

        UtilBL negUtil = new UtilBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            DivAlert.Visible = false;
            DivBlock.Visible = false;
        }
        protected string GetIPAddress()
        {
            HttpContext context = HttpContext.Current;
            return context.Request.ServerVariables["REMOTE_HOST"];
        }

        protected void btnLogin_ServerClick(object sender, EventArgs e)
        {

            UsuarioBE vcUser = new UsuarioBE();
            string vcUsuario = txtcdUser.Value;

            //Esta parte dbería obtener el ROL
            if (vcUsuario == "admin")
            {
                vcUser.vcUsuario = "ADMIN";
                vcUser.vnIdPerfil = 0;
                vcUser.vbEstado = false;
            }
            else
            {
                entUser.vcDominio = negUtil.getkey("Domain");
                entUser.vcUsuario = txtcdUser.Value;
                entUser.vcPassword = txtPass.Value;

                //entUser.vcUsuario = "cancajima";
                //entUser.vcPassword = "NkIqdrRcjh1OCoU7LSIOegQw6BFeULmWs8KigIJrsc0=";

                // Validacion LDAP
                vcUser = negUser.ValUser(entUser);

                if (vcUser.vbUserAuth == false)
                {
                    //login SQL
                    entUser.vcUsuario = txtcdUser.Value;
                    entUser.vcPassword = negUtil.Encryp(txtPass.Value);
                    entUser.vcApellidos = "";
                    entUser.vcNombres = "";
                    entUser.vcCorreo = "";
                    entUser.vcMovil = "";
                    entUser.vbEstado = false;
                    entUser.vnIdPerfil = 0;
                    vcUser = negUser.ValUserSQL(entUser);
                }
            }

            if (vcUser.vnIdPerfil != 0)
            {
                if (vcUser.vbEstado == false)
                {
                    DivBlock.Visible = true;
                    return;
                }
                HttpCookie Cookie = new HttpCookie("eSunUser", DateTime.Now.ToString());
                Cookie["cd_user"] = vcUser.vcUsuario.ToUpper(); //nombre de usuario
                Cookie["id_perf"] = vcUser.vnIdPerfil.ToString();
                Cookie["cd_IpLo"] = GetIPAddress();

                HttpCookie Cookie3 = new HttpCookie("jdU8d9K", DateTime.Now.ToString());
                Cookie3["jdU8d9K"] = "emp";

                HttpCookie Cookie2 = new HttpCookie("UmdsMXD", DateTime.Now.ToString());
                UsuarioBL usuarioBL = new UsuarioBL();
                DataTable dataTable = usuarioBL.ListProveedoresPorUsuario(vcUsuario).Tables[0];
                foreach (DataRow item in dataTable.Rows)
                {
                    Cookie2["Un_z2SmST"] = item.ItemArray[0].ToString(); // Id de la relacion entre el cliente y del proveedor
                    Cookie2["Lj_ksiDgS"] = item.ItemArray[1].ToString(); // Nombre del proveedor
                    break;
                }

                Cookie.Expires = DateTime.Today.AddDays(1).AddSeconds(-1);
                Response.Cookies.Add(Cookie);
                Response.Cookies.Add(Cookie2);
                Response.Cookies.Add(Cookie3);
                System.Web.Security.FormsAuthentication.SetAuthCookie(vcUser.vcUsuario.ToUpper(), chkRemember.Checked);
                Response.Redirect("~/");
            }
            else
            {
                DivAlert.Visible = true;
            }
        }
    }
}