using SFC_BE;
using System;
using System.Data;
using System.Data.SqlClient;

namespace SFC_DAO
{
    public class DispositivosMonitoreoDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        /// <summary>
        /// Reporte de dispositivos
        /// </summary>
        /// <returns>Data set con un la lista de resultados</returns>
        public DataSet Listado()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DispositivosMonitoreo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        /// <summary>
        /// Devuelve dataset con el registro de la url básica.
        /// </summary>
        /// <param name="Ip">Ip del dispositivo</param>
        /// <returns>Data set con un registro "respuesta" -> url: '', url: 'contenido de url'</returns>
        public DataSet Servicio_Url(string Ip)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DispositivosMonitoreo_Servicio_Url", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIp", Ip));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        /// <summary>
        /// Operaciones de tipo CRUD
        /// </summary>
        /// <param name="dispositivosMonitoreoBE">Entidad CRUD</param>
        /// <returns>Data set con un registro "respuesta" -> 1: Ok, 2: Error</returns>
        public DataSet Merge(DispositivosMonitoreoBE dispositivosMonitoreoBE)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DispositivosMonitoreo_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDispositivosMonitoreo", dispositivosMonitoreoBE.nIdDispositivosMonitoreo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIp", dispositivosMonitoreoBE.cIp));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", dispositivosMonitoreoBE.cDescripcion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFhsereporta", dispositivosMonitoreoBE.dFhsereporta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nBateria", dispositivosMonitoreoBE.nBateria));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombre", dispositivosMonitoreoBE.cNombre));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        /// <summary>
        /// Se consume desde e el servicio
        /// </summary>
        /// <param name="Ip">Ip del dispositivo</param>
        /// <param name="Bateria">Porcentaje de batería</param>
        /// <returns>Data set con un registro "respuesta" -> 1: Ok, 2: Error</returns>
        public DataSet Servicio(string Ip, int Bateria)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DispositivosMonitoreo_Servicio", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIp", Ip));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nBateria", Bateria));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
