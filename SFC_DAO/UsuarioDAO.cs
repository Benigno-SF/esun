using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{

    public class UsuarioDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet ListPerfUser(UsuarioBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PerfilUsuario_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            return ds;
        }
        public int RegUserAd(UsuarioBE e)
        {
            int vnRtrn = 0;
            
            SqlParameter ParPerf = new SqlParameter("@nIdPerfil", e.vnIdPerfil);
            ParPerf.SqlDbType = SqlDbType.Int;
            ParPerf.Direction = ParameterDirection.InputOutput;
            SqlParameter ParEsta = new SqlParameter("@bEstado", e.vbEstado);
            ParEsta.SqlDbType = SqlDbType.Bit;
            ParEsta.Direction = ParameterDirection.InputOutput;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_UserAD_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@cPassword", e.vcPassword));
                cmd.Parameters.Add(new SqlParameter("@cApellidos", e.vcApellidos));
                cmd.Parameters.Add(new SqlParameter("@cNombres", e.vcNombres));
                cmd.Parameters.Add(new SqlParameter("@cCorreo", e.vcCorreo));
                cmd.Parameters.Add(new SqlParameter("@cMovil", e.vcMovil));
                cmd.Parameters.Add(ParPerf);
                cmd.Parameters.Add(ParEsta);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vnRtrn = (int)cmd.Parameters["@nIdPerfil"].Value;
                e.vbEstado = (bool)cmd.Parameters["@bEstado"].Value;
            }
            catch (Exception)
            {
                vnRtrn = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vnRtrn;
        }

        public void RegUserUpdate(UsuarioBE e)
        {
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SP_UserUPD_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@cMovil", e.vcMovil));
                cnx.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
        }

        public UsuarioBE ValUserSQL(UsuarioBE e)
        {
            UsuarioBE vcUser = new UsuarioBE();
            vcUser.vbUserAuth = false;
            SqlParameter ParApel = new SqlParameter("@cApellidos", e.vcApellidos);
            ParApel.SqlDbType = SqlDbType.VarChar;
            ParApel.Size = 100;
            ParApel.Direction = ParameterDirection.InputOutput;
            SqlParameter ParNomb = new SqlParameter("@cNombres", e.vcNombres);
            ParNomb.SqlDbType = SqlDbType.VarChar;
            ParNomb.Size = 100;
            ParNomb.Direction = ParameterDirection.InputOutput;
            SqlParameter ParCorr = new SqlParameter("@cCorreo", e.vcCorreo);
            ParCorr.SqlDbType = SqlDbType.VarChar;
            ParCorr.Size = 50;
            ParCorr.Direction = ParameterDirection.InputOutput;
            SqlParameter ParMovi = new SqlParameter("@cMovil", e.vcMovil);
            ParMovi.SqlDbType = SqlDbType.VarChar;
            ParMovi.Size = 15;
            ParMovi.Direction = ParameterDirection.InputOutput;
            SqlParameter ParEsta = new SqlParameter("@bEstado", e.vbEstado);
            ParEsta.SqlDbType = SqlDbType.Bit;
            ParEsta.Direction = ParameterDirection.InputOutput;
            SqlParameter ParPerf = new SqlParameter("@nIdPerfil", e.vnIdPerfil);
            ParPerf.SqlDbType = SqlDbType.Int;
            ParPerf.Direction = ParameterDirection.InputOutput;
            try
            {
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_Usuario_Eval", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@cPassword", e.vcPassword));
                cmd.Parameters.Add(ParApel);
                cmd.Parameters.Add(ParNomb);
                cmd.Parameters.Add(ParCorr);
                cmd.Parameters.Add(ParMovi);
                cmd.Parameters.Add(ParEsta);
                cmd.Parameters.Add(ParPerf);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vcUser.vcUsuario = e.vcUsuario;
                vcUser.vcPassword = e.vcPassword;
                vcUser.vcApellidos = cmd.Parameters["@cApellidos"].Value.ToString();
                vcUser.vcNombres = cmd.Parameters["@cNombres"].Value.ToString();
                vcUser.vcCorreo = cmd.Parameters["@cCorreo"].Value.ToString();
                vcUser.vcMovil = cmd.Parameters["@cMovil"].Value.ToString();
                vcUser.vbEstado = (bool)cmd.Parameters["@bEstado"].Value;
                vcUser.vnIdPerfil = (int)cmd.Parameters["@nIdPerfil"].Value;
            }
            catch (Exception)
            {
                vcUser.vnIdPerfil = 0;
            }
            finally
            {
                cmd.Dispose();
                cnx.Close();
            }
            return vcUser;
        }
        public DataSet ListUser(UsuarioBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Usuario_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            return ds;
        }

        public DataSet ListProveedoresPorUsuario(string usuario)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("ProveedoresPorUsuario_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", usuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            return ds;
        }
    }
}
