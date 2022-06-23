using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Data;
using SFC_BE;
using SFC_BL;
using System.IO;
using System.Web.Script.Services;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerTI
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerTI : System.Web.Services.WebService
    {

        Inv_MarcaBE EntInv_Marca = new Inv_MarcaBE();
        Inv_MarcaBL NegInv_Marca = new Inv_MarcaBL();

        Inv_TipoDeviceBE Ent_TipoDevice = new Inv_TipoDeviceBE();
        Inv_TipoDeviceBL Neg_TipoDevice = new Inv_TipoDeviceBL();

        Inv_UbicacionBE Ent_Ubicacion = new Inv_UbicacionBE();
        Inv_UbicacionBL Neg_Ubicacion = new Inv_UbicacionBL();

        Inv_AreaBE Ent_InvArea = new Inv_AreaBE();
        Inv_AreaBL Neg_InvArea = new Inv_AreaBL();

        Inv_AntivirusBE Ent_Antivirus = new Inv_AntivirusBE();
        Inv_AntivirusBL Neg_Antivirus = new Inv_AntivirusBL();

        Inv_AsignacionBE Ent_Asignacion = new Inv_AsignacionBE();
        Inv_AsignacionBL Neg_Asignacion = new Inv_AsignacionBL();

        Inv_DeviceBE Ent_Device = new Inv_DeviceBE();
        Inv_DeviceBL Neg_Device = new Inv_DeviceBL();

        Inv_IncidenciaBE Ent_Incidencia = new Inv_IncidenciaBE();
        Inv_IncidenciaBL Neg_Incidencia = new Inv_IncidenciaBL();

        Inv_OfficeBE Ent_Office = new Inv_OfficeBE();
        Inv_OfficeBL Neg_Office = new Inv_OfficeBL();

        Inv_ProcesadorBE Ent_Procesador = new Inv_ProcesadorBE();
        Inv_ProcesadorBL Neg_Procesador = new Inv_ProcesadorBL();

        Inv_SOBE Ent_SO = new Inv_SOBE();
        Inv_SOBL Neg_SO = new Inv_SOBL();

        FrioErrorBL Neg_Frio_Err = new FrioErrorBL();

        UtilBL negUtil = new UtilBL();

        [WebMethod]
        public object List_Marca(Inv_MarcaBE obj)
        {
            EntInv_Marca.vnIdMarca = obj.vnIdMarca;
            DataSet dsx = NegInv_Marca.List_Inv_Marca(EntInv_Marca);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_TipoDevice(Inv_TipoDeviceBE obj)
        {
            Ent_TipoDevice.vnIdTipoDevice = obj.vnIdTipoDevice;
            DataSet dsx = Neg_TipoDevice.List_Inv_TipoDevice(Ent_TipoDevice);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Ubicacion(Inv_UbicacionBE obj)
        {
            Ent_Ubicacion.vnIdUbicacion = obj.vnIdUbicacion;
            DataSet dsx = Neg_Ubicacion.List_Inv_Ubicacion(Ent_Ubicacion);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Antivirus(Inv_AntivirusBE obj)
        {
            Ent_Antivirus.vnIdAntivirus = obj.vnIdAntivirus;
            DataSet dsx = Neg_Antivirus.List_Inv_Antivirus(Ent_Antivirus);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Office(Inv_OfficeBE obj)
        {
            Ent_Office.vnIdOffice = obj.vnIdOffice;
            DataSet dsx = Neg_Office.List_Inv_Office(Ent_Office);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Procesador(Inv_ProcesadorBE obj)
        {
            Ent_Procesador.vnIdProcesador = obj.vnIdProcesador;
            DataSet dsx = Neg_Procesador.List_Inv_Procesador(Ent_Procesador);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_SO(Inv_SOBE obj)
        {
            Ent_SO.vnIdSO = obj.vnIdSO;
            DataSet dsx = Neg_SO.List_Inv_SO(Ent_SO);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Device(Inv_DeviceBE obj)
        {
            Ent_Device.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            Ent_Device.vnIdDevice = obj.vnIdDevice;
            Ent_Device.vnIdUsuario = obj.vnIdUsuario;
            DataSet dsx = Neg_Device.ListDevice(Ent_Device);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object Regi_Device(Inv_DeviceBE obj)
        {
            if (obj.vcImg.Contains("data:image/png;base64,") && obj.vcImg != "")
            {
                obj.vImg = "jpg";
            }
            else
            {
                obj.vImg = "";
            }
            Ent_Device.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
             Ent_Device.vnIdDevice  = obj.vnIdDevice;
             Ent_Device.vnIdTipoDevice  = obj.vnIdTipoDevice;
             Ent_Device.vcHostname  = obj.vcHostname;
             Ent_Device.vcCodigo  = obj.vcCodigo;
             Ent_Device.vcSerie  = obj.vcSerie;
             Ent_Device.vnIdMarca  = obj.vnIdMarca;
             Ent_Device.vcModelo  = obj.vcModelo;
             Ent_Device.vnPropiedad  = obj.vnPropiedad;
             Ent_Device.vcObsDev  = obj.vcObsDev;
             Ent_Device.vnDet  = obj.vnDet;
             Ent_Device.vnIdSO  = obj.vnIdSO;
             Ent_Device.vnRam  = obj.vnRam;
             Ent_Device.vnIdProcesador  = obj.vnIdProcesador;
             Ent_Device.vnIdOffice  = obj.vnIdOffice;
             Ent_Device.vnIdAntivirus  = obj.vnIdAntivirus;
             Ent_Device.vcIp  = obj.vcIp;
             Ent_Device.vcMac  = obj.vcMac;
             Ent_Device.vcTeamviwer  = obj.vcTeamviwer;
             Ent_Device.vcAnydesk   = obj.vcAnydesk;
             Ent_Device.vnDetMob  = obj.vnDetMob;
             Ent_Device.vcIMEI  = obj.vcIMEI;
             Ent_Device.vcNumero  = obj.vcNumero;
             Ent_Device.vbAudifonos  = obj.vbAudifonos;
             Ent_Device.vbCargador  = obj.vbCargador;
             Ent_Device.vbCarcasa  = obj.vbCarcasa;
             Ent_Device.vnAsig  = obj.vnAsig;
             Ent_Device.vnIdUsuario  = obj.vnIdUsuario;
             Ent_Device.vnIdResponsable  = obj.vnIdResponsable;
             Ent_Device.vnIdUbicacion  = obj.vnIdUbicacion;
             Ent_Device.vnIdArea  = obj.vnIdArea;
             Ent_Device.vcFechaAsignacion = obj.vcFechaAsignacion;
             Ent_Device.vcObservacion  = obj.vcObservacion;
             Ent_Device.vcUsuario = GetParamCokkie("cd_user");
            DataSet dst = Neg_Device.RegiDevice(Ent_Device);
            //int dsx = NegPersona.RegiPersona(EntPersona);
            DataTable dt = dst.Tables[0];

            string dsx = "";
            dsx = dt.Rows[0]["vnIdDevice"].ToString();

            JavaScriptSerializer serializer = new JavaScriptSerializer();

            var existimg = "";
            if (obj.vcImg.Contains("data:image/png;base64,") && obj.vcImg != "" && dsx != "0")
            {
                string folderPath = Server.MapPath("~/Mod_TI/ImgDevice/");  //Create a Folder in your Root directory on your solution.
                string fileName = dsx + ".jpg";
                string imagePath = folderPath + fileName;

                string base64StringData = obj.vcImg; // Your base 64 string data
                string cleandata = base64StringData.Replace("data:image/png;base64,", "");
                byte[] data = System.Convert.FromBase64String(cleandata);
                MemoryStream ms = new MemoryStream(data);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms);

                img.Save(imagePath, System.Drawing.Imaging.ImageFormat.Jpeg);

                FileInfo file = new FileInfo(imagePath);
                if (file.Exists.Equals(true))
                {
                    existimg = obj.vnIdDevice + ".jpg";
                }
                else
                {
                    existimg = "";
                }
            }
            else
            {
                existimg = "";
            }

            var existimg2 = "";
            if (obj.vcImg2.Contains("data:image/png;base64,") && obj.vcImg2 != "" && dsx != "0")
            {
                string folderPath = Server.MapPath("~/Mod_TI/ImgDevice/");  //Create a Folder in your Root directory on your solution.
                string fileName = dsx + "_.jpg";
                string imagePath = folderPath + fileName;

                string base64StringData = obj.vcImg2; // Your base 64 string data
                string cleandata = base64StringData.Replace("data:image/png;base64,", "");
                byte[] data = System.Convert.FromBase64String(cleandata);
                MemoryStream ms = new MemoryStream(data);
                System.Drawing.Image img = System.Drawing.Image.FromStream(ms);

                img.Save(imagePath, System.Drawing.Imaging.ImageFormat.Jpeg);

                FileInfo file = new FileInfo(imagePath);
                if (file.Exists.Equals(true))
                {
                    existimg2 = obj.vnIdDevice + ".jpg";
                }
                else
                {
                    existimg2 = "";
                }
            }
            else
            {
                existimg2 = "";
            }


            var existfile = "";
            if (obj.vcFile != "" && obj.vExt != "" && dsx != "0")
            {
                string folderPath = Server.MapPath("~/Mod_TI/DocDevice/");
                //string folderPath = Server.MapPath(@"\\172.16.16.16\Nisira File\Fotos_personal\Formatos_sfe\FOT\");

                string fileName = dsx + "." + obj.vExt;
                string FilePath = folderPath + fileName;

                string base64StringData = obj.vcFile;
                byte[] data = System.Convert.FromBase64String(base64StringData);
                MemoryStream ms = new MemoryStream(data);
                FileStream file = new FileStream(FilePath, FileMode.Create, FileAccess.Write);
                ms.WriteTo(file);
                file.Close();
                ms.Close();

                FileInfo filev = new FileInfo(FilePath);

                if (filev.Exists.Equals(true))
                {
                    existfile = fileName;
                }
                else
                {
                    existfile = "0";
                }
            }
            else
            {
                existfile = "0";
            }

            var rpta = new
            {
                rpta = dsx,
                img = existimg,
                file = existfile,
            };
            return serializer.Serialize(rpta);

            //Serializacion
            //JavaScriptSerializer serializer = new JavaScriptSerializer();
            //serializer.MaxJsonLength = Int32.MaxValue;
            //List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            //Dictionary<string, object> row;
            //foreach (DataRow dr in dt.Rows)
            //{
            //    row = new Dictionary<string, object>();
            //    foreach (DataColumn col in dt.Columns)
            //    {
            //        row.Add(col.ColumnName, dr[col]);
            //    }
            //    rows.Add(row);
            //}
            //return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Asignacion(Inv_AsignacionBE obj)
        {
            Ent_Asignacion.vnIdAsignacion = obj.vnIdAsignacion;
            DataSet dsx = Neg_Asignacion.List_Inv_Asignacion(Ent_Asignacion);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object List_Area(Inv_AreaBE obj)
        {
            Ent_InvArea.vnIdArea = obj.vnIdArea;
            DataSet dsx = Neg_InvArea.List_Inv_Area(Ent_InvArea);
            DataTable dt = dsx.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object ConsultarErroresfrio(String d)
        {
            DataSet ds = Neg_Frio_Err.FrioErrorBLConsult();
            DataTable dt = ds.Tables[0];

            JavaScriptSerializer serializar = new JavaScriptSerializer();
            serializar.MaxJsonLength = Int32.MaxValue;

            List<Dictionary<string, object>> lista = new List<Dictionary<string, object>>();
            Dictionary<string, object> row1;

            List<Dictionary<string, object>> lista2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;

            List<Dictionary<string, object>> lista3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;

            List<Dictionary<string, object>> lista4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;

            List<Dictionary<string, object>> lista5 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row5;


            foreach (DataRow dr in dt.Rows)
            {
                row1 = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
                {
                    row1.Add(dc.ColumnName,dr[dc]);
                }
                lista.Add(row1);
            }

            
                DataTable dv1 = ds.Tables[1];

                foreach (DataRow dr in dv1.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dv1.Columns)
                    {
                        row2.Add(dc.ColumnName, dr[dc]);
                    }
                    lista2.Add(row2);
                }


                DataTable dv2 = ds.Tables[2];

                foreach (DataRow dr in dv2.Rows)
                {
                    row3 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dv2.Columns)
                    {
                        row3.Add(dc.ColumnName, dr[dc]);
                    }
                    lista3.Add(row3);
                }

                DataTable dv3 = ds.Tables[3];

                foreach (DataRow dr in dv3.Rows)
                {
                    row4 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dv3.Columns)
                    {
                        row4.Add(dc.ColumnName, dr[dc]);
                    }
                    lista4.Add(row4);
                }


                DataTable dv4 = ds.Tables[4];

                foreach (DataRow dr in dv4.Rows)
                {
                    row5 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dv4.Columns)
                    {
                        row5.Add(dc.ColumnName, dr[dc]);
                    }
                    lista5.Add(row5);
                }

            

            var data = new
            {
                d1 = lista,
                d2 = lista2,
                d3 = lista3,
                d4 = lista4,
                d5 = lista5
            };

            return serializar.Serialize(data);
        }


        [WebMethod]
        public object ConsultarPaleta(string paleta) { 
            DataSet ds = Neg_Frio_Err.FrioErrorBLPalet(paleta);
            DataTable dt = ds.Tables[0];

            List<Dictionary<string, object>> lista = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            List<Dictionary<string, object>> lista2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;

            JavaScriptSerializer serializar = new JavaScriptSerializer();
            serializar.MaxJsonLength = Int32.MaxValue;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
                {
                    row.Add(dc.ColumnName,dr[dc]);
                }
                lista.Add(row);
            }

            if (ds.Tables[1].Rows.Count>0)
            {
                DataTable dt2 = ds.Tables[1];

                foreach (DataRow dr in dt2.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dt2.Columns)
                    {
                        row2.Add(dc.ColumnName, dr[dc]);
                    }
                    lista2.Add(row2);
                }

            }

            var data = new
            {
                a = lista,
                b = lista2
            };

            return serializar.Serialize(data);
        }

        [WebMethod]
        public object EliminarUltimoElemento(string ID, string paleta)
        {
            int x = Neg_Frio_Err.LastDelete(ID, paleta);
            JavaScriptSerializer seria = new JavaScriptSerializer();
            seria.MaxJsonLength = Int32.MaxValue;
            return seria.Serialize(x);
        }

        [WebMethod]
        public object EliminarUltimoElementoMov(string ID, string paleta)
        {
            int x = Neg_Frio_Err.LastDeleteMov(ID, paleta);
            JavaScriptSerializer seria = new JavaScriptSerializer();
            seria.MaxJsonLength = Int32.MaxValue;
            return seria.Serialize(x);
        }

        [WebMethod]
        public object EliminarTodoMovimiento(string ID, string paleta)
        {
            int x = Neg_Frio_Err.EliminarTodoRegistro(ID, paleta);
            JavaScriptSerializer seria = new JavaScriptSerializer();
            seria.MaxJsonLength = Int32.MaxValue;
            return seria.Serialize(x);
        }

        [WebMethod]
        public object EliminarwhenNegativo(int ID, string paleta)
        {
            int x = Neg_Frio_Err.EliminarNegBL(ID, paleta);
            JavaScriptSerializer seria = new JavaScriptSerializer();
            seria.MaxJsonLength = Int32.MaxValue;
            return seria.Serialize(x);

        }
        [WebMethod]
        public object EliminarwhenNegativoMovUbicPaleta(int ID, string paleta)
        {
            int x = Neg_Frio_Err.EliminarmovpalBL(ID, paleta);
            JavaScriptSerializer seria = new JavaScriptSerializer();
            seria.MaxJsonLength = Int32.MaxValue;
            return seria.Serialize(x);

        }
        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }


    }
}
