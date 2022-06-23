using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using SFC_BE;
using SFC_BL;

namespace SFC_WEB_APP
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [ScriptService]
    public class SerSis : WebService
    {
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string Cambiarpsw(PerfilCambiopsw obj)
        {
            //Extraer la contraseña de la base de datos
            string msg_m;
            string msg_t = "0";

            UtilBL utilBL = new UtilBL();
            UsuarioBL negUser = new UsuarioBL();
            UsuarioBE usr = new UsuarioBE();
            DataSet ds = negUser.ListUser(new UsuarioBE { vcUsuario = obj.vcUser });
            
            usr.vbEstado = (bool)ds.Tables[0].Rows[0]["bEstado"];
            usr.vcApellidos = ds.Tables[0].Rows[0]["cApellidos"].ToString();
            usr.vcCorreo = ds.Tables[0].Rows[0]["cCorreo"].ToString();
            usr.vcDominio = ds.Tables[0].Rows[0]["cPassword"].ToString();
            usr.vcMovil = ds.Tables[0].Rows[0]["cMovil"].ToString();
            usr.vcNombres = ds.Tables[0].Rows[0]["cNombres"].ToString();
            usr.vcPassword = ds.Tables[0].Rows[0]["cPassword"].ToString();
            usr.vcUsuario = ds.Tables[0].Rows[0]["cUsuario"].ToString();
            usr.vnIdPerfil = (int)ds.Tables[0].Rows[0]["nIdPerfil"];

            if (!utilBL.Encryp(obj.vcPswActual.Trim()).Equals(usr.vcPassword) || utilBL.Encryp(obj.vcPswActual.Trim()).Equals(string.Empty))
            {
                msg_m = "Su contraseña actual no es válida.";
            }
            else if (obj.vcPswNuevo.Trim().Equals(string.Empty) || obj.vcPswConfirma.Trim().Equals(string.Empty))
            {
                msg_m = "Los campos de nueva contraseña o confirmación, no deben estar vacíos.";
            }
            else if (!obj.vcPswNuevo.Trim().Equals(obj.vcPswConfirma.Trim()))
            {
                msg_m = "Los campos de nueva contraseña y confirmación, no coinciden.";
            }
            else if (utilBL.Encryp(obj.vcPswActual.Trim()).Equals(utilBL.Encryp(obj.vcPswNuevo.Trim())))
            {
                msg_m = "La nueva contraseña no debe ser igual a la contraseña anterior.";
            }
            else if (negUser.ValUser(new UsuarioBE { vcDominio = utilBL.getkey("Domain"), vcUsuario = usr.vcUsuario, vcPassword = obj.vcPswActual }).vbUserAuth) //Validación LDAP
            {
                msg_m = "Usted no puede cambiar su contraseña por que forma parte del dominio institucional.";
            }
            else
            {
                usr.vcPassword = utilBL.Encryp(obj.vcPswNuevo.Trim());
                negUser.Cambiarpsw(usr);
                msg_m = "La contraseña se cambió correctamente.";
                msg_t = "1";
            }
 
            return new JavaScriptSerializer().Serialize(new { msg = msg_m, t = msg_t }); //t(1:ok, 0:error)
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string UpdInfo(UsuarioBE obj)
        {
            string msg_m;
            string msg_t;

            UsuarioBL usuarioBL = new UsuarioBL();
            if (usuarioBL.ActualizarInformacion(obj))
            {
                msg_m = "El registro se actualizó correctamente.";
                msg_t = "1";
            }
            else
            {
                msg_m = "Hubo un error al actualizar el registro, por favor intente más tarde.";
                msg_t = "0";
            }

            return new JavaScriptSerializer().Serialize(new { msg = msg_m, t = msg_t }); //t(1:ok, 0:error)
        }


        /// <summary>
        /// Este servicio permite el registro de la lectura de paletes
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string RegPalet(RegPalet obj)
        {
            string msg_m;
            string msg_t = "0";
            UsuarioBL negUser = new UsuarioBL();
            ProcesoPaletBE procesoPaletBE = UnoPorCodigo(obj.CodPalet);
            RegPaletBL regPaletBL = new RegPaletBL();

            if (obj.CodPalet.Trim() != string.Empty)
            {
                //Verficar si el código de palet es válido.

                if (obj.CodTunel.Contains("TE"))//Tunel de entrada
                {
                    if (procesoPaletBE != null) //Verificar si el código de palet existe en la lista de registros.
                    {
                        //No isertar porque ya existe.
                        msg_m = obj.CodPalet + ", Ya ha sido registrado en el TUNEL DE ENTRADA.";
                        msg_t = "2";
                    }
                    else
                    {
                        //(1) Insertar con la informacion del tunel actual
                        //palet
                        //tunelentrada
                        //tunelsalida -> null
                        //fechaentrada -> now
                        //fechasalida -> null
                        regPaletBL.Registrar(obj, 1);


                        msg_m = obj.CodPalet + ", se registró en el TUNEL DE ENTRADA.";
                        msg_t = "1";
                    }
                }
                else if (obj.CodTunel.Contains("TS"))//Tunel de salida
                {
                    if (procesoPaletBE != null) //Verficar si el código de palet existe en la lista de registros.
                    {
                        if (procesoPaletBE.Fhfin != null) //Verificar si ya tiene hora de salida
                        {
                            // No registrar
                            msg_m = obj.CodPalet + ", Ya ha sido registrado en el TUNEL DE SALIDA.";
                            msg_t = "2";
                        }
                        else
                        {
                            //(2) Actualizar su fecha de salida
                            //palet
                            //tunelsalida -> null
                            //fechasalida -> now
                            regPaletBL.Registrar(obj, 2);
                            msg_m = obj.CodPalet + ", se registró en el TUNEL DE SALIDA.";
                            msg_t = "1";
                        }
                    }
                    else
                    {
                        //(3) Insertar con la información del tunel de salida actual, dejar en null la hora de entrada y el tunel de entrada
                        //palet
                        //tunelentrada -> null
                        //tunelsalida
                        //fechaentrada -> null
                        //fechasalida -> now
                        regPaletBL.Registrar(obj, 3);
                        msg_m = obj.CodPalet + ", se registró en el TUNEL DE SALIDA.";
                        msg_t = "1";
                    }
                }
                else
                {
                    //rechazar
                    msg_m = "Este código de tunel no es válido.";
                    msg_t = "0";
                }
            }
            else
            {
                //rechazar
                msg_m = "Este código de palet no es válido.";
                msg_t = "0";
            }

            return new JavaScriptSerializer().Serialize(new { msg = msg_m, t = msg_t }); //t(1:ok, 0:error)
        }

        public ProcesoPaletBE UnoPorCodigo(string codigo)
        {
            RegPaletBL regPaletBL = new RegPaletBL();
            DataSet ds = regPaletBL.UnoPorCodigo(codigo);
            if (ds.Tables[0].Rows.Count == 0)
            {
                return null;
            }
            else
            {
                ProcesoPaletBE procesoPaletBE = new ProcesoPaletBE();
                procesoPaletBE.Id = Convert.ToInt32(ds.Tables[0].Rows[0]["nId"].ToString());
                if (ds.Tables[0].Rows[0]["dFhinicio"] is DBNull)
                {
                    procesoPaletBE.Fhinicio = null;
                }
                else
                {
                    procesoPaletBE.Fhinicio = Convert.ToDateTime(ds.Tables[0].Rows[0]["dFhinicio"]);
                }
                if (ds.Tables[0].Rows[0]["dFhfin"] is DBNull)
                {
                    procesoPaletBE.Fhfin = null;
                }
                else
                {
                    procesoPaletBE.Fhfin = Convert.ToDateTime(ds.Tables[0].Rows[0]["dFhfin"]);
                }
                procesoPaletBE.CodPalet = ds.Tables[0].Rows[0]["cCodPalet"].ToString();
                procesoPaletBE.CodTunelEnt = ds.Tables[0].Rows[0]["cCodTunelEnt"].ToString();
                procesoPaletBE.CodTunelSal = ds.Tables[0].Rows[0]["cCodTunelSal"].ToString();
                return procesoPaletBE;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object Reporte_PaletsPorDia()
        {
            List<object> res = new List<object>();
            RegPaletBL regPaletBL = new RegPaletBL();
            foreach (DataRow item in regPaletBL.Reporte_PaletsPorDia().Tables[0].Rows)
            {
                res.Add(new { cantidad = item.ItemArray[0].ToString(), fecha = item.ItemArray[1].ToString() });
            }
            return new JavaScriptSerializer().Serialize(res);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object Reporte_PaletsPorTunel()
        {
            List<object> res = new List<object>();
            RegPaletBL regPaletBL = new RegPaletBL();
            foreach (DataRow item in regPaletBL.Reporte_PaletsPorTunel().Tables[0].Rows)
            {
                res.Add(new { cantidad = item.ItemArray[0].ToString(), tunel = item.ItemArray[1].ToString() });
            }
            return new JavaScriptSerializer().Serialize(res);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object Reporte_PaletsPorTunelYPorDia(string fecha)
        {
            string nfecha = fecha.Split('/')[2] + "-" + fecha.Split('/')[1] + "-" + fecha.Split('/')[0];
            List<object> res = new List<object>();
            RegPaletBL regPaletBL = new RegPaletBL();
            foreach (DataRow item in regPaletBL.Reporte_PaletsPorTunelYPorDia(nfecha).Tables[0].Rows)
            {
                res.Add(new { cantidad = item.ItemArray[0].ToString(), tunel = item.ItemArray[1].ToString() });
            }
            return new JavaScriptSerializer().Serialize(res);
        }

    }
}
