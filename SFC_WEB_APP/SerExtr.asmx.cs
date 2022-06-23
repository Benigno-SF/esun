using Newtonsoft.Json;
using SFC_BE;
using SFC_BL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace SFC_WEB_APP
{
    public class aux_SerExtr_fila 
    {
        public string id { get; set; } //idprovision
        public string idp { get; set; } //iddatoprovision
        public string idfam { get; set; }  //idfamilia
        public string codigo { get; set; }
        public string descripcion { get; set; }
        public List<object> columnas { get; set; }
    }

    /// <summary>
    /// Realiza una consulta a: PrevisionesComprasLeerEntradasPorDia
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [ScriptService]
    public class SerExtr : WebService
    {
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<object> PrevisionesComprasLeerEntradasPorDia(PrevisionesComprasBE obj)
        {
            int dias = (obj.fechaFinal - obj.fechaInicial).Days + 1;

            List<object> t_columnas = new List<object>();
            List<object> t_filas = new List<object>();
            List<object> t_cabeceras = new List<object>();

            PrevisionesComprasBL previsionesCompras = new PrevisionesComprasBL();
            DataTable dt = previsionesCompras.PrevisionesComprasLeerEntradasPorDia(obj).Tables[0];
            JavaScriptSerializer serializer = new JavaScriptSerializer();
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

            //return serializer.Serialize(t_columnas);

            for (int i = 0; i < dias; i++)
            {
                t_cabeceras.Add(obj.fechaInicial.AddDays(i).ToShortDateString());
            }



            //Busqueda de familias
            string id_familia = string.Empty;
            List<aux_SerExtr_fila> t_filas_0 = new List<aux_SerExtr_fila>();
            foreach (var item in rows)
            {
                if (item["Id_Familia"].ToString() != id_familia)
                {
                    aux_SerExtr_fila r_fila = new aux_SerExtr_fila();
                    r_fila.id = item["IdPrevision"].ToString();
                    r_fila.idp = item["Id_DatoPrevision"].ToString();
                    r_fila.idfam = item["Id_Familia"].ToString();
                    r_fila.codigo = item["CodigoFamilia"].ToString();
                    r_fila.descripcion = item["NombreFamilia"].ToString();
                    r_fila.columnas = null;
                    t_filas_0.Add(r_fila);
                    id_familia = item["Id_Familia"].ToString();
                }
            }

            string ala0 = string.Empty;

            // Recorrer por familia
            foreach (var fam in t_filas_0)
            {
                /*s
                    Id_UnidadMedida     <> idum
                    Fecha               <> fe
                    Unidades            <> un
                */


                t_columnas = new List<object>();

                ala0 += "##";
                for (int i = 0; i < dias; i++)
                {
                    var ob = new { idum = "", fe = "00-00-0000", un = "", umc = "", id="" };
                    string ala1 = " - (" + (i + 1).ToString() + "-NO)";
                    foreach (var item in rows)
                    {
                        string ddd = item["CabeceraTemporal"].ToString();

                        if ((Convert.ToDateTime(item["CabeceraTemporal"].ToString()) == obj.fechaInicial.AddDays(i)) && (item["CodigoFamilia"].ToString() == fam.codigo))
                        {
                            string fe = item["CabeceraTemporal"].ToString();
                            fe = fe.Replace(" 00:00:00", "");
                            fe = fe.Replace("/", "-");

                            ob = new { idum = item["Id_UnidadMedida"].ToString(), fe = fe, un = item["Unidades"].ToString(), umc = item["UnidadMedidaCodigo"].ToString(), id = item["Id_DatoPrevision"].ToString() };
                            ala1 = " - (" + (i + 1).ToString() + "-"+ item["Unidades"].ToString() + ")";
                            break;
                        }
                    }
                    ala0 += ala1;
                    t_columnas.Add(ob);
                }
                fam.columnas = t_columnas;
            }

            List<object> r = new List<object>();

            r.Add(new { 
                finicio = (DateTime.Now).ToString(),
                ffin = DateTime.Now.ToString(),
                contenido = t_filas_0,
                cantcol = t_columnas.Count,
                cabeceras = t_cabeceras
            });

            return r;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string FamiliasArticulo() 
        {
            List<object> res = new List<object>();

            for (int i = 0; i < 20; i++)
            {
                res.Add(new { codigo = "00"+i.ToString(), nombre = "Nombre 00" + i.ToString(), codigofsuperior = "00" + i.ToString(), nombrefsuperior = "Nombre superior " + i.ToString() });
            }

            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(res);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int PrevisionesCompras_Guardar(object objs)
        {
            int estado = 0;
            try
            {
                Dictionary<string, object> parametro = (Dictionary<string, object>)objs;
                var contenido = parametro["contenido"];
                var eliminados = parametro["eliminados"];

                var econtenido = ((IEnumerable)contenido).Cast<object>().ToList();
                var eeliminados = ((IEnumerable)eliminados).Cast<string>().ToList();

                List<string> ele = new List<string>();
                foreach (var iteme in eeliminados)
                {
                    ele.Add(iteme.ToString());
                }

                foreach (Dictionary<string, object> item in econtenido)
                {
                    PrevisionesComprasBL previsionesComprasBL = new PrevisionesComprasBL();
                    if (ele.Contains(item["Id"].ToString()))
                    {
                        previsionesComprasBL.Eliminar(item["Id"].ToString());
                    }
                    else
                    {
                        PrevisionesComprasCabeceraBE cab = new PrevisionesComprasCabeceraBE();
                        cab.Id = 0;
                        cab.Id_Almacen = 0;
                        cab.Id_FamiliaArticulo = 0;
                        cab.Id_Proveedor = 0;
                        cab.Detalles = new List<PrevisionesComprasDetalleBE>();

                        if (item["Id"].ToString() != string.Empty) { cab.Id = Convert.ToInt32(item["Id"]); } else { cab.Id = 0; }
                        if (item["Id_Almacen"].ToString() != string.Empty) { cab.Id_Almacen = Convert.ToInt32(item["Id_Almacen"]); } else { cab.Id_Almacen = 0; }
                        if (item["Id_FamiliaArticulo"].ToString() != string.Empty) { cab.Id_FamiliaArticulo = Convert.ToInt32(item["Id_FamiliaArticulo"]); } else { cab.Id_FamiliaArticulo = 0; }
                        if (item["Id_proveedor"].ToString() != string.Empty) { cab.Id_Proveedor = Convert.ToInt32(item["Id_proveedor"]); } else { cab.Id_Proveedor = 0; }

                        var detalle = ((IEnumerable)item["Detalles"]).Cast<object>().ToList();

                        List<PrevisionesComprasDetalleBE> det = new List<PrevisionesComprasDetalleBE>();
                        foreach (Dictionary<string, object> item0 in detalle)
                        {
                            PrevisionesComprasDetalleBE det_item = new PrevisionesComprasDetalleBE();

                            det_item.Id = 0;
                            det_item.fecha = string.Empty;
                            det_item.Id_PrevisionCompras = 0;
                            det_item.Id_UnidadMedida = 0;
                            det_item.Unidades = string.Empty;

                            if (item0["Id"].ToString() != string.Empty) { det_item.Id = Convert.ToInt32(item0["Id"].ToString()); }
                            if (item0["Id_PrevisionCompras"].ToString() != string.Empty) { det_item.Id_PrevisionCompras = Convert.ToInt32(item0["Id_PrevisionCompras"].ToString()); }
                            if (item0["Fecha"].ToString() != string.Empty) { det_item.fecha = item0["Fecha"].ToString(); }
                            if (item0["Id_UnidadMedida"].ToString() != string.Empty) { det_item.Id_UnidadMedida = Convert.ToInt32(item0["Id_UnidadMedida"].ToString()); }
                            if (item0["Unidades"].ToString() != string.Empty) { det_item.Unidades = item0["Unidades"].ToString(); }

                            det.Add(det_item);
                        }
                        previsionesComprasBL.Guardar(cab, det);
                    }
                }
                estado = 1;
            }
            catch (Exception)
            {
                estado = 0;
            }

            return estado;
        }

        


        //Pasará una lista de objetos modificados, se validaran los registros y se cambiaran
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int PrevisionesComprasLeerEntradasPorDia_Guardar(List<DatosPrevisionComprasBE> objs)
        {
            return 0;
            //DatosPrevisionComprasBE
            // aqui el algoritmo debe calcular a que campo insertar, debe crear un objeto adecuado y pasarle a update

            // sugerencia
            // falta validar si el objeto a modificar pertenece a la conexión en el sistema
            // en el caso de que corresponda a la conexion actual, guardar elemento por elemento
            // si no coreesponde reemplazar con elmento vacio para no modificar los valores
            // finalmente Realizar la inserción de los registros
            // Determinar el numero de filas y trabajar en funcion a eso

            int estado;
            
            DatosPrevisionComprasBL datosPrevisionComprasBL = new DatosPrevisionComprasBL();
            try
            {
                foreach (var item in objs)
                {
                    if (item.Id_UnidadMedida == -1 || Convert.ToDecimal(item.Unidades) < 0)
                    {

                    }
                    else if (item.Id_UnidadMedida == -1 && Convert.ToDecimal(item.Unidades) < 0)
                    {

                    }
                    else
                    {
                        if (item.Id == 0)//insertar
                        {
                            datosPrevisionComprasBL.InsertDatosPrevisionCompras(item);
                        }
                        else//actualizar
                        {
                            datosPrevisionComprasBL.UpdateDatosPrevisionCompras(item);
                        }
                    }
                }
                estado = 1;
            }
            catch (Exception)
            {
                estado = -1;
            }
            return estado;
        }



        //Devuelve la lista de unidades de medida
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object UnidadesMedida()
        {
            DataSet ds = new UnidadMedidaBL().ListUnidadesMedida();
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

        //Devuelve la lista de familias para previsiones
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public object FamiliasPrevisiones()
        {
            DataSet ds = new FamiliasArticuloBL().Listado();
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
    }
}
