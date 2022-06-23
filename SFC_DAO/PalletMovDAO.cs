using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;


namespace SFC_DAO
{
    public class PalletMovDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public string RegiPalletMov(PalletMovBE e)
        {
            string vvMsje = "";
            try
            {
                SqlParameter InOutParam = new SqlParameter("@cMensaje", e.vcMensaje);
                InOutParam.SqlDbType = SqlDbType.VarChar;
                InOutParam.Size = 50;
                InOutParam.Direction = ParameterDirection.InputOutput;
                cnx = con.conectar();
                cmd = new SqlCommand("SPP_PallMov_Regi", cnx);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
                cmd.Parameters.Add(new SqlParameter("@cIdRegistroPaleta", e.vcIdRegistroPaleta));
                cmd.Parameters.Add(new SqlParameter("@cIdCampana", e.vcIdCampana));
                cmd.Parameters.Add(new SqlParameter("@cNroPaleta", e.vcNroPaleta));
                cmd.Parameters.Add(new SqlParameter("@nIdMov", e.vnIdMov));
                cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
                cmd.Parameters.Add(new SqlParameter("@cMovObs", e.vcMovObs));
                cmd.Parameters.Add(new SqlParameter("@cTipoMovi", e.vcTipoMovi));
                cmd.Parameters.Add(new SqlParameter("@cCodUbic", e.vcCodUbic));
                cmd.Parameters.Add(new SqlParameter("@nCodUbicDet", e.vnCodUbicDet));
                cmd.Parameters.Add(InOutParam);
                cnx.Open();
                cmd.ExecuteNonQuery();
                vvMsje = cmd.Parameters["@cMensaje"].Value.ToString();
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
        public DataSet ListPalletEx(PalletMovBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("se_infopallet_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", 1));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCampana", e.vcIdCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cPallet", e.vcNroPaleta));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
