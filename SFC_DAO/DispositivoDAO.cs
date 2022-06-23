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
    public class DispositivoDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListDispositivos(DispositivoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Dispositivo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDispositivo", e.vnIdDispositivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vcTipo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListDispositivosChild(DispositivoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DispositivoChild_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIp", e.vcIP));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipoChild", e.vcTipo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
