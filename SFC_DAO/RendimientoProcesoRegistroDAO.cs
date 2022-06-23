using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class RendimientoProcesoRegistroDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;


        public int DelRendimientoProcesoRegistro(RendimientoProcesoRegistroBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_RendimientoProcesoRegistro_Del", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnReturn = 1;
            }
            catch (Exception ed)
            {
                string mbox = ed.ToString();
                vnReturn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }

        public DataSet Comparaciontickets(RendimientoProcesoRegistroBE e)
        {
            string[] fech = e.vcIdCodigoGeneral.Split('-');
            string fech1 = fech[0] + "-" + fech[1] + "-" + fech[2] + " 00:00:00.000";
            string fech2 = fech[0] + "-" + fech[1] + "-" + fech[2] + " 23:59:59.000";

            DataSet ds = new DataSet();
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_comparaciontickets_2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@dni", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha", e.vcIdCodigoGeneral));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha1", fech1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha2", fech2));
            ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiRendProcRegistro(RendimientoProcesoRegistroBE e)
        {
            DataSet ds = new DataSet();
            try
            {
                cnx = con.conectar();
                da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_Lectura3", cnx);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa)); 
                da.SelectCommand.Parameters.Add(new SqlParameter("@cLabor", e.vcLabor));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRendPack", e.vnIdRendPack));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
                ds = new DataSet();
                da.Fill(ds, "get");
                cnx.Close();
                return ds;

            }
            catch (Exception s)
            {
                DataTable dt = new DataTable();
                dt = new DataTable("get");
                //dt.clear();
                dt.Columns.Add("IdRendPack");
                dt.Columns.Add("Colaborador");
                dt.Columns.Add("Labor");
                DataRow dr = dt.NewRow();
                dr["IdRendPack"] = -2;
                dr["Colaborador"] = s.ToString();
                dr["Labor"] = "";
                dt.Rows.Add(dr);
                ds.Tables.Add(dt);
            }
            return ds;
        }

        public DataSet RegiRendProcRegistro_Mod(RendimientoProcesoRegistroBE e)
        {
            DataSet ds = new DataSet();
            try
            {
                cnx = con.conectar();
                da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_LecturaMod", cnx);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cLabor", e.vcLabor));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRendPack", e.vnIdRendPack));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
                ds = new DataSet();
                da.Fill(ds, "get");
                cnx.Close();
                return ds;

            }
            catch (Exception s)
            {
                DataTable dt = new DataTable();
                dt = new DataTable("get");
                //dt.clear();
                dt.Columns.Add("IdRendPack");
                dt.Columns.Add("Colaborador");
                dt.Columns.Add("Labor");
                DataRow dr = dt.NewRow();
                dr["IdRendPack"] = -2;
                dr["Colaborador"] = s.ToString();
                dr["Labor"] = "";
                dt.Rows.Add(dr);
                ds.Tables.Add(dt);
            }
            return ds;
        }

        public DataSet RegiAnularEtiqueta(RendimientoProcesoRegistroBE e)
        {
            DataSet ds = new DataSet();
            try
            {
                cnx = con.conectar();
                da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_Anular", cnx);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cLabor", e.vcLabor));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRendPack", e.vnIdRendPack));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
                ds = new DataSet();
                da.Fill(ds, "get");
                cnx.Close();
                return ds;

            }
            catch (Exception s)
            {
                DataTable dt = new DataTable();
                dt = new DataTable("get");
                //dt.clear();
                dt.Columns.Add("IdRendPack");
                dt.Columns.Add("Colaborador");
                dt.Columns.Add("Labor");
                DataRow dr = dt.NewRow();
                dr["IdRendPack"] = -2;
                dr["Colaborador"] = s.ToString();
                dr["Labor"] = "";
                dt.Rows.Add(dr);
                ds.Tables.Add(dt);
            }
            return ds;
        }
        
        public DataSet RegiRendProcLectura(RendimientoProcesoRegistroBE e)
        {
            DataSet ds = new DataSet();
            try {
                cnx = con.conectar();
                da = new SqlDataAdapter("SPP_RendimientoProcesoDetalle_Registro", cnx);
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSupervisor", e.vnIdSupervisor));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdVariedad", e.vnIdVariedad));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", e.vcAnio));
                da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRendPack", e.vnIdRendPack));
                ds = new DataSet();
                da.Fill(ds, "get");
                cnx.Close();
                return ds;

            }
            catch (Exception s) {
                DataTable dt = new DataTable();
                dt = new DataTable("get");
                //dt.clear();
                dt.Columns.Add("IdRendPack");
                dt.Columns.Add("Colaborador");
                dt.Columns.Add("Labor");
                DataRow dr = dt.NewRow();
                dr["IdRendPack"] = -2;
                dr["Colaborador"] = s.ToString();
                dr["Labor"] = "";
                dt.Rows.Add(dr);
                ds.Tables.Add(dt);
            }
            return ds;
        }
        public DataSet ListTicketPrint(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            // da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_Print2", cnx);
            da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_Print_clamshell", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoControl", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCantidad", e.vnIdTiRow));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cLabor", e.vcLabor));
            DataSet dt = new DataSet();
            da.Fill(dt);
            cnx.Close();
            return dt;
        }

        public DataSet ReporteRendimiento(RendimientoProcesoRegistroBE e)
        {
        //    cnx = con.conectar();
        //    da = new SqlDataAdapter("SPP_ReporteRendimiento_Lst", cnx);
        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@clabor", e.vcLabor));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", e.vcFecha));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nCaj1Meta", e.vnCaj1Meta));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nPre1Meta", e.vnPre1Meta));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nCaj2MEta", e.vnCaj2Meta));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nPre2Meta", e.vnPre2Meta));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nCastigo ", e.vnCastigo));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cHora", e.vcHora));
        //    da.TableMappings.Add("MAST1", "CABE");
        //    da.TableMappings.Add("MAST2", "DETA");
            DataSet ds = new DataSet();
        //    da.Fill(ds, "MAST");
        //    cnx.Close();
            return ds;
        }
        public DataSet ListMonitorRendimiento(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_ListxMonitor2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMonitor", e.vnIdMonitor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListMonitorRendimiento_Mod(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_ListxMonitorMod", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMonitor", e.vnIdMonitor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListRendimientoProcesoDetalle(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoDetalle_ListxMonitor2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMonitor", e.vnIdMonitor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListGrupoRendimiento(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_GrupoRendimiento_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public DataSet RendimientoProcesoRegistroListUser(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_List_User", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RendimientoProcesoRegistroAvanceUser(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_Avance", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RendimientoProcesoRegistroList(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cLabor", e.vcLabor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ConsultaRendimientoPersonal(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Rendimiento_User_avance", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RendimientoProcesoRegistroListRT(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_Charts2", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet AvanceProcesoDetalle(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_Charts_Det", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RendimientoCastigo_Regi(RendimientoProcesoRegistroBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_RendimientoCastigo_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo_control", e.vcIdCodigoGeneral));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCantidad", e.vnCastigo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

    }
}
