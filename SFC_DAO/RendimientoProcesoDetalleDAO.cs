using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{

    //Actualización
    public class RendimientoProcesoDetalleDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        
        public RendimientoProcesoDetalleBE RegiRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            RendimientoProcesoDetalleBE vcReturn = new RendimientoProcesoDetalleBE();
            try
            {   
                SqlParameter InOutProceso = new SqlParameter("@nIdProceso", e.vnIdProceso);
                InOutProceso.SqlDbType = SqlDbType.Int;
                InOutProceso.Direction = ParameterDirection.InputOutput;
                SqlParameter InOutProcesoDeta = new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle);
                InOutProcesoDeta.SqlDbType = SqlDbType.Int;
                InOutProcesoDeta.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_RendimientoProcesoDetalle_Regi2", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(InOutProceso);
                cmd.Parameters.Add(InOutProcesoDeta);
                cmd.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
                cmd.Parameters.Add(new SqlParameter("@nIdSupervisor", e.vnIdSupervisor));
                cmd.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
                cmd.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
                cmd.Parameters.Add(new SqlParameter("@nIdVariedad", e.vnIdVariedad));
                cmd.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
                cnx.Open();
                cmd.ExecuteNonQuery();

                vcReturn.vnIdProceso = Convert.ToInt32(cmd.Parameters["@nIdProceso"].Value);
                vcReturn.vnIdProcesoDetalle = Convert.ToInt32(cmd.Parameters["@nIdProcesoDetalle"].Value);
            }
            catch (Exception s)
            {
                string ex = s.ToString();
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcReturn;
        }

        public DataSet ListRendimientoProcesoDetalle_update(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoDetalle_Update", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSupervisor", e.vnIdSupervisor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmbalaje", e.vnIdEmbalaje));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdVariedad", e.vnIdVariedad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListRendimientoProcesoDetalle_ultimo(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoDetalle_List_ultimo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", ""));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RendimientoGuardar(string anio, string dni, string rend, int idproceso, int idprocesodetalle)
        {
            //Que por el momento guarde en otra tabla, solo para pruebas
            cnx = con.conectar();
            //da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_Lectura2", cnx);//definitivo
            da = new SqlDataAdapter("SPP_RendimientoProcesoRegistro_Lectura2_JC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", 1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAnio", anio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", dni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRendPack", int.Parse(rend)));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", idproceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", idprocesodetalle));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        
        public DataSet ListParadasProcesoRepo(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoDetalle_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ReadRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoDetalle_Read", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoDetalle_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesoDetalle", e.vnIdProcesoDetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListVolcadoProceso(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_VolcadoXLineaHora_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cfecha", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ViewRendimientoProcesoDetalle(RendimientoProcesoDetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RendimientoProcesoRegistro_Charts", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFecha));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
