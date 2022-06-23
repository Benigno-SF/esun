using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class ConductorDAO
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet ListConductor(ConductorBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SE_Conductor_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cLicenciaConducir", e.vcLicenciaConducir));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public string RegiPersonal(PersonalBE e)
        {
            string vvMsje = "REGISTRO EXITOSO";
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_Personal_Merge", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
                cmd.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                cmd.Parameters.Add(new SqlParameter("@cApPaterno", e.vcApPaterno));
                cmd.Parameters.Add(new SqlParameter("@cApMaterno", e.vcApMaterno));
                cmd.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
                cmd.Parameters.Add(new SqlParameter("@cCodigoControl", e.vcCodigoControl));
                cmd.Parameters.Add(new SqlParameter("@cIdPlanilla", e.vcIdPlanilla));
                cmd.Parameters.Add(new SqlParameter("@cGrupoTrabajo", e.vcGrupoTrabajo));
                cmd.Parameters.Add(new SqlParameter("@cIdCodigoGeneral", e.vcIdCodigoGeneral));
                cmd.Parameters.Add(new SqlParameter("@cCodigoLabor", e.vcCodigoLabor));
                cmd.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));

                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception d)
            {
                vvMsje = d.ToString();
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vvMsje;
        }

        public string ActualizaLabor(PersonalBE e)
        {
            string vvMsje = "REGISTRO EXITOSO";
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_ActualizaLabor", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                cmd.Parameters.Add(new SqlParameter("@cCodigoLabor", e.vcCodigoLabor));

                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception d)
            {
                vvMsje = d.ToString();
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vvMsje;
        }
    }
}
