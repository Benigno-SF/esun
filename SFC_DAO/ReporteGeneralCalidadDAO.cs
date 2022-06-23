using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;

namespace SFC_DAO
{
    public class ReporteGeneralCalidadDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet DAO_listar_sucursal(ReporteGeneralCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("NSP_LISTAR_SUCURSAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_variable(ReporteGeneralCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("NSP_LISTAR_VARIABLE", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_reporte(ReporteGeneralCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("NSP_LISTAR_REPORTE", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_reporte_general(ReporteGeneralCalidadBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("NSP_REPORTE_GENERAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 3000;
            da.SelectCommand.Parameters.Add(new SqlParameter("@REPORTE_ID_SUCURSAL", e.REPORTE_ID_SUCURSAL));
            da.SelectCommand.Parameters.Add(new SqlParameter("@REPORTE_ID_VARIABLE", e.REPORTE_ID_VARIABLE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@REPORTE_DESDE", e.REPORTE_DESDE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@REPORTE_HASTA", e.REPORTE_HASTA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@REPORTE_ID_REPORTE", e.REPORTE_ID_REPORTE));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
