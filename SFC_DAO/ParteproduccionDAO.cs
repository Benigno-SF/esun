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
    public class ParteproduccionDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        public DataSet Buscar(ControlfechasBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("CLI230_ParteTransformacionClasificacionRangoFechas_ESUN", cnx);

            da.SelectCommand.CommandTimeout = 700;
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DesdeFecha", e.dFechaInicio));
            da.SelectCommand.Parameters.Add(new SqlParameter("@HastaFecha", e.dFechaFin));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
