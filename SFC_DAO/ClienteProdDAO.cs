using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class ClienteProdDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;


        public DataSet RegiClienteProd(ClienteProdBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListClienteProdExp(ClienteProdBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ClienteProdExp_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        //public DataSet ListClienteProdExt(ClienteProdBE e)
        //{
        //    cnx = con.conectar();
        //    da = new SqlDataAdapter("SP_ClienteProdExt_list", cnx);
        //    da.SelectCommand.CommandType = CommandType.StoredProcedure;
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@nIdClieProv", e.vnIdClieProv));
        //    da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vcTipo));
        //    DataSet ds = new DataSet();
        //    da.Fill(ds, "get");
        //    cnx.Close();
        //    return ds;
        //}

        public string[] ArrayClienteProd(ClienteProdBE e)
        {
            List<string> lstCliente = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SP_ClienteProd_list", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@cDescClieProv", e.vcDescClieProv));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstCliente.Add(string.Format("{0}-{1}-{2}", reader["nIdClieProv"], reader["nIdentClieProv"], reader["cDescClieProv"]));
            }
            cnx.Close();
            return lstCliente.ToArray();
        }
    }
}
