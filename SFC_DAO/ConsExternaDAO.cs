using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;

namespace SFC_DAO
{
    public class ConsExternaDAO
    {
        //SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet AgrupadorCC(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_AgrupadorCCList", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cTipo", e.vctipo));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet ConsultaMarcasList(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SE_ConsultaMarcas_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaIni", e.vcFechaIni));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFechaFin", e.vcFechaFin));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet RepoBoleta(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("Sfe_Boleta_Report", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.CommandTimeout = 1200;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", e.vnSistema));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nPeriodo", e.vcPeriodo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSemana", e.vcSemana));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nPeriodo1", e.vcPeriodo2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSemana1", e.vcSemana2));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigo", e.vcCodigo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vcUsuario));
            da.TableMappings.Add("EMPR1", "CABE");
            da.TableMappings.Add("EMPR2", "NUEV");
            da.TableMappings.Add("EMPR3", "DETA");
            da.TableMappings.Add("EMPR4", "TIEM");
            da.TableMappings.Add("EMPR5", "HORA");
            da.TableMappings.Add("EMPR6", "EVAL");
            DataSet ds = new DataSet();
            da.Fill(ds, "EMPR");
            cnx.Close();
            return ds;
        }
        public DataSet ListProvClie(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("se_provmp_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", e.vnSistema));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ctipo", e.vctipo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListVariedad(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("se_variedades_cultivos_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", e.vnSistema));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidvariedad", e.vctipo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListCultivos(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("se_cultivos_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", e.vnSistema));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ctipo", e.vctipo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListPuertos(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("se_puertos_list", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", e.vnSistema));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet ListStockPallet(ConsExternaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("se_stockpallet_List", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", e.vnIdEmpresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nSistema", e.vnSistema));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidcliente", e.vcIdCliente));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidcultivo", e.vcIdCultivo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidvariedad", e.vcIdVariedad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vcFecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdOrdCarga", e.vnIdOrdCarga));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        

    }
}
