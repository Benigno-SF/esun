using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_DAO
{
    public class FrioErrorDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ConsultarError()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarErroresFrio_AG", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public DataSet ConsultarErrorPaleta(string paleta)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ConsultarPaleta_AGC", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nropaleta", paleta));
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }
        public int LastIDEDelete(string ID, string paleta)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_EliminarUltimoID", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDE", ID));
            cmd.Parameters.Add(new SqlParameter("@paleta", paleta));
            int x = cmd.ExecuteNonQuery();
            
            cnx.Close();
            return x;
        }
        public int LastIDEDeleteMov(string ID, string paleta)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_EliminarUltimoIDMov", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@IDE", ID));
            cmd.Parameters.Add(new SqlParameter("@paleta", paleta));
            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            return x;
        }
        public int TodoIDEDelete(string ID, string paleta)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_EliminarPrimerNegativo", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ID", ID));
            cmd.Parameters.Add(new SqlParameter("@PALETA", paleta));
            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            return x;
        }
        public int TodoNegMov(int ID, string paleta)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_EliminarMovUbicErr", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@NroPaleta", paleta));
            cmd.Parameters.Add(new SqlParameter("@IDE", ID));
            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            return x;
        }
        public int TodoNegMovPal(int ID, string paleta)
        {
            cnx = con.conectar();
            cnx.Open();
            cmd = new SqlCommand("P_A_EliminarMovUbicPalErr", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@NroPaleta", paleta));
            cmd.Parameters.Add(new SqlParameter("@IDE", ID));
            int x = cmd.ExecuteNonQuery();
            cnx.Close();
            return x;
        }
    }
}
