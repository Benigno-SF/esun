using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class PersonalDAO
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet ListPersonalNS(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_Personal_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPersonal_valida(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PersonalValida_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidPlanilla", e.vcIdPlanilla));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoLabor", e.vcCodigoLabor));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPersonal(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Personal_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidPlanilla", e.vcIdPlanilla));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoLabor", e.vcCodigoLabor));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ConsultaUtilidad(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SE_ConsultaUtilidad_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaNacimiento", e.vcFechaNacimiento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet VerificaPersonal(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SE_VerificaPersonal_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaNacimiento", e.vdFechaNacimiento));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPersonalNuevo(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PersonalNuevo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPersonalNisira(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PersonalNisira_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet UpdatePersonalNisira(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PersonalNisira_Update", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cRutaImg", e.vcRutaImg));
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
                cmd.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
                cmd.Parameters.Add(new SqlParameter("@cSexo", e.vcSexo));
                cmd.Parameters.Add(new SqlParameter("@dFechaNac", e.vdFechaNacimiento));
                cmd.Parameters.Add(new SqlParameter("@dFechaIngreso", e.vdFechaRegistro));
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

        public string RegiPersonalNuevo(PersonalBE e)
        {
            string vvMsje = "REGISTRO EXITOSO";
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_PersonalNuevo_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
                cmd.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
                cmd.Parameters.Add(new SqlParameter("@cApPaterno", e.vcApPaterno));
                cmd.Parameters.Add(new SqlParameter("@cApMaterno", e.vcApMaterno));
                cmd.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
                cmd.Parameters.Add(new SqlParameter("@cSexo", e.vcSexo));
                cmd.Parameters.Add(new SqlParameter("@dFechaNacimiento", e.vdFechaNacimiento));
                cmd.Parameters.Add(new SqlParameter("@dFechaRegistro", e.vdFechaRegistro));
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
        
        public DataSet ActualizaPersonal(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Personal_Update", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cApPaterno", e.vcApPaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cApMaterno", e.vcApMaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet RegiPersonalNuevo2(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_PersonalNuevo_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cApPaterno", e.vcApPaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cApMaterno", e.vcApMaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSexo", e.vcSexo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaNacimiento", e.vdFechaNacimiento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaIngreso", e.vdFechaRegistro));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx; 
        }

        public DataSet DeletePersonalNuevo(PersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PersonalNuevo_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public string[] ArrayPersonal(PersonalBE e)
        {
            List<string> lstPersonal = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SP_Personal_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            cmd.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            cmd.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            cmd.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            cmd.Parameters.Add(new SqlParameter("@cidPlanilla", e.vcIdPlanilla));
            cmd.Parameters.Add(new SqlParameter("@cCodigoLabor", e.vcCodigoLabor));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstPersonal.Add(string.Format("{0}-{1}-{2}", reader["nIdPersonal"], reader["cNroDocumento"], reader["cNombres"]));
            }
            cnx.Close();
            return lstPersonal.ToArray();
        }

        public int InsertardataTableDAO(string IdDocumento,
            string Apellidos_Nombres,
            string Cod_Planilla,
            string C_Costo,
            string Cod_Sucursal,
            string Cod_Actividad,
            string Cod_Labor,
            string Fecha_Inicio,
            string Fecha_Final,
            float Porcentaje)
        {
   
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("INSERT_CECOS_PERSONAL_RECURSOS", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IdDocumento", IdDocumento));
            cmd.Parameters.Add(new SqlParameter("@Apellidos_Nombres", Apellidos_Nombres));
            cmd.Parameters.Add(new SqlParameter("@Cod_Planilla", Cod_Planilla));
            cmd.Parameters.Add(new SqlParameter("@C_Costo", C_Costo));
            cmd.Parameters.Add(new SqlParameter("@Cod_Sucursal", Cod_Sucursal));
            cmd.Parameters.Add(new SqlParameter("@Cod_Actividad", Cod_Actividad));
            cmd.Parameters.Add(new SqlParameter("@Cod_Labor", Cod_Labor));
            cmd.Parameters.Add(new SqlParameter("@Fecha_Inicio", Fecha_Inicio));
            cmd.Parameters.Add(new SqlParameter("@Fecha_Final", Fecha_Final));
            cmd.Parameters.Add(new SqlParameter("@Porcentaje", Porcentaje));

            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            
            return x;
        }

        public int InsertardataTableDAOII(TablaCecoBE objeto)
        {

            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("INSERT_CECOS_PERSONAL_RECURSOS", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IdDocumento", objeto.IdDocumento));
            cmd.Parameters.Add(new SqlParameter("@Apellidos_Nombres", objeto.Apellidos_Nombres));
            cmd.Parameters.Add(new SqlParameter("@Cod_Planilla", objeto.Cod_Planilla));
            cmd.Parameters.Add(new SqlParameter("@C_Costo", objeto.C_Costo));
            cmd.Parameters.Add(new SqlParameter("@Cod_Sucursal", objeto.Cod_Sucursal));
            cmd.Parameters.Add(new SqlParameter("@Cod_Actividad", objeto.Cod_Actividad));
            cmd.Parameters.Add(new SqlParameter("@Cod_Labor", objeto.Cod_Labor));
            cmd.Parameters.Add(new SqlParameter("@Fecha_Inicio", objeto.Fecha_Inicio));
            cmd.Parameters.Add(new SqlParameter("@Fecha_Final", objeto.Fecha_Final));
            cmd.Parameters.Add(new SqlParameter("@Porcentaje", objeto.Porcentaje));

            int x = cmd.ExecuteNonQuery();
            cnx.Close();

            return x;
        }
        public List<string> EliminarTabla(string h)
        {
            cnx = con.conectar();
            List<string> lista = new List<string>();
            cnx.Open();
            cmd = new SqlCommand("Eliminar_Cecos_RRHH", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dt = cmd.ExecuteReader();
            while (dt.Read())
            {
                if (dt.GetString(1) == "" || dt.GetString(1) == null)
                {
                    lista.Add("N");
                }
                else
                {
                    lista.Add(dt.GetString(1));
                }
                
            }
            dt.Close();
            //int x = cmd.ExecuteNonQuery();
            cnx.Close();

            return lista;
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
