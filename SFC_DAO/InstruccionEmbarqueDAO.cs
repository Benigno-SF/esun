using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class InstruccionEmbarqueDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx; 

        public DataSet InstruccionEmbarqueDelete(InstruccionEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_InstruccionEmbarque_Delete", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdInstruccion", e.vnIdInstruccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListInstruccionEmbarque(InstruccionEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_InstruccionEmbarque_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdInstruccion", e.vnIdInstruccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCampana", e.vnIdCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCliente", e.vnIdCliente));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLocalizacion", e.vnIdLocalizacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdConsignee", e.vnIdConsignee));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNotify", e.vnIdNotify));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNotify2", e.vnIdNotify2));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet RegiInstruccionEmbarque(InstruccionEmbarqueBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_InstruccionEmbarque_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdInstruccion", e.vnIdInstruccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCampana", e.vnIdCampana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdCliente", e.vnIdCliente));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdLocalizacion", e.vnIdLocalizacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdConsignee", e.vnIdConsignee));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNotify", e.vnIdNotify));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdNotify2", e.vnIdNotify2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaIni", e.vdFechaIni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFechaFin", e.vdFechaFin));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
