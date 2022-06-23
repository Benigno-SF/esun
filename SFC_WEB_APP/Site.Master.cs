using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using SFC_BE;
using SFC_BL;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SFC_WEB_APP
{
    public partial class Site : System.Web.UI.MasterPage
    {
        UsuarioBE entUser = new UsuarioBE();
        UsuarioBL negUser = new UsuarioBL();

        UtilBL negUtil = new UtilBL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPage();
            }
        }

        private void LoadPage()
        {
            string vsApel = "";
            string vsNomb = "";
            string vcUsuario = GetParamCokkie("cd_user");
            if (vcUsuario == "ADMIN")
            {
                vsApel = "Admin";
                vsNomb = "Admin";
            }
            else {
                entUser.vcUsuario = vcUsuario;
                DataSet ds = negUser.ListUser(entUser);
                vsApel = ds.Tables[0].Rows[0]["cApellidos"].ToString();
                vsNomb = ds.Tables[0].Rows[0]["cNombres"].ToString();
                MenuHide();
                MenuShow();

            }
            spUser.InnerText = vsNomb + " " + vsApel;
        }

        private void MenuHide()
        {
            foreach (Control ctl in this.FindControl("apMenu").Controls)
            {
                if (ctl is System.Web.UI.HtmlControls.HtmlAnchor)
                {
                    ((System.Web.UI.HtmlControls.HtmlAnchor)ctl).Visible = false;
                }
                else if (ctl is System.Web.UI.HtmlControls.HtmlGenericControl)
                {
                    ((System.Web.UI.HtmlControls.HtmlGenericControl)ctl).Visible = false;

                }

            }
        }

        private void MenuShow()
        {
            entUser.vcUsuario = GetParamCokkie("cd_user");
            DataSet ds = negUser.ListPerfUser(entUser);
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                try
                {
                    string vvctrl = row["cMenuItem"].ToString();
                    var ctrlMast = FindControl(vvctrl);
                    if (ctrlMast != null)
                    {
                            ctrlMast.Visible = true;
                        if (row["bLast"].ToString() == "1")
                        {
                            System.Web.UI.HtmlControls.HtmlAnchor ctrl =
                                (System.Web.UI.HtmlControls.HtmlAnchor)FindControl(vvctrl);
                            ctrl.Visible = true;
                            ctrl.HRef += "?Cd=" + negUtil.Encryp(row["nIdEmpresa"].ToString());
                            ctrl.Attributes.Add("data-empr", negUtil.Encryp(row["nIdEmpresa"].ToString()));
                        }
                    }
                }
                catch { }
            }
        }
        public string GetParamURL(string Param, bool Encryp)
        {
            string value = Request.QueryString[Param];
            if (Encryp)
                return value;
            else
                return negUtil.Decrypt(value);
        }
        public string GetSessionS(string vcSess)
        {
            return Session[vcSess] == null ? "" : Session[vcSess].ToString();
        }

        public int GetSessionN(string vcSess)
        {
            return Convert.ToInt32(Session[vcSess] == null ? "0" : Session[vcSess].ToString());
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

        protected void lkbLogOutm_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            System.Web.Security.FormsAuthentication.SignOut();
            Response.Redirect("~/");
        }

        protected void lkbChaPsw_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Mod_Sis/Wfo_CambiarPsw");
        }

        protected void lkbAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Mod_Sis/Wfo_Cuenta");
        }

        protected void lkbChaBuss_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Mod_Sis/Wfo_SeleccionarEmpresa");
        }
    }
}