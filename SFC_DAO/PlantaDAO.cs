using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class PlantaDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListPlanta(PlantaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Planta_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPlanta", e.vnIdPlanta));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Actualizar(PlantaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Planta", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPlanta", e.vnIdPlanta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescPlanta", e.vcDescPlanta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDireccion", e.vcDireccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cContacto", e.vcContacto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cContactoMovil", e.vcContactoMovil));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNota", e.vcNota));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Eliminar(PlantaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Planta", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPlanta", e.vnIdPlanta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 4));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Insertar(PlantaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Planta", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDescPlanta", e.vcDescPlanta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDireccion", e.vcDireccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cContacto", e.vcContacto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cContactoMovil", e.vcContactoMovil));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNota", e.vcNota));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Merge(PlantaBE e)
        {
            return null;
        }

        public DataSet OneById(PlantaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Planta", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPlanta", e.vnIdPlanta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
