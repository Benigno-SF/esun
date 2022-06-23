using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class UnidadNegDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public string[] GetUnidNeg(UnidadNegBE e)
        {
            List<string> Clie = new List<string>();
            cnx = con.conectar();
            cmd = new SqlCommand("SP_UnidadNegUser_List", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            cmd.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            cmd.Parameters.Add(new SqlParameter("@cFundo", e.vcFundo));
            cmd.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            cmd.Parameters.Add(new SqlParameter("@cDescUnidadNeg", e.vcDescUnidadNeg));
            cmd.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            cnx.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                Clie.Add(string.Format("{0},{1},{2}", sdr["nIdUnidadNeg"], sdr["cDescUnidadNeg"], sdr["nIdCultivo"]));
            }
            cnx.Close();
            return Clie.ToArray();
        }
        public DataSet ListUnidNeg(UnidadNegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_UnidadNegUser_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFundo", e.vnIdFundo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescUnidadNeg", e.vcDescUnidadNeg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListUnidNegFundo(UnidadNegBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_UnidNegUser_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUnidadNeg", e.vnIdUnidadNeg));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
