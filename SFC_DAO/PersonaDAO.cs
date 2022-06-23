using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class PersonaDAO
    {

        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        
        public int DeleteSeleccion(PersonaBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_Persona_DeleteSel", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdPersona", e.vnIdPersona));
                cmd.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                vnReturn = -1;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }

        public int SeleccionarPersonal(PersonaBE e)
        {
            int vnReturn = 0;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_SeleccionaPersonalId", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Ids", e.vcIds));
                cmd.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ed)
            {
                vnReturn = -1;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnReturn;
        }

        public DataSet ListPreInscripcion(PersonaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PreIncripcion_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa)); 
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPersona(PersonaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Persona_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersona", e.vnIdPersona));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nEstado", e.vnEstado)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListPersona2x(PersonaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Persona_List2x", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public int UpdateInfoPersona(PersonaBE e)
        {
            int vcReturn = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdPersona", e.vnIdPersona);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SP_Persona_Update", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@Ext", e.vExt));

                cmd.Parameters.Add(InOutParam);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcReturn = Convert.ToInt32(cmd.Parameters["@nIdPersona"].Value);
            }
            catch (Exception d)
            {
                vcReturn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcReturn;
        }

        public int RegiPersona(PersonaBE e)
        {
            int vcReturn = 0;
            try
            {
                SqlParameter InOutParam = new SqlParameter("@nIdPersona", e.vnIdPersona);
                InOutParam.SqlDbType = SqlDbType.Int;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SP_Persona_Merge", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdTemporada",e.vnIdTemporada));
                cmd.Parameters.Add(new SqlParameter("@cTipoDocumento",e.vcTipoDocumento));
                cmd.Parameters.Add(new SqlParameter("@cNroDocumento",e.vcNroDocumento));
                cmd.Parameters.Add(new SqlParameter("@cApPaterno",e.vcApPaterno));
                cmd.Parameters.Add(new SqlParameter("@cApMaterno",e.vcApMaterno));
                cmd.Parameters.Add(new SqlParameter("@cNombres",e.vcNombres));
                cmd.Parameters.Add(new SqlParameter("@cSexo",e.vcSexo));
                cmd.Parameters.Add(new SqlParameter("@dFechaNac",e.vcFechaNacimiento));
                cmd.Parameters.Add(new SqlParameter("@cNacionalidad",e.vcNacionalidad));
                cmd.Parameters.Add(new SqlParameter("@cDireccion",e.vcDireccion));
                cmd.Parameters.Add(new SqlParameter("@cDistrito",e.vcDistrito));
                cmd.Parameters.Add(new SqlParameter("@cDepartamento", e.vcDepartamento));
                cmd.Parameters.Add(new SqlParameter("@cCelular",e.vcCelular));
                cmd.Parameters.Add(new SqlParameter("@cEmail",e.vcEmail));
                cmd.Parameters.Add(new SqlParameter("@cTurno", e.vcTurno));
                cmd.Parameters.Add(new SqlParameter("@bReingresante",e.vbReingresante));
                cmd.Parameters.Add(new SqlParameter("@cReCargos", e.vcReCargos)); 
                cmd.Parameters.Add(new SqlParameter("@cReOtroCargo", e.vcReOtroCargo));
                cmd.Parameters.Add(new SqlParameter("@cReAnios", e.vcReAnios));
                cmd.Parameters.Add(new SqlParameter("@cReCapanias", e.vcReCapanias));
                cmd.Parameters.Add(new SqlParameter("@nidCargoPost",e.vnidCargoPost));
                cmd.Parameters.Add(new SqlParameter("@cDescCargo", e.vcDescCargo));
                cmd.Parameters.Add(new SqlParameter("@cGradoInstruccion",e.vcGradoInstruccion));
                cmd.Parameters.Add(new SqlParameter("@cExpOEmpresa", e.vcExpOEmpresa));
                cmd.Parameters.Add(new SqlParameter("@Ext", e.vExt));
                cmd.Parameters.Add(new SqlParameter("@Img", e.vImg));

                cmd.Parameters.Add(InOutParam);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcReturn = Convert.ToInt32(cmd.Parameters["@nIdPersona"].Value);
            }
            catch (Exception d)
            {
                vcReturn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcReturn;
        }

        public string[] ArrayPersona(PersonaBE e)
        {
            List<string> lstPersona = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SP_Persona_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            cmd.Parameters.Add(new SqlParameter("@nIdPersona", e.vnIdPersona));
            cmd.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            cmd.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstPersona.Add(string.Format("{0}-{1}-{2}", reader["nIdPersona"], reader["cNroDocumento"], reader["cNombres"]));
            }
            cnx.Close();
            return lstPersona.ToArray();
        }
    }
}
