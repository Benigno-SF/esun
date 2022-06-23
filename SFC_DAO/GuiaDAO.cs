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
    public class GuiaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet PrintGuia(GuiaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SN_GuiaRemision_Print", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cId", e.vcidingresosalidaalm));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cSerie", e.vcserie));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNumero", e.vcnumero));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet RegiGuiaRemision(GuiaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("ENVIA_GREM_NISIRA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@XML_CAB", e.vcXML_CAB));
            da.SelectCommand.Parameters.Add(new SqlParameter("@XML_DET", e.vcXML_DET));
            da.SelectCommand.Parameters.Add(new SqlParameter("@accion", e.vcAccion));
            da.SelectCommand.Parameters.Add(new SqlParameter("@valida_stock", e.valida_stock));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListGuiasParaTranferencia(GuiaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNH_GuiaRemisionVal", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@fecha", e.vcfecha));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Guia_ActualizaPeso(GuiaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SNH_GuiaActualiza_Peso", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@id", e.vcidingresosalidaalm));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idconsumidor", e.vcidconsumidor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@peso", e.vcpeso));
            da.SelectCommand.Parameters.Add(new SqlParameter("@idguiahispatec", e.vciddocumento));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
