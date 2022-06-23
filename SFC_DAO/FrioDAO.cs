using SFC_BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_DAO
{
    public class FrioDAO
    {
        SqlDataAdapter da;
        SqlCommand scomand;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        SqlParameter parametro;

        public DataSet MostrarCamara_ReporteDAO()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarCamara_AG", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet MostrarRacks_ReporteDAO(String camara)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarRacks_AG", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDCAMARA", camara));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet MostrarPiso_ReporteDAO(String rack)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarPisoRacks_AG", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@RACK", rack));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet Zonificacion_camara_2022(FrioZonBE objfrio)
        {
            cnx = con.conectar();
            
            da = new SqlDataAdapter("nsp_rpt_zonificacion_xcamara_AG_2022", cnx);
            da.SelectCommand.CommandTimeout = 0;
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", objfrio.empresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idcamara", objfrio.camara));
            da.SelectCommand.Parameters.Add(new SqlParameter("@rack", objfrio.rack));
            da.SelectCommand.Parameters.Add(new SqlParameter("@piso", objfrio.piso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fila", objfrio.fila));
            da.SelectCommand.Parameters.Add(new SqlParameter("@columna", objfrio.columna));
            
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet MostrarStock_DAO(string fecha)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("nsp_rpt_zonificacion_xcamara_AG_2022", cnx);
            da.SelectCommand.CommandTimeout = 0;
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@idempresa", "001"));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idcamara", "C01"));
            da.SelectCommand.Parameters.Add(new SqlParameter("@rack", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@piso", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@fila", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@columna", ""));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public string MostrarEstadoPaleta_DAO(string Numpaleta)
        {
            cnx = con.conectar();
            cnx.Open();
            scomand = new SqlCommand("SELECT [dbo].[Sfe_Estado_Paleta](@Numpaleta)", cnx);
            scomand.Parameters.AddWithValue("@Numpaleta", Numpaleta);
            String res = Convert.ToString(scomand.ExecuteScalar());
            cnx.Close();
            return res;
        }
    }
}
