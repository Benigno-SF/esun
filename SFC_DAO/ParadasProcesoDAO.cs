using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class ParadasProcesoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;
        
        public DataSet ParadasProcesoDelete(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParadasProceso_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ParadasProcesoUpdate(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParadasProceso_Update", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMotivo", e.vnIdMotivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo)); 
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObservacion", e.vcObservacion));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet RegiParadasProceso(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SPP_ParadasProceso_Regi", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMotivo", e.vnIdMotivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFechaIni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet UpdateParadasProceso(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParadasProceso_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProceso", e.vnIdProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMotivo", e.vnIdMotivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCultivo", e.vnIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFechaIni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }


        public DataSet InicFinParadas(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParadasProceso_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdAreaProceso", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMotivo", e.vnIdMotivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListParadasProceso(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParadasProceso_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet ListParadasProcesoRep(ParadasProcesoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ParadasProceso_Rep", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdParadasProceso", e.vnIdParadasProceso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdAreaProceso", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdGrupo", e.vnIdGrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaInicio", e.vcFechaProc));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
