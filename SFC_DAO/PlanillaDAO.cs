using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;
using System.Collections.Generic;

namespace SFC_DAO
{
    public class PlanillaDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        // funcion registrar usuario
        public DataSet DAO_listar_usuario(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SP_Personal_List]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.USUARIO_DNI));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidPlanilla", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoLabor", ""));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion registro documento.
        public DataSet DAO_registro_documento(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_INSERTAR_DOCUMENTO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FECHA_REGISTRO", e.DOCUMENTO_FECHA_REGISTRO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FECHA_INICIO", e.DOCUMENTO_FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FECHA_FIN", e.DOCUMENTO_FECHA_FIN));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_DIAS", e.DOCUMENTO_DIAS));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_CMP", e.DOCUMENTO_CMP));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_CODIGO_DIAGNOSTICO", e.DOCUMENTO_CODIGO_DIAGNOSTICO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_DIAGNOSTICO", e.DOCUMENTO_DIAGNOSTICO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_OBSERVACIONES", e.DOCUMENTO_OBSERVACIONES));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_PROVIENE", e.DOCUMENTO_PROVIENE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_MOTIVO", e.DOCUMENTO_MOTIVO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_DOCUMENTACION", e.DOCUMENTO_DOCUMENTACION));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_HORAS", e.DOCUMENTO_HORAS));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_LACTANTE", e.DOCUMENTO_LACTANTE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_VINCULO_FAMILIAR", e.DOCUMENTO_VINCULO_FAMILIAR));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FALLECIDO", e.DOCUMENTO_FALLECIDO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_CASO", e.DOCUMENTO_CASO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_ESTADO", e.DOCUMENTO_ESTADO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_USUARIO", e.DOCUMENTO_USUARIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_USUARIO_MODIFICADO", e.DOCUMENTO_USUARIO_MODIFICADO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_TIPO_DOCUMENTO_ID", e.DOCUMENTO_TIPO_DOCUMENTO_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_PERSONAL_ID", e.DOCUMENTO_PERSONAL_ID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_documento(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_DOCUMENTOS", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_ACTAUL_SISTEMA", e.FECHA_ACTAUL_SISTEMA));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_documento2(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_DOCUMENTOS_INI", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_ACTAUL_SISTEMA", e.FECHA_ACTAUL_SISTEMA));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_documento_individual(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_DOCUMENTO_INDIVIDUAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ID_DOCUMENTO", e.DOCUMENTO_ID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_tipo_registro(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_TIPO_REGISTRO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_actulizar_documento(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ACTUALIZAR_DOCUMENTO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_ID", e.DOCUMENTO_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FECHA_REGISTRO", e.DOCUMENTO_FECHA_REGISTRO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FECHA_INICIO", e.DOCUMENTO_FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FECHA_FIN", e.DOCUMENTO_FECHA_FIN));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_DIAS", e.DOCUMENTO_DIAS));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_CMP", e.DOCUMENTO_CMP));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_CODIGO_DIAGNOSTICO", e.DOCUMENTO_CODIGO_DIAGNOSTICO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_DIAGNOSTICO", e.DOCUMENTO_DIAGNOSTICO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_OBSERVACIONES", e.DOCUMENTO_OBSERVACIONES));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_PROVIENE", e.DOCUMENTO_PROVIENE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_MOTIVO", e.DOCUMENTO_MOTIVO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_DOCUMENTACION", e.DOCUMENTO_DOCUMENTACION));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_HORAS", e.DOCUMENTO_HORAS));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_LACTANTE", e.DOCUMENTO_LACTANTE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_VINCULO_FAMILIAR", e.DOCUMENTO_VINCULO_FAMILIAR));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_FALLECIDO", e.DOCUMENTO_FALLECIDO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_CASO", e.DOCUMENTO_CASO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_USUARIO_MODIFICADO", e.DOCUMENTO_USUARIO_MODIFICADO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_TIPO_DOCUMENTO_ID", e.DOCUMENTO_TIPO_DOCUMENTO_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_PERSONAL_ID", e.DOCUMENTO_PERSONAL_ID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_anular_documento(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_ANULAR_DOCUMENTO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_ID", e.DOCUMENTO_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_ESTADO", e.DOCUMENTO_ESTADO));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_fecha_documento(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FILTRO_FECHAS", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_INICIO", e.FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_FIN", e.FECHA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_fechas(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("LISTAR_FECHAS", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_ID", e.CERRAR_SEMANA_ID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_fechas_semana(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_SEMANAS", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@APERTURA_SEM_ANIO", e.APERTURA_SEM_ANIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@APERTURA_SEM_ID", e.APERTURA_SEM_ID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_cerrar_semana_datos(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CERRAR_SEMANA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_ID", e.CERRAR_SEMANA_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_ANIO", e.CERRAR_SEMANA_ANIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_INICIO", e.FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_FIN", e.FECHA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_filtrar_semana_datos(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_FILTRAR_SEMANA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@FILTRO_FECHA_INI", e.FILTRO_FECHA_INI));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FILTRO_FIN", e.FILTRO_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_obtener_privilegio(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_PRIVILEGIO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_registrar_cierre_semana_datos(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_INSERTAR_CERRAR_SEMANA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_ID", e.CERRAR_SEMANA_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_ANIO", e.CERRAR_SEMANA_ANIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_FECHA_INI", e.CERRAR_SEMANA_FECHA_INI));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CERRAR_SEMANA_FIN", e.CERRAR_SEMANA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet DAO_aprobar_documento(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_APROBAR_DOCUMENTO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_ID", e.DOCUMENTO_ID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DOCUMENTO_ESTADO", e.DOCUMENTO_ESTADO));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_update_semana(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CERRAR_SEMANA_UPDATE", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_INICIO", e.FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_FIN", e.FECHA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_consulta_documento_cerrado(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_SEMANA_SIN_CERRAR", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_INICIO", e.FECHA_INICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_FIN", e.FECHA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_bloquear_boton(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_CONSULTA_SEMANA_APERTURADA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_INICIO", e.FECHA_INICIO));
            //da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_FIN", e.FECHA_FIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_anio(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_ANIO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
        public DataSet DAO_listar_semana(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_SEMANA", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_semana_anio(PlanillaBE e)
        {
            cnx = con.conectar();
            //da = new SqlDataAdapter("SP_LISTAR_SEMANA_ANIO", cnx);
            da = new SqlDataAdapter("SFE_SEMANA_ULTIMO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.Add(new SqlParameter("@ANIO", e.APERTURA_SEM_ANIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ANIO", e.SEMANA_ANIO_LIST));
            da.SelectCommand.Parameters.Add(new SqlParameter("@MES", e.SEMANA_ANIO_MES));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet BL_listar_semana_actual(PlanillaBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SP_LISTAR_SEMANA_ACTUAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_ACTAUL_SISTEMA", e.FECHA_ACTAUL_SISTEMA));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public string[] BL_listar_diagnostico_ini(PlanillaBE e)
        {
            List<string> lstDiagnostico = new List<string>();

            cnx = con.conectar();
            cmd = new SqlCommand("SP_LISTAR_DIAGNOSTICO_INI", cnx);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@COD_DIAGNOSTICO", e.DOCUMENTO_CODIGO_DIAGNOSTICO));
            cnx.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                lstDiagnostico.Add(string.Format("{0}", reader["DIAGNOSTICO"]));
            }
            cnx.Close();
            return lstDiagnostico.ToArray();
        }
    }
}