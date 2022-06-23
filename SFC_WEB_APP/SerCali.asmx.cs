using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Data;
using SFC_BE;
using SFC_BL;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerCali
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerCali : System.Web.Services.WebService
    {
        FormatoDetalleBE EntFormDeta = new FormatoDetalleBE();
        FormatoDetalleBL NegFormDeta = new FormatoDetalleBL();
        ControlNroMuestraBE EntContMues = new ControlNroMuestraBE();
        ControlNroMuestraBL NegContMues = new ControlNroMuestraBL();
        ControlFotoBE EntFoto = new ControlFotoBE();
        ControlFotoBL NegFoto = new ControlFotoBL();
        CalidadReBL calBL = new CalidadReBL();
        ReportCalid ReportBE = new ReportCalid();
        RutasBE RutasBEobj = new RutasBE();
        BorrarFotoBE BorrarAfterBE = new BorrarFotoBE();

        ConsNisiraBE EntNis = new ConsNisiraBE();
        ConsNisiraBL NegNis = new ConsNisiraBL();

        UtilBL negUtil = new UtilBL();

        // instancia para reporte de calidad
        ReporteGeneralCalidadBE EntNisRepGenCalidad = new ReporteGeneralCalidadBE();
        ReporteGeneralCalidadBL NegNisRepGenCalidad = new ReporteGeneralCalidadBL();

        [WebMethod]
        public object ListFormatosCalidad()
        {
            DataSet ds = NegNis.ListFormatosCalidad();
            DataTable dt = ds.Tables[0];
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
        public object ListAlmacenesCalidad(ReportCalid obj)
        {
            ReportBE.vcFormato = obj.vcFormato;
            DataSet ds = calBL.ListAlmacenesCalidad(ReportBE);
            DataTable dt = ds.Tables[0];
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
        public object Rep_Certificado_Calidad(ReportCalid obj)
        {
            ReportBE.vcFormato = obj.vcFormato;
            ReportBE.vcIdAlmacen = obj.vcIdAlmacen;
            ReportBE.vcFechaIni = obj.vcFechaIni;
            ReportBE.vcFechaFin = obj.vcFechaFin;
            ReportBE.vcAppxCultivo = obj.vcAppxCultivo;
            ReportBE.vcPorcentajes = obj.vcPorcentajes;

            DataSet ds = calBL.Rep_Certificado_Calidad(ReportBE);
            DataTable dt = ds.Tables[0];
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
        public object GuardarMuestra(List<ControlNroMuestraDetalleObsBE> List)
        {
            string formats = "dd/MM/yyyy HH:mm";
            string vcFecha = DateTime.Now.ToString("dd/MM/yyyy");
            string filePath = "";
            //
            foreach (var item in List)
            {
                if (item.vnIdTiRow == 1)
                {
                    EntContMues.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(item.vcIdEmpresa));
                    EntContMues.vnIdFormato = item.vnIdFormato;
                    EntContMues.vnIdControl = item.vnIdControl;
                    EntContMues.vnIdMuestra = item.vnIdMuestra;
                    EntContMues.vnIdFoto = item.vnIdFoto;
                    EntContMues.vcObseMuestra = item.vcObseMuestra;
                    filePath = "Fotos/" + item.vcModulo + "/" + DateTime.Now.ToString("yyyy")
                    + "/" + DateTime.Now.ToString("MM") + "/";
                    EntContMues.vcRutaFoto = filePath;
                    EntContMues.vcModulo = item.vcModulo;
                    EntContMues.vdFechaMuestra = DateTime.ParseExact(vcFecha + " " + item.vcFecha, formats, System.Globalization.CultureInfo.InvariantCulture); ;
                    EntContMues.vcUsuario = GetParamCokkie("cd_user"); 
                }
            }
            int IdMuestra = NegContMues.RegiMuestra(EntContMues, List);

            EntContMues.vnIdMuestra = IdMuestra;
            //
            DataSet ds = NegContMues.ListMuestFoto(EntContMues);
            DataTable dt = ds.Tables[0];
            //Serializacion

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                foreach (var item in List)
                {
                    if ((item.vnIdTiRow == 3) && (item.vnIdFotoDeta == Convert.ToInt32(dr[0].ToString())))
                    {
                        bool IsExists = System.IO.Directory.Exists(Server.MapPath("~/") + filePath);
                        if (!IsExists)
                            System.IO.Directory.CreateDirectory(Server.MapPath("~/") + filePath);
                        byte[] imageBytes = Convert.FromBase64String(item.FileString);
                        //System.IO.File.WriteAllBytes(Server.MapPath(dr[1].ToString()), imageBytes);
                        System.IO.File.WriteAllBytes(Server.MapPath("~/") + dr[1].ToString(), imageBytes);
                    }
                }
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
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object ListMuestra(ControlNroMuestraBE obj)
        {
            EntContMues.vnIdEmpresa = Convert.ToInt32(negUtil.Decrypt(obj.vcIdEmpresa));
            EntContMues.vnIdFormato = obj.vnIdFormato;
            EntContMues.vnIdControl = obj.vnIdControl;
            EntContMues.vnIdMuestra = obj.vnIdMuestra;
            DataSet ds = NegContMues.ListMuestra(EntContMues);
            DataTable dt = ds.Tables[0];
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
        public object ListarProveedor_CALI(String fecha_)
        {
            DataSet ds = calBL.RepInspeccion(fecha_);
            DataTable dt = ds.Tables[0];

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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
        public object ListarLote_CALI(string ruc,string fecha_)
        {
            DataSet ds = calBL.RepInspeccion_Lote(ruc, fecha_);
            DataTable dt = ds.Tables[0];

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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
        public object ListarVariedad_CALI()
        {
            DataSet ds = calBL.Variedad_Calidad();
            DataTable dt = ds.Tables[0];

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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
        public object ListarFormatos_CALI()
        {
            DataSet ds = calBL.Variables_Calidad();
            DataTable dt = ds.Tables[0];

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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
        public object MostrargUIAXProveedor(string ruc, string fecha_, string lote_)
        {
            DataSet ds = calBL.MostrargUIAXProveedor(ruc, fecha_, lote_);
            DataTable dt = ds.Tables[0];

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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
        public object MostrarReporte_Cali_Palta(ReportCalid ReporteCalidad)
        {
            ReportBE.vcFecha_proceso = ReporteCalidad.vcFecha_proceso;
            ReportBE.vcFecha_recepcion = ReporteCalidad.vcFecha_recepcion;
            ReportBE.vcRuc = ReporteCalidad.vcRuc;
            ReportBE.vcLote = ReporteCalidad.vcLote;
            ReportBE.vcVariedad = ReporteCalidad.vcVariedad;
            ReportBE.vcFormato = ReporteCalidad.vcFormato;
            ReportBE.vcCultivo = ReporteCalidad.vcCultivo;
            ReportBE.vcGuia = ReporteCalidad.vcGuia;

            DataSet ds = calBL.ReporteBL_Calidad_Palta(ReportBE);
            DataTable dt = ds.Tables[0];


            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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



            //Segunda Tabla
            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();

            //Tercera Tabla
            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();

            //Cuarta Tabla
            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();


            if (ds.Tables[1].Rows.Count > 0)
            {
                DataTable dt1 = ds.Tables[1];
                //SEGUNDA TABLA

                Dictionary<string, object> row2;
                foreach (DataRow dr2 in dt1.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dt1.Columns)
                    {
                        row2.Add(dc.ColumnName, dr2[dc]);
                    }
                    rows2.Add(row2);
                }

                if (ds.Tables[2].Rows.Count > 0)
                {
                    DataTable dt2 = ds.Tables[2];
                    //TERCERA TABLA
                    Dictionary<string, object> row3;
                    foreach (DataRow dr3 in dt2.Rows)
                    {
                        row3 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt2.Columns)
                        {
                            row3.Add(dc.ColumnName, dr3[dc]);
                        }
                        rows3.Add(row3);
                    }
                }

                if (ds.Tables[3].Rows.Count > 0)
                {
                    DataTable dt3 = ds.Tables[3];
                    //TERCERA TABLA
                    Dictionary<string, object> row4;
                    foreach (DataRow dr4 in dt3.Rows)
                    {
                        row4 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt3.Columns)
                        {
                            row4.Add(dc.ColumnName, dr4[dc]);
                        }
                        rows4.Add(row4);
                    }
                }






            }

            var data = new
            {
                d_cab = rows,
                d_guia = rows2,
                d_def = rows3,
                d_obs_def = rows4
            };



            return serializer.Serialize(data);
        }

        [WebMethod]
        public object MostrarReporte_Cali(ReportCalid ReporteCalidad)
        {
            ReportBE.Fecha = ReporteCalidad.Fecha;
            ReportBE.Ruc = ReporteCalidad.Ruc;
            ReportBE.Lote = ReporteCalidad.Lote;
            ReportBE.Variedad = ReporteCalidad.Variedad;
            ReportBE.Formato = ReporteCalidad.Formato;
            ReportBE.Producto = ReporteCalidad.Producto;

            DataSet ds = calBL.ReporteBL_Calidad(ReportBE);
            DataTable dt = ds.Tables[0];


            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
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



            //Segunda Tabla
            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();

            //Tercera Tabla
            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();

            //Cuarta Tabla
            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();

            //Quinta Tabla
            List<Dictionary<string, object>> rows5 = new List<Dictionary<string, object>>();

            //Sexta Tabla
            List<Dictionary<string, object>> rows6 = new List<Dictionary<string, object>>();

            //Septima Tabla
            List<Dictionary<string, object>> rows7 = new List<Dictionary<string, object>>();

            //Octava Tabla
            List<Dictionary<string, object>> rows8 = new List<Dictionary<string, object>>();

            if (ds.Tables[1].Rows.Count > 0)
            {
                DataTable dt1 = ds.Tables[1];
                //SEGUNDA TABLA

                Dictionary<string, object> row2;
                foreach (DataRow dr2 in dt1.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dt1.Columns)
                    {
                        row2.Add(dc.ColumnName, dr2[dc]);
                    }
                    rows2.Add(row2);
                }

                if (ds.Tables[2].Rows.Count > 0)
                {
                    DataTable dt2 = ds.Tables[2];
                    //TERCERA TABLA
                    Dictionary<string, object> row3;
                    foreach (DataRow dr3 in dt2.Rows)
                    {
                        row3 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt2.Columns)
                        {
                            row3.Add(dc.ColumnName, dr3[dc]);
                        }
                        rows3.Add(row3);
                    }
                }

                if (ds.Tables[3].Rows.Count > 0)
                {
                    DataTable dt3 = ds.Tables[3];
                    //TERCERA TABLA
                    Dictionary<string, object> row4;
                    foreach (DataRow dr4 in dt3.Rows)
                    {
                        row4 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt3.Columns)
                        {
                            row4.Add(dc.ColumnName, dr4[dc]);
                        }
                        rows4.Add(row4);
                    }
                }


                if (ds.Tables[4].Rows.Count > 0)
                {
                    DataTable dt4 = ds.Tables[4];
                    //TERCERA TABLA
                    Dictionary<string, object> row5;
                    foreach (DataRow dr5 in dt4.Rows)
                    {
                        row5 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt4.Columns)
                        {
                            row5.Add(dc.ColumnName, dr5[dc]);
                        }
                        rows5.Add(row5);
                    }
                }


                if (ds.Tables[5].Rows.Count > 0)
                {
                    DataTable dt5 = ds.Tables[5];
                    //TERCERA TABLA
                    Dictionary<string, object> row6;
                    foreach (DataRow dr5 in dt5.Rows)
                    {
                        row6 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt5.Columns)
                        {
                            row6.Add(dc.ColumnName, dr5[dc]);
                        }
                        rows6.Add(row6);
                    }
                }

                if (ds.Tables[6].Rows.Count > 0)
                {
                    DataTable dt6 = ds.Tables[6];
                    //TERCERA TABLA
                    Dictionary<string, object> row7;
                    foreach (DataRow dr6 in dt6.Rows)
                    {
                        row7 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt6.Columns)
                        {
                            row7.Add(dc.ColumnName, dr6[dc]);
                        }
                        rows7.Add(row7);
                    }
                }

                if (ds.Tables[7].Rows.Count > 0)
                {
                    DataTable dt7 = ds.Tables[7];
                    //TERCERA TABLA
                    Dictionary<string, object> row8;
                    foreach (DataRow dr7 in dt7.Rows)
                    {
                        row8 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt7.Columns)
                        {
                            row8.Add(dc.ColumnName, dr7[dc]);
                        }
                        rows8.Add(row8);
                    }
                }

            }

            var data = new
            {
                dc = rows,
                dd = rows2,
                df = rows3,
                dr = rows4,
                dg = rows5,
                dt = rows6,
                dp = rows7,
                dfot = rows8
            };



            return serializer.Serialize(data);
        }

        
        [WebMethod]
        public object MostrarReporte_Cali_foto(ReportCalid ReporteCalidad)
        {
            ReportBE.Fecha = ReporteCalidad.Fecha;
            ReportBE.Ruc = ReporteCalidad.Ruc;
            ReportBE.Lote = ReporteCalidad.Lote;
            ReportBE.Variedad = ReporteCalidad.Variedad;
            ReportBE.Formato = ReporteCalidad.Formato;
            ReportBE.Producto = ReporteCalidad.Producto;

            DataSet ds = calBL.ReporteBL_Calidad(ReportBE);
            

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Octava Tabla
            List<Dictionary<string, object>> rows8 = new List<Dictionary<string, object>>();
            
            if (ds.Tables[7].Rows.Count > 0)
            {
                DataTable dt7 = ds.Tables[7];
                
                    Dictionary<string, object> row8;

                    foreach (DataRow dr7 in dt7.Rows)
                        {
                        row8 = new Dictionary<string, object>();
                        foreach (DataColumn dc in dt7.Columns)
                        {
                            //if (dc.ColumnName == "RUTA_FOTO_1")
                            //{
                               //string x = Convert.ToBase64String(System.IO.File.ReadAllBytes(dr7[dc].ToString()));
                               //row8.Add(dc.ColumnName, dr7[dc]);
                            //}
                            //else
                            //{
                                row8.Add(dc.ColumnName, dr7[dc]);
                            //}    
                        }
                        rows8.Add(row8);
                    }
            }

            return serializer.Serialize(rows8);
        }


        [WebMethod]
        public object MostrarReporte_Cali_foto_Palta(ReportCalid ReporteCalidad)
        {
            ReportBE.vcFecha_proceso = ReporteCalidad.vcFecha_proceso;
            ReportBE.vcFecha_recepcion = ReporteCalidad.vcFecha_recepcion;
            ReportBE.vcRuc = ReporteCalidad.vcRuc;
            ReportBE.vcLote = ReporteCalidad.vcLote;
            ReportBE.vcVariedad = ReporteCalidad.vcVariedad;
            ReportBE.vcFormato = ReporteCalidad.vcFormato;
            ReportBE.vcCultivo = ReporteCalidad.vcCultivo;
            ReportBE.vcGuia = ReporteCalidad.vcGuia;

            DataSet ds = calBL.ReporteBL_Calidad_Palta(ReportBE);


            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Octava Tabla
            List<Dictionary<string, object>> rows8 = new List<Dictionary<string, object>>();

            if (ds.Tables[3].Rows.Count > 0)
            {
                DataTable dt4 = ds.Tables[3];

                Dictionary<string, object> row8;

                foreach (DataRow dr7 in dt4.Rows)
                {
                    row8 = new Dictionary<string, object>();
                    foreach (DataColumn dc in dt4.Columns)
                    {
                        //if (dc.ColumnName == "RUTA_FOTO_1")
                        //{
                        //string x = Convert.ToBase64String(System.IO.File.ReadAllBytes(dr7[dc].ToString()));
                        //row8.Add(dc.ColumnName, dr7[dc]);
                        //}
                        //else
                        //{
                        row8.Add(dc.ColumnName, dr7[dc]);
                        //}    
                    }
                    rows8.Add(row8);
                }
            }

            return serializer.Serialize(rows8);
        }
        [WebMethod]
        public object BorrarFoto(BorrarFotoBE obj)
        {
            BorrarAfterBE.fecha = obj.fecha;
            BorrarAfterBE.Ruc = obj.Ruc;
            BorrarAfterBE.Lote = obj.Lote;
            BorrarAfterBE.Variedad = obj.Variedad;
            BorrarAfterBE.Formato = obj.Formato;
            BorrarAfterBE.Producto = obj.Producto;



            BorrarAfterBE.ruta = obj.ruta;

            BorrarAfterBE.idfoto = obj.idfoto;

            int x = 0;

            try
            {
                if (!string.IsNullOrEmpty(BorrarAfterBE.ruta))
                {
                    System.IO.File.Delete(BorrarAfterBE.ruta);
                }

                x = calBL.SetearImageAfterDelete(BorrarAfterBE);

            }
            catch (Exception e)
            {

                throw;
            }

            return x;

        }

        [WebMethod]
        public string[] ConvertirFotobase64(RutasBE obj)
        {
            string[] base64 = new string[3];

            RutasBEobj.ruta1 = obj.ruta1;
            RutasBEobj.ruta2 = obj.ruta2;
            RutasBEobj.ruta3 = obj.ruta3;
            if (!string.IsNullOrEmpty(obj.ruta1))
            {
                byte[] img1 = System.IO.File.ReadAllBytes(RutasBEobj.ruta1);
                string b1 = Convert.ToBase64String(img1);
                base64[0] = b1;

            }
            if (!string.IsNullOrEmpty(obj.ruta2))
            {
                byte[] img2 = System.IO.File.ReadAllBytes(RutasBEobj.ruta2);
                string b2 = Convert.ToBase64String(img2);
                base64[1] = b2;

            }
            if (!string.IsNullOrEmpty(obj.ruta3))
            {
                byte[] img3 = System.IO.File.ReadAllBytes(RutasBEobj.ruta3);
                string b3 = Convert.ToBase64String(img3);
                base64[2] = b3;

            }

            return base64;
        }

        [WebMethod]
        public int Subir(FotosCalidadBE obj)
        {
            int x = 0;
            if ((obj.ITres64Cab.Contains("data:image/jpeg;base64,") || obj.IDos64Cab.Contains("data:image/jpeg;base64,") || obj.IUno64Cab.Contains("data:image/jpeg;base64,")) && obj.IUno64Cab != "")
            {
                string name_fotouno = obj.IUnoCabName;
                string name_fotodos = obj.IDosCabName;
                string name_fototres = obj.ITresCabname;

                //string rutatemp1 = "";
                //string rutatemp2 = "";
                //string rutatemp3 = "";

                string[] rutas = new string[] { "", "", "" };

                ////limpiado campo
                //if (obj.IUno64Cab.Contains("Calidad_ESUN"))
                //{
                //    rutatemp1 = obj.IUno64Cab;
                //    obj.IUno64Cab = "";
                //}
                //if (obj.IDos64Cab.Contains("Calidad_ESUN"))
                //{
                //    rutatemp2 = obj.IDos64Cab;
                //    obj.IDos64Cab = "";
                //}
                //if (obj.ITres64Cab.Contains("Calidad_ESUN"))
                //{
                //    rutatemp3 = obj.ITres64Cab;
                //    obj.ITres64Cab = "";
                //}


                if (obj.IUnoCabName!=null && !obj.IUno64Cab.Contains("Calidad_ESUN"))
                {
                    name_fotouno = obj.Ide.ToString() + "-" + "1" + "-" + obj.IUnoCabName + ".jpg";
                    rutas[0] = Path.Combine(@"\\SFE-IDC.sunfruitscorp.com\Nisira File\Calidad_ESUN", name_fotouno);

                }
                if (obj.IDosCabName != null && !obj.IDos64Cab.Contains("Calidad_ESUN"))
                {
                    name_fotodos = obj.Ide.ToString() + "-" + "2" + "-" + obj.IDosCabName + ".jpg";
                    rutas[1] = Path.Combine(@"\\SFE-IDC.sunfruitscorp.com\Nisira File\Calidad_ESUN", name_fotodos);

                }
                if (obj.ITresCabname != null && !obj.ITres64Cab.Contains("Calidad_ESUN"))
                {
                    name_fototres = obj.Ide.ToString() + "-" + "3" + "-" + obj.ITresCabname + ".jpg";
                    rutas[2] = Path.Combine(@"\\SFE-IDC.sunfruitscorp.com\Nisira File\Calidad_ESUN", name_fototres);
                }

           
                for (int i = 0; i < rutas.Length; i++)
                {
                    if (!string.IsNullOrEmpty(rutas[i]))
                    {
                        if (File.Exists(rutas[i]))
                        {
                            File.Delete(rutas[i]);
                        }
                    }
                  
                }

                string base64fotouno = obj.IUno64Cab;
                string base64fotodos = obj.IDos64Cab;
                string base64fototres = obj.ITres64Cab;

                string[] base64 = new string[3];
                base64[0] = base64fotouno;
                base64[1] = base64fotodos;
                base64[2] = base64fototres;

                string cleandata = "";


                for (int i = 0; i < base64.Length; i++)
                {
                    cleandata = "";
                    if (!string.IsNullOrWhiteSpace(base64[i]))
                    {
                        if (base64[i].Contains("data:image/png;base64,"))
                        {
                            cleandata = base64[i].Replace("data:image/png;base64,", "");
                        }
                        else
                        {
                            cleandata = base64[i].Replace("data:image/jpeg;base64,", "");
                        }
                        if (!base64[i].Contains("Calidad_ESUN"))
                        {
                              byte[] data = Convert.FromBase64String(cleandata);
                        MemoryStream ms = new MemoryStream(data);
                        Image img = Image.FromStream(ms);

                        using (Image watermarkImage = Image.FromFile(@"\\SFE-IDC.sunfruitscorp.com\Nisira File\watermarkImage\logo.png"))
                        using (Graphics imageGraphics = Graphics.FromImage(img))
                        using (TextureBrush watermarkBrush = new TextureBrush(watermarkImage))
                        {
                            int xx = (img.Width / 10 - watermarkImage.Width / 10);
                            int yy = (img.Height / 10 - watermarkImage.Height / 10);
                            watermarkBrush.TranslateTransform(xx, yy);
                            imageGraphics.FillRectangle(watermarkBrush, new Rectangle(new Point(xx, yy), new Size(watermarkImage.Width + 1, watermarkImage.Height)));
                            img.Save(rutas[i], System.Drawing.Imaging.ImageFormat.Jpeg);

                        }
                        }
                      
                    }
                   
                   


                }

                x = calBL.InsertaImagenes(rutas[0], rutas[1], rutas[2]);

            }
            return x;
        }

        [WebMethod]
        public object MostrarVariedadp(string fecha,string productor,string lote)
        {
            DataSet ds = calBL.VariedadP_Calidad(fecha,productor,lote);
            DataTable dt = ds.Tables[0];
            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
            Dictionary<string, object> row;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
                {
                    row.Add(dc.ColumnName, dr[dc]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        [WebMethod]
        public object CopiarArchivo(string p,string name)
        {
           string d = calBL.CopiararchivoBL(p,name);
           return d;
        }

        [WebMethod]
        public object InsertarObservacionesCalidad(GBusquedaBE obj)
        {
            DataSet ds = calBL.InsertarObservacionesCalidadBL(obj);
            DataTable dt = ds.Tables[0];

            //Serializacion
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            serializer.MaxJsonLength = Int32.MaxValue;

            //Lista que contiene un diccionario de datos que convierte object en String
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

            //Convertimos object en String
            Dictionary<string, object> row;

            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
                {
                    row.Add(dc.ColumnName, dr[dc]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }

        public string GetParamCokkie(string Param)
        {
            HttpCookie GetCookie = Context.Request.Cookies["eSunUser"];
            string Value = GetCookie[Param].ToString();
            return Value;
        }

        //funcion para listar sucursakl.
        [WebMethod]
        public object SER_listar_sucursal(ReporteGeneralCalidadBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegNisRepGenCalidad.BL_listar_sucursal(EntNisRepGenCalidad);
            DataTable dt = dsx.Tables[0];
            //
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

        //funcion para listar variables.
        [WebMethod]
        public object SER_listar_variable(ReporteGeneralCalidadBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegNisRepGenCalidad.BL_listar_variable(EntNisRepGenCalidad);
            DataTable dt = dsx.Tables[0];
            //
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

        //funcion para listar reportes.
        [WebMethod]
        public object SER_listar_reporte(ReporteGeneralCalidadBE obj)
        {
            // receptionamos las varaiables.
            DataSet dsx = NegNisRepGenCalidad.BL_listar_reporte(EntNisRepGenCalidad);
            DataTable dt = dsx.Tables[0];
            //
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

        //funcion para listar reporte general.
        [WebMethod]
        public object SER_listar_reporte_general(ReporteGeneralCalidadBE obj)
        {
            // receptionamos las varaiables.
            EntNisRepGenCalidad.REPORTE_ID_SUCURSAL = obj.REPORTE_ID_SUCURSAL;
            EntNisRepGenCalidad.REPORTE_ID_VARIABLE = obj.REPORTE_ID_VARIABLE;
            EntNisRepGenCalidad.REPORTE_DESDE = obj.REPORTE_DESDE;
            EntNisRepGenCalidad.REPORTE_HASTA = obj.REPORTE_HASTA;
            EntNisRepGenCalidad.REPORTE_ID_REPORTE = obj.REPORTE_ID_REPORTE;

            DataSet dsx = NegNisRepGenCalidad.BL_listar_reporte_general(EntNisRepGenCalidad);
            DataTable dt = dsx.Tables[0];
            //
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
    }
}
