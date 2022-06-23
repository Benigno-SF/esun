using SFC_BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.ModelBinding;

namespace SFC_DAO
{
    public class ReporteSotcksDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListaBD_ERPHispatec__Articulos(ReporteSotcksBE e)
        {
            string strFecha = e.Fecha;
            string[] arrFecha = null;
            if (strFecha.Contains("/"))
            {
                arrFecha = strFecha.Split('/');
                strFecha = arrFecha[2] + "-" + arrFecha[1] + "-" + arrFecha[0];
            }
            DateTime date1 = Convert.ToDateTime(strFecha);
            cnx = con.conectar();

            da = new SqlDataAdapter("SP_ReporteSotcks", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.SelectCommand.Parameters.Add(new SqlParameter("@Fechahasta", e.Fecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Empresa", e.IdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Bdatos", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        
        public DataSet ReporteStockHipatec(ReporteSotcksBE e)
        {
            string[] var_codigoalmacen = e.IdAlmacen.Split('_');
            string[] var_fecha = e.Fecha.Split('/');
            string IdEmpresa = "";

            if (e.IdEmpresa == "1")
            {
                IdEmpresa = "4";
            }
            else if(e.IdEmpresa == "2")
            {
                IdEmpresa = "7";
            }
            //bUSCAR EL ALMACEN EQUIVALENTE 

            DataSet dsx = new DataSet();
            cnx = con.conectar();
            string sql = @"";
            sql += " declare " + Environment.NewLine;
            sql += " @empresa nvarchar(10) = '" + e.IdEmpresa + "', " + Environment.NewLine;
            sql += " @ID_SUCURSAL nvarchar(10) = '" + var_codigoalmacen[0] + "', " + Environment.NewLine;
            sql += " @ID_ALMACEN nvarchar(10) = '" + var_codigoalmacen[0] + "', " + Environment.NewLine;
            sql += " @codigo nvarchar(15), " + Environment.NewLine;
            sql += " @IdAlmacenHispatec nvarchar(15); " + Environment.NewLine;
            sql += "  " + Environment.NewLine;
            sql += " IF @empresa = '1' " + Environment.NewLine;
            sql += " BEGIN " + Environment.NewLine;
            sql += "  SELECT @codigo = codigo FROM eq_Almacenes WHERE N_IDSUCURSAL_SFE = @ID_SUCURSAL AND  N_IDALMACEN_SFE = @ID_ALMACEN " + Environment.NewLine;
            sql += " END " + Environment.NewLine;
            sql += " ELSE IF @empresa = '2' " + Environment.NewLine;
            sql += " BEGIN " + Environment.NewLine;
            sql += "  SELECT @codigo = codigo FROM eq_Almacenes WHERE N_IDSUCURSAL_SFP = @ID_SUCURSAL AND  N_IDALMACEN_SFP = @ID_ALMACEN; " + Environment.NewLine;
            sql += " END " + Environment.NewLine;
            sql += "  " + Environment.NewLine;
            sql += " select @IdAlmacenHispatec=Id from ERPHispatec.dbo.Almacenes where Codigo = @codigo; " + Environment.NewLine;
            sql += "  " + Environment.NewLine;
            sql += " exec [SFI-DAT\\PROD].[ERPHispatec].dbo.CLI230_ObtenerDatosInformeInventario @IdAlmacen=@IdAlmacenHispatec,@IdAlmacenHasta=@IdAlmacenHispatec,@XmlAlmacenes='<ROOT></ROOT>',@IdsActividadesNegocio='56, ',@ArticuloDesde=NULL,@ArticuloHasta=NULL,@XmlArticulos='<ROOT></ROOT>',@FamiliaDesde=NULL,@FamiliaHasta=NULL,@XmlFamilias='<ROOT></ROOT>',@EstadoArticulos=NULL,@fecha='" + var_fecha[2] + "-" + var_fecha[1] + "-" + var_fecha[0] + " 00:00:00',@IdGrpEmp=1,@TipoValoracion='UltimoPrecio',@idTarifaVenta=0,@idDivisa=7,@fechaET='" + var_fecha[2] + "-" + var_fecha[1] + "-" + var_fecha[0] + " 00:00:00',@ID_EMPRESA="+IdEmpresa+ ",@id_Centro=3,@OpcEntorno=1 " + Environment.NewLine;
            da = new SqlDataAdapter(sql, cnx);
            da.SelectCommand.CommandType = CommandType.Text;

            

            /*
            cnx.Open();
            SqlCommand sqlCommand = new SqlCommand(@"exec [SFI-DOC\PROD].[SUNFRUITS].dbo.objreportes_Saldosalmacen '001',' ',' ','20200930','','','','','ADMINISTRADOR'" + Environment.NewLine, cnx);
            var reader = sqlCommand.ExecuteReader();
            var schemaTable = reader.GetSchemaTable();
            string coxn = string.Empty;
            string coxn2 = string.Empty;

            // Esta parte reconstruye las longitud y tipo del resultado de un sp bloqueado 
            // Se concatena se guarda en una cadena para tratarlo como csv

            foreach (DataColumn item in schemaTable.Columns)
            {
                coxn += item.ColumnName + ",";
            }
            coxn += Environment.NewLine;
            int ss = 0;
            foreach (DataRow item in schemaTable.Rows)
            {
                string tipo = string.Empty;
                string nullablxe = string.Empty;
                if ("True" == item.ItemArray[13].ToString())
                {
                    nullablxe = " null,";
                }
                else
                {
                    nullablxe = ",";
                }
                if (item.ItemArray[24].ToString() == "datetime")
                {
                    coxn2 += item.ItemArray[0] + " " + item.ItemArray[24] + nullablxe + Environment.NewLine;

                }
                else if (item.ItemArray[24].ToString() == "decimal")
                {
                    coxn2 += item.ItemArray[0] + " " + item.ItemArray[24] + "(" + item.ItemArray[3] + "," + item.ItemArray[4] + ")" + nullablxe + Environment.NewLine;
                }
                else
                {
                    coxn2 += item.ItemArray[0] + " " + item.ItemArray[24] + "(" + item.ItemArray[2] + ")" + nullablxe + Environment.NewLine;
                }

                coxn += Environment.NewLine;
                ss++;
            }
            coxn += Environment.NewLine;
            
            */





            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ReferenciaNISIRAHISPATEC(ReporteSotcksBE e)
        {
            DataSet dsx = new DataSet();
            cnx = con.conectar();
            string sql = @"SELECT IDPRODUCTO, IDPRODUCTO_A, IDPRODUCTO_P, codigo FROM NIS_PRODUCTOS WITH(NOLOCK) WHERE nidempresa = " + e.IdEmpresa;
            da = new SqlDataAdapter(sql, cnx);
            da.SelectCommand.CommandType = CommandType.Text;
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ReporteStockNisira(ReporteSotcksBE e)
        {
            string[] p_fecha = e.Fecha.Split('/');

            DataSet dsx = new DataSet();
            if (e.IdEmpresa == "1")
            {
                cnx = con.conectar();
                string sql = @"exec [SFI-DOC\PROD].[SUNFRUITS].dbo.objreportes_Saldosalmacen '001',' ',' ','" + p_fecha[2] + p_fecha[1] + p_fecha[0] + "','','','','','ADMINISTRADOR'";
                da = new SqlDataAdapter(sql, cnx);
                da.SelectCommand.CommandType = CommandType.Text;
                da.Fill(dsx, "get");
                cnx.Close();
            }
            else if (e.IdEmpresa == "2")
            {
                cnx = con.conectar();
                string sql = @"exec [SFI-DOC\PROD].[SUNFRUITS_PACKS].dbo.objreportes_Saldosalmacen '001',' ',' ','" + p_fecha[2] + p_fecha[1] + p_fecha[0] + "','','','','','ADMINISTRADOR'";
                da = new SqlDataAdapter(sql, cnx);
                da.SelectCommand.CommandType = CommandType.Text;
                da.Fill(dsx, "get");
                cnx.Close();
            }

            return dsx;
        }

        public DataSet ListaAlmacenes(int empresa)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_AlmacenPorEmpresa", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Empresa", empresa));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        /// <summary>
        /// Devuelve el almacen en HIPATEC, dependiendo del almacen en NISIRA, LOS PARAMETROS SON UNA REFERENCIA DE NISIRA
        /// </summary>
        /// <param name="IDEMPRESA"></param>
        /// <param name="IDSUCURSAL"></param>
        /// <param name="IDALMACEN"></param>
        /// <returns></returns>
        public DataSet AlmacenHISPATEC(int IDEMPRESA, string IDSUCURSAL, string IDALMACEN)
        {
            //IDEMPRESA, define la base de datos
            cnx = con.conectar();
            string sql = string.Empty;
            if (IDEMPRESA == 1)
            {
                if ((IDSUCURSAL.Trim() != string.Empty) && IDALMACEN.Trim() != string.Empty)
                {
                    sql = @"SELECT codigo FROM [SFI-DAT\PROD].SFTI.dbo.eq_Almacenes WHERE N_IDSUCURSAL_SFE = '" + IDSUCURSAL + "' AND N_IDALMACEN_SFE = '" + IDALMACEN + "';";
                }
            }
            else if (IDEMPRESA == 2)
            {
                if ((IDSUCURSAL.Trim() != string.Empty) && IDALMACEN.Trim() != string.Empty)
                {
                    sql = @"SELECT codigo FROM [SFI-DAT\PROD].SFTI.dbo.eq_Almacenes WHERE N_IDSUCURSAL_SFP = '" + IDSUCURSAL + "' AND N_IDALMACEN_SFP = '" + IDALMACEN + "';";
                }
            }
            
            da = new SqlDataAdapter(sql, cnx);
            da.SelectCommand.CommandType = CommandType.Text;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
