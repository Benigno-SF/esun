using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;

namespace SFC_DAO
{
    public class Reg_Chofe_PlacaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet DAO_listar_proveedores(Reg_Chofe_PlacaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_PROVE_CHOFERES", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_verificar_chofer(Reg_Chofe_PlacaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_VERIFICAR_CHOFER", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CHOFER_BREVETE", e.CHOFER_BREVETE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@COHER_DNI", e.COHER_DNI));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_registrar_chofer(Reg_Chofe_PlacaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ISNERTAR_CHOFER", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@COHER_PROVEEDOR", e.COHER_PROVEEDOR));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CHOFER_BREVETE", e.CHOFER_BREVETE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@COHER_DNI", e.COHER_DNI ));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CHOFER_DATOS", e.CHOFER_DATOS));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_verificar_placa(Reg_Chofe_PlacaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_VERIFICAR_PLACA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@PLACA_PLACA", e.PLACA_PLACA));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet DAO_registrar_placa(Reg_Chofe_PlacaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_INSERTAR_PLACA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@PLACA_PROVEEDOR", e.PLACA_PROVEEDOR));
            da.SelectCommand.Parameters.Add(new SqlParameter("@PLACA_PLACA", e.PLACA_PLACA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@PLACA_MARCA", e.PLACA_MARCA));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
