using System;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using System.Configuration;


namespace SFC_DAO
{
    public class TareoDAO
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        ConexionDAO con = new ConexionDAO();
        SqlConnection cnx;

        // funcion listar dta usairio
        public DataSet DAO_listtar_data_usuario(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SP_Personal_List]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdEmpresa", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@nIdPersonal", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNroDocumento", e.DNI));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cNombres", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidPlanilla", ""));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cCodigoLabor", ""));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion para registrar grupos
        public DataSet DAO_registrar_grupo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_GUARDAR_GRUPOS_TAREO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@COD_RESP", e.vdnirespgrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DATOS_RESP", e.vdatosrespgrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDUSUARIO", e.vusuariogrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_GRUPO", e.vfechagrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ITEM", e.META));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDTAREO", e.vidtareo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDENVASE", e.videnvase));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion para registrar detalle grupos
        public DataSet DAO_registrar_detalle_grupo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_GRABAR_DGRUPOS_TAREO]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISIDGT", e.vdid));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISITEM", e.vditem));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISCOD_TRAB", e.vdcodtrabajdor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISDATOS_TRAB", e.vddatostrabajdor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vdtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@META", e.vdmeta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDTAREO", e.vidtareo_detalle));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion para listar grupos
        //LISTAR LOS GRUPOS DEL TAREADOR

        public DataSet DAO_listar_grupo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_LISTAR_GRUPOS_TAREO]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISIDUSUARIO", e.vusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISFECHA_GRUPO", e.vtfehcagrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDGRUPO", e.idgrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.AVCITEMID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }



        public DataSet buscarNombrePorDni(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_FILTRAR_TRABXREND", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TARID ", e.vctg30targrupoid));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID  ", e.AVCITEMID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CNOMBRE  ", e.nombre));
            DataSet dsx = new DataSet();
            da.Fill(dsx, "get");
            cnx.Close();
            return dsx;
        }
        public DataSet DAO_listar_detalle_grupo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_LISTAR_GRUPOS_TAREO_1]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISIDUSUARIO", e.vusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISFECHA_GRUPO", e.vtfehcagrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDGRUPO", e.idgrupo));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        public DataSet DAO_listar_labor_combinaciones(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_OBTENER_TABLASTAREO_DINAMICO]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISEMPRESA", e.vrgempresa));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISBASEDATOS", e.vrgbaseddatos));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vrgtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDACTIVIDAD ", e.vridactividad));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA_GRUPO", e.vrgfecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@USUARIO", e.vrusuario));

            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion para registrar detalle grupos
        public DataSet DAO_eliminar_detalle_grupo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_GRABAR_DGRUPOS_TAREO]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISIDGT", e.vdid));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISITEM", e.vditem));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISCOD_TRAB", e.vdcodtrabajdor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISDATOS_TRAB", e.vddatostrabajdor));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vdtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@META", e.vdmeta));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDTAREO", e.vidtareo_detalle));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion para listar TAREO
        public DataSet DAO_listar_tareo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SN_RPT_TAREO_LIST]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.vtareocabid));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.vtareocabfecha));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.vtareocabtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.vtitem_ini));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cidresponsable", e.idResponsable));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion registrra cabecera tareo
        public DataSet DAO_registrar_cabecera_tareo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_INSERTAR_CABECERA_TAREO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDUSUARIO", e.TUSUARIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30RESPSUPERIORID", e.TCTG30RESPONSABLE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDPLANILLA", e.TCIDPLANILLA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDSUCURSAL", e.TIDSUCURSAL));
            da.SelectCommand.Parameters.Add(new SqlParameter("@FECHA", e.TFECHA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IHABILITADO", e.TESTADO));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion registrra combinaciones
        public DataSet DAO_registrar_combinaciones(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_INSERTAR_LABOR", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TARID", e.CCTG30TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30ACTID", e.CCTG30ACTID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDTURNO", e.CCIDTURNO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30LABID", e.CCTG30LABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDTIPOGENASISTENCIA", e.CIDTIPOGENASISTENCIA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CDESCTIPOGENASISTENCIA", e.CCDESCTIPOGENASISTENCIA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDSUPERVISOR", e.CCIDSUPERVISOR));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDRESPONSABLE", e.CCIDRESPONSABLE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CDESCRESPONSABLE", e.CCDESCRESPONSABLE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CIDGRUPO", e.CCIDGRUPO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CDESCGRUPO", e.CCCDESCGRUPO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30CONSID", e.CCTG30CONSID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDGT", e.IDGT));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion registrra trabajdor por albor
        public DataSet DAO_registrar_trabajador_por_labor(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_ACTUALIZAR_TRABXLABOR_MASIVO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG20TARID", e.CTCTG20TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TRABID", e.CTCTG30TRABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.CTCITEM));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DHORAINICIO", e.CTDHORAINICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DHORAFIN", e.CTDHORAFIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion avance trabakdor
        public DataSet DAO_registrar_avance_trab(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_INSERTAR_RENDIMIENTO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TARID", e.AVCTG30TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TRABID", e.AVCTG30TRABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IRENDIMIENTO", e.AVIRENDIMIENTO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.AVCITEMID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion aeditar rend trabahdo
        public DataSet DAO_editar_rend_trabajador(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_ACTUALIZAR_RENDIMIENTO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TARID", e.RTCTG30TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TRABID", e.RTCTG30TRABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IRENDIMIENTO", e.RTIRENDIMIENTO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.RTCITEMID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CDITEMID", e.RTCDITEMID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEM", e.RTCITEM));

            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion lustra rend trajo up
        public DataSet DAO_listar_rend_trab_up(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SN_RPT_TAREO_LIST_UP]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@cUsuario", e.LRTcUsuario_up));
            da.SelectCommand.Parameters.Add(new SqlParameter("@cFecha", e.LRTcFecha_up));
            da.SelectCommand.Parameters.Add(new SqlParameter("@tipo", e.LRTtipo_up));
            da.SelectCommand.Parameters.Add(new SqlParameter("@item", e.LRTitem_up));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion editar jornal trab ajador
        public DataSet DAO_editar_jornal_trabajador_indiv(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_ACTUALIZAR_TRABXLABOR]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG20TARID", e.LTJCTG20TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TRABID", e.LTJCTG30TRABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.LTJCITEMID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DHORAINICIO", e.LTJDHORAINICIO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@DHORAFIN", e.LTJDHORAFIN));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // funcion listar zona
        public DataSet DAO_listar_zona(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_CONSUMIDORXZONA]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDZONA", e.ZID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // listrar trabaaidor pro albor
        public DataSet DAO_listar_x_labor(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_LISTAR_GRUPOS_TAREO]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISIDUSUARIO", e.vusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISFECHA_GRUPO", e.vtfehcagrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDGRUPO", e.idgrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.vcitem));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // listrar trabaaidor pro albor
        public DataSet DAO_listar_x_labor1(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("[SFE_LISTAR_GRUPOS_TAREO_1]", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISIDUSUARIO", e.vusuario));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISFECHA_GRUPO", e.vtfehcagrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@ISTIPO", e.vtipo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDGRUPO", e.idgrupo));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.vcitem));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // listrar elimianr frupo
        public DataSet DAO_eliminar_grupo(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_ELIMINAR_TAREO", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TARID", e.grupo_elim_CTG30TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@TABLA", e.grupo_elim_TABLA));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CSERIE", e.grupo_elim_CSERIE));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CNUMERO", e.grupo_elim_CNUMERO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TRABID", e.grupo_elim_CTG30TRABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.grupo_elim_CITEMID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEM", e.grupo_elim_CITEM));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30ACTID", e.grupo_elim_CTG30ACTID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30LABID", e.grupo_elim_CTG30LABID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30CONSID", e.grupo_elim_CTG30CONSID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@IDGT", e.grupo_elim_IDGT));
            da.SelectCommand.Parameters.Add(new SqlParameter("@COD_RESP", e.grupo_elim_COD_RESP));
            da.SelectCommand.Parameters.Add(new SqlParameter("@NRO_GRUPO", e.grupo_elim_NRO_GRUPO));
            da.SelectCommand.Parameters.Add(new SqlParameter("@COD_TRAB", e.grupo_elim_COD_TRAB));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        //  listar envase
        public DataSet DAO_listar_envase(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_LISTAR_ENVASE", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }

        // elimianr trabajdor poor labor
        public DataSet DAO_eliminar_trab_por_jornal(TareoBE e)
        {
            cnx = con.conectar();
            da = new SqlDataAdapter("SFE_ELIMINAR_TRABAJADOR_JORNAL", cnx);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TARID", e.jornal_elim_CTG30TARID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CITEMID", e.jornal_elim_CITEMID));
            da.SelectCommand.Parameters.Add(new SqlParameter("@CTG30TRABID", e.jornal_elim_CTG30TRABID));
            DataSet ds = new DataSet();
            da.Fill(ds, "get");
            cnx.Close();
            return ds;
        }
    }
}