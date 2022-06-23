using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class Reg_Sup_EvaluadorDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        //funciones -....
        public DataSet DAO_listar_tipo_cosecha(Reg_Sup_EvaluadorBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_LISTA_EVALUACION_CALIDAD", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_fundo(Reg_Sup_EvaluadorBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[NSP_ALMACENESCALIDAD]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDVARIABLE", e.COD_COSECHA));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_registrar(Reg_Sup_EvaluadorBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_INSERTAR_SUPERVISOR_CALIDAD]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDVARIABLE", e.REG_COSECHA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FUNDO", e.REG_FUNDO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CARGO", e.REG_CARGO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@NOMBRE", e.REG_TRABAJADOR));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
