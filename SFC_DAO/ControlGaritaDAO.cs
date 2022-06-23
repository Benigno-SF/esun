using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class ControlGaritaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet ControlGaritaRegi(ControlGaritaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ControlGarita_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdControlGarita", e.vnIdControlGarita));

            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdVehiculo", e.vnIdVehiculo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPLaca", e.vcPLaca));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipo", e.vnTipoVehiculo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescripcion", e.vcDescripcion));

            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdConductor", e.vnIdConductor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cApPaterno", e.vcApPaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cApMaterno", e.vcApMaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cLicenciaConducir", e.vcLicenciaConducir));

            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdentClieProv", e.vnIdentClieProv));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescClieProv", e.vcDescClieProv));

            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaIngreso", e.vdFechaIngreso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaSalida", e.vdFechaSalida));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObservacionIngreso", e.vcObservacionIngreso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObservacionSalida", e.vcObservacionSalida));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuarioCrea", e.vcUsuario));

            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }


        public DataSet ListControlGarita(ControlGaritaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ControlGarita_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdControlGarita", e.vnIdControlGarita));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }


    }
}