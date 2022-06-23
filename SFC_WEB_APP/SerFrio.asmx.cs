using SFC_BE;
using SFC_BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace SFC_WEB_APP
{
    /// <summary>
    /// Descripción breve de SerFrio
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class SerFrio : System.Web.Services.WebService
    {

        private FrioBL objFrioasmx = new FrioBL();
        private FrioZonBE objFriobe = new FrioZonBE();


        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]

        public object MostrarCamaras_Reporte()
        {
            DataSet da = objFrioasmx.MostrarCamara_ReporteBL();
            DataTable dt = da.Tables[0];
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
        public object MostrarRacks_Reporte(String camara)
        {

            DataSet da = objFrioasmx.MostrarRacks_ReporteBL(camara);
            DataTable dt = da.Tables[0];
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
        public object MostrarPiso_Reporte(String rack)
        {

            DataSet da = objFrioasmx.MostrarPiso_ReporteBL(rack);
            DataTable dt = da.Tables[0];
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
        public object MostrarStock(string fecha)
        {
            DataSet ds = objFrioasmx.MostrarStock_BL(fecha);
            DataTable dt = ds.Tables[4];
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
        public object MostrarDataTable_Reporte(FrioZonBE objZonificacion)
        {
            objFriobe.empresa = objZonificacion.empresa;
            objFriobe.camara = objZonificacion.camara;
            objFriobe.rack = objZonificacion.rack;
            objFriobe.piso = objZonificacion.piso;
            objFriobe.fila = objZonificacion.fila;
            objFriobe.columna = objZonificacion.columna;

            DataSet da = objFrioasmx.MostrarReporte_BL(objFriobe);
            DataTable dt = da.Tables[0];
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

            List<Dictionary<string, object>> rows2 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row2;

            List<Dictionary<string, object>> rows3 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row3;

            List<Dictionary<string, object>> rows4 = new List<Dictionary<string, object>>();
            Dictionary<string, object> row4;

            if (da.Tables[1].Rows.Count > 0)
            {
                DataTable dv = da.Tables[1];
                foreach (DataRow ds in dv.Rows)
                {
                    row2 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv.Columns)
                    {
                        row2.Add(col.ColumnName, ds[col]);
                    }
                    rows2.Add(row2);
                }

                DataTable dv2 = da.Tables[2];
                foreach (DataRow ds in dv2.Rows)
                {
                    row3 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv2.Columns)
                    {
                        row3.Add(col.ColumnName, ds[col]);
                    }
                    rows3.Add(row3);
                }


                //Racks Inhabilitados
                DataTable dv3 = da.Tables[3];
                foreach (DataRow ds in dv3.Rows)
                {
                    row4 = new Dictionary<string, object>();
                    foreach (DataColumn col in dv3.Columns)
                    {
                        row4.Add(col.ColumnName, ds[col]);
                    }
                    rows4.Add(row4);
                }

            }
            else
            {
                row2 = new Dictionary<string, object>();
                row2.Add("", "");
                rows2.Add(row2);
                row3 = new Dictionary<string, object>();
                row3.Add("", "");
                rows3.Add(row3);
                row4 = new Dictionary<string, object>();
                row4.Add("", "");
                rows4.Add(row4);
            }

            var data = new
            {
                dd = rows,
                dt = rows2,
                df = rows3,
                ci = rows4
            };

            return serializer.Serialize(data);
        }

        [WebMethod]
        public object Validaestadopaleta(string Numpaleta)
        {
            string da = objFrioasmx.MostrarEstadoPaleta_BL(Numpaleta);
            return da;
        }

    }
}
