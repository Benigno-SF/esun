using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;


namespace SFC_DAO
{
    public class FichaPersonalDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet FichaPersonalList(FichaPersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FichaPersonal_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFicha", e.vnIdFicha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFichaPersonal", e.vnIdFichaPersonal));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.vcNroDocumento));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nAnio", e.vnAnio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nMes", e.vnMes));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet RepFichaPersonal(FichaPersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FichaPersonal_Repo", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFicha", e.vnIdFicha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdFichaMes", e.vnIdFichaMes));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", e.vnIdPersonal));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ReporteReparaciones(FichaPersonalBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("test_sp_xml", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idsOrdenesReparacion", e.vcCodigoNisira));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
