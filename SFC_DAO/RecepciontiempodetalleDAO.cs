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
    public class RecepciontiempodetalleDAO
    {
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        public DataSet Insert(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nParihuelas", e.nParihuelas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniDescarga", e.dIniDescarga));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinDescarga", e.dFinDescarga));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniPesadoetiquetado", e.dIniPesadoetiquetado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinPesadoetiquetado", e.dFinPesadoetiquetado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniCamaragasificado", e.dIniCamaragasificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinCamaragasificado", e.dFinCamaragasificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniCargajabas", e.dIniCargajabas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinCargajabas", e.dFinCargajabas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.bEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 1));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        /// <summary>
        /// Actualiza el campo con parametro de hora o número
        /// </summary>
        /// <param name="id">nIdRecepciontiempodetalle</param>
        /// <param name="valor">número de parihuelas o fecha de inicio o fecha de fin</param>
        /// <param name="tipo">Entrada(1), Salida(2), Nada(0)</param>
        /// <returns></returns>
        public DataSet ActualizarCampoUnico(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", e.nTipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempodetalle", e.nIdRecepciontiempodetalle));
            switch (e.nTipo)
            {
                case 8: //parihuelas
                    da.SelectCommand.Parameters.Add(new SqlParameter("@nParihuelas", e.nParihuelas));
                    break;
                case 9: //descarga - INICIO
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dIniDescarga", e.dIniDescarga));
                    break;
                case 10: //descarga - FIN
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dFinDescarga", e.dFinDescarga));
                    break;
                case 11: //pesadoyetiquetado - INICIO
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dIniPesadoetiquetado", e.dIniPesadoetiquetado));
                    break;
                case 12: //pesadoyetiquetado - FIN
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dFinPesadoetiquetado", e.dFinPesadoetiquetado));
                    break;
                case 13: //gasificado - INICIO
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dIniCamaragasificado", e.dIniCamaragasificado));
                    break;
                case 14: //gasificado - FIN
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dFinCamaragasificado", e.dFinCamaragasificado));
                    break;
                case 15: //cargajabas - INICIO
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dIniCargajabas", e.dIniCargajabas));
                    break;
                case 16: //cargajabas - FIN
                    da.SelectCommand.Parameters.Add(new SqlParameter("@dFinCargajabas", e.dFinCargajabas));
                    break;
                case 17: //estado
                    da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.bEstado));
                    break;
            }
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Select(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 2));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Update(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nParihuelas", e.nParihuelas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniDescarga", e.dIniDescarga));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinDescarga", e.dFinDescarga));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniPesadoetiquetado", e.dIniPesadoetiquetado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinPesadoetiquetado", e.dFinPesadoetiquetado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniCamaragasificado", e.dIniCamaragasificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinCamaragasificado", e.dFinCamaragasificado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dIniCargajabas", e.dIniCargajabas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@dFinCargajabas", e.dFinCargajabas));
            da.SelectCommand.Parameters.Add(new SqlParameter("@bEstado", e.bEstado));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 3));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet Delete(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempodetalle", e.nIdRecepciontiempodetalle));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 4));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet OneById(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempodetalle", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 5));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }

        public DataSet ListadoPorCabeceraId(RecepciontiempodetalleBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_Recepciontiempodetalle", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdRecepciontiempo", e.nIdRecepciontiempo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nTipo", 7));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
    }
}
