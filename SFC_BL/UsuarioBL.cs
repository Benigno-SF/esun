using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class UsuarioBL
    {
        UsuarioDAO dao = new UsuarioDAO();
        UtilBL utl = new UtilBL();
        public DataSet ListPerfUser(UsuarioBE e) {
            return dao.ListPerfUser(e);
        }
        public DataSet ListUser(UsuarioBE e) {
            return dao.ListUser(e);
        }

        public DataSet ListProveedoresPorUsuario(string usuario) 
        {
            return dao.ListProveedoresPorUsuario(usuario);
        }

        public UsuarioBE ValUserSQL(UsuarioBE e)
        {
            return dao.ValUserSQL(e);
        }

        public void Cambiarpsw(UsuarioBE e)
        {
            try
            {
                dao.RegUserAd(e);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public bool ActualizarInformacion(UsuarioBE e) 
        {
            bool rpta = false;
            try
            {
                dao.RegUserUpdate(e);
                rpta = true;
            }
            catch (Exception)
            {
                throw;
            }
            return rpta;
        }

        public UsuarioBE ValUser(UsuarioBE e) {
            string adPath = "LDAP://" + utl.getkey("IpServ");
            LDAPAuth aut = new LDAPAuth(adPath);
            ArrayList gruposDe = new ArrayList();
            ArrayList propUsuarios = new ArrayList();
            UsuarioBE vcUser = new UsuarioBE();
            vcUser.vbUserAuth = false;
            try
            {
                if (aut.autenticado(e.vcDominio, e.vcUsuario, e.vcPassword) == true)
                {
                    propUsuarios = aut.getListaPropiedades();
                    if (propUsuarios.Count > 1)
                    {
                        vcUser.vbUserAuth = true;
                        vcUser.vcUsuario = e.vcUsuario;
                        vcUser.vcPassword = utl.Encryp(e.vcPassword);
                        vcUser.vcUserDes = propUsuarios[0] as string;
                        vcUser.vcNombres = propUsuarios[1] as string;
                        vcUser.vcApellidos = propUsuarios[2] as string;
                        if (propUsuarios.Count > 3)
                            vcUser.vcMovil = propUsuarios[3] as string;
                        else
                            vcUser.vcMovil = "";
                        if (propUsuarios.Count > 4)
                            vcUser.vcCorreo = propUsuarios[4] as string;
                        else
                            vcUser.vcCorreo = "";
                        vcUser.vnIdPerfil = dao.RegUserAd(vcUser);
                    }
                }
            }
            catch (Exception){
                vcUser.vnIdPerfil = 0;
            }
            return vcUser;
        }
    }
}
