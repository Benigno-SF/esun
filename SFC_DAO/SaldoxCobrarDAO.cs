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
    public class SaldoxCobrarDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet MostrarAmbitodedocumentos_DAO()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarAmbitosxDocumento_ANGEL", cnx);

            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet MostrarVendedor_DAO()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarVendedor_ANGEL", cnx);

            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet MostrarClieProv_DAO()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_ClieProv_ANGEL", cnx);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet MostrarCampana_DAO()
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_MostrarCampanaSXC_ANGEL", cnx);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

        public DataSet TablaPivot_DAO(SaldoxCobrarBE objtable)
        {
            string anio = DateTime.Now.Year.ToString();
            string mes = DateTime.Now.Month.ToString().PadLeft(2, '0');
            string dias = DateTime.Now.Day.ToString().PadLeft(2, '0');
            if (Convert.ToInt32(dias) < 10)
            {
                dias = "0" + dias;
            }
            string concat = anio + "" + mes + "" + dias;
            cnx = con.conectar();
            da = new SqlDataAdapter("P_A_EXECOBJREPORTES_CONSOLIDADO_SALDOSXCOBRARJOAN", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@IDEMPRESA", "001");
            da.SelectCommand.Parameters.AddWithValue("@AMBITO", "");
            da.SelectCommand.Parameters.AddWithValue("@FECHAFIN", concat);
            da.SelectCommand.Parameters.AddWithValue("@XMLVENDEDOR", "");
            da.SelectCommand.Parameters.AddWithValue("@IDCAMPANA", objtable.campana);
            da.SelectCommand.Parameters.AddWithValue("@IDPROVEEDOR", objtable.clie_prov);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cnx.Close();
            return ds;
        }

    }
}
