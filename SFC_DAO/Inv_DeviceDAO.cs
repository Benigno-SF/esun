using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class Inv_DeviceDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet ListDevice(Inv_DeviceBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Inv_Device_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDevice", e.vnIdDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUsuario", e.vnIdUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet Regi_Device_Regi(Inv_DeviceBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Device_Merge", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdDevice", e.vnIdDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdTipoDevice", e.vnIdTipoDevice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cHostname", e.vcHostname));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSerie", e.vcSerie));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdMarca", e.vnIdMarca));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cModelo", e.vcModelo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.vbEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nPropiedad", e.vnPropiedad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObsDev", e.vcObsDev));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nDet", e.vnDet));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdSO", e.vnIdSO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nRam", e.vnRam));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdProcesador", e.vnIdProcesador));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOffice", e.vnIdOffice));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdAntivirus", e.vnIdAntivirus));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIp", e.vcIp));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cMac", e.vcMac));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTeamviwer", e.vcTeamviwer));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cAnydesk", e.vcAnydesk));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nDetMob", e.vnDetMob));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cIMEI", e.vcIMEI));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNumero", e.vcNumero));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bAudifonos", e.vbAudifonos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bCargador", e.vbCargador));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bCarcasa", e.vbCarcasa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nAsig", e.vnAsig));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUsuario", e.vnIdUsuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdResponsable", e.vnIdResponsable));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdUbicacion", e.vnIdUbicacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdArea", e.vnIdArea));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaAsignacion", e.vcFechaAsignacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cObservacion", e.vcObservacion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}
