using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;


namespace SFC_DAO
{
    public class PresupuestoDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        #region Defin
        //Detalle
        
        public DataSet ListPresPeriodo(PresupuestoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_PresupuestoPeriodo_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        #endregion
        public DataSet ListPresupuesto(PresupuestoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Presupuesto_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPresupuesto", e.vnIdPresupuesto));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cDenominacion", e.vcDenominacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public string BulkInsertPresupuesto(string formato)
        {
                using (cnx = con.conectar())
                {
                    da = new SqlDataAdapter("BULK_PRESUPUESTO", cnx);
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand.Parameters.Add(new SqlParameter("@formato", formato));
                    DataSet ds = new DataSet();
                 
                    try
                    {
                    da.Fill(ds, "get");
                    cnx.Close();
                    }
                    catch (SqlException e)
                    {
                    cnx.Close();
                    return e.Message;
                    }
                }
            return "completado";
        }
    }
}
