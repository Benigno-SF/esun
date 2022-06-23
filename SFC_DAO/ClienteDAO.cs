using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class ClienteDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListCliente(ClienteBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ClientesSalida_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public string[] ListClienteProductor(ClienteBE e)
        {
            List<string> lstCliente = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SP_ClienteProductor_list", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cRazonSocial", e.vcRazonSocial));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstCliente.Add(string.Format("{0}-{1}-{2}", reader["nIdClieProd"], reader["cRUC"], reader["cRazonSocial"]));
            }
            cnx.Close();
            return lstCliente.ToArray();
        }
    }
}
