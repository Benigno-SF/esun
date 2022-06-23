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
    public class DatosPrevisionComprasDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet UpdateDatosPrevisionCompras(DatosPrevisionComprasBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DatosPrevisionCompras_UPDATE", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nId", e.Id));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nUnidades", e.Unidades));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nId_UnidadMedida", e.Id_UnidadMedida));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet InsertDatosPrevisionCompras(DatosPrevisionComprasBE e)
        {
            DateTime ddd = Convert.ToDateTime(e.Fecha);
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_DatosPrevisionCompras_INSERT", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@Id_PrevisionCompras", e.Id_PrevisionCompras));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Unidades", e.Unidades));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Fecha", Convert.ToDateTime(e.Fecha)));
            da.SelectCommand.Parameters.Add(new SqlParameter("@Id_UnidadMedida", e.Id_UnidadMedida));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }   
    }
}
