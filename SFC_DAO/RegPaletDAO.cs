using SFC_BE;
using System.Data;
using System.Data.SqlClient;

namespace SFC_DAO
{
    public class RegPaletDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Registrar(RegPalet e, int tipo)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RegPalet", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodPalet", e.CodPalet));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodTunel", e.CodTunel));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", tipo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        //Considerar uso de EntiyFramework
        public DataSet UnoPorCodigo(string codigo)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RegPalet_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodPalet", codigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Reporte_PaletsPorDia() 
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RegPalet_Reporte_PaletsPorDia", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Reporte_PaletsPorTunel()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RegPalet_Reporte_PaletsPorTunel", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Reporte_PaletsPorTunelYPorDia(PersonalBE obj)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RegPalet_Reporte_PaletsPorTunelYPorDia", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", obj.vcApPaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@vTunel", obj.vcApMaterno));
            da.SelectCommand.Parameters.Add(new SqlParameter("@vPalet", obj.vcNombres));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Reporte_PaletsPorTunelYPorDia(string fecha)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_RegPalet_Reporte_PaletsPorTunelYPorDia_Fecha", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFecha", fecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
