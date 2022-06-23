using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class PlanillaBL
    {
        // hacemos refencia a DAO
        PlanillaDAO dao = new PlanillaDAO();

        // funcion listar usuario
        public DataSet BL_listar_usuario(PlanillaBE obj)
        {
            return dao.DAO_listar_usuario(obj);
        }

        // funcion registro documento.
        public DataSet BL_registro_documento(PlanillaBE obj)
        {
            return dao.DAO_registro_documento(obj);
        }

        public DataSet BL_listar_documento(PlanillaBE obj)
        {
            return dao.DAO_listar_documento(obj);
        }

        public DataSet BL_listar_documento2(PlanillaBE obj)
        {
            return dao.DAO_listar_documento2(obj);
        }

        public DataSet BL_listar_documento_individual(PlanillaBE obj)
        {
            return dao.DAO_listar_documento_individual(obj);
        }

        public DataSet BL_listar_tipo_registro(PlanillaBE obj)
        {
            return dao.DAO_listar_tipo_registro(obj);
        }

        public DataSet BL_actulizar_documento(PlanillaBE obj)
        {
            return dao.DAO_actulizar_documento(obj);
        }

        public DataSet BL_anular_documento(PlanillaBE obj)
        {
            return dao.DAO_anular_documento(obj);
        }

        public DataSet BL_listar_fecha_documento(PlanillaBE obj)
        {
            return dao.DAO_listar_fecha_documento(obj);
        }

        public DataSet BL_listar_fechas(PlanillaBE obj)
        {
            return dao.DAO_listar_fechas(obj);
        }

        public DataSet BL_listar_fechas_semana(PlanillaBE obj)
        {
            return dao.DAO_listar_fechas_semana(obj);
        }

        public DataSet BL_cerrar_semana_datos(PlanillaBE obj)
        {
            return dao.DAO_cerrar_semana_datos(obj);
        }

        public DataSet BL_filtrar_semana_datos(PlanillaBE obj)
        {
            return dao.DAO_filtrar_semana_datos(obj);
        }

        public DataSet BL_obtener_privilegio(PlanillaBE obj)
        {
            return dao.DAO_obtener_privilegio(obj);
        }

        public DataSet BL_registrar_cierre_semana_datos(PlanillaBE obj)
        {
            return dao.DAO_registrar_cierre_semana_datos(obj);
        }

        public DataSet BL_aprobar_documento(PlanillaBE obj)
        {
            return dao.DAO_aprobar_documento(obj);
        }

        public DataSet BL_update_semana(PlanillaBE obj)
        {
            return dao.DAO_update_semana(obj);
        }

        public DataSet BL_consulta_documento_cerrado(PlanillaBE obj)
        {
            return dao.DAO_consulta_documento_cerrado(obj);
        }

        public DataSet BL_bloquear_boton(PlanillaBE obj)
        {
            return dao.DAO_bloquear_boton(obj);
        }

        public DataSet BL_listar_anio(PlanillaBE obj)
        {
            return dao.DAO_listar_anio(obj);
        }

        public DataSet BL_listar_semana(PlanillaBE obj)
        {
            return dao.DAO_listar_semana(obj);
        }

        public DataSet BL_listar_semana_anio(PlanillaBE obj)
        {
            return dao.DAO_listar_semana_anio(obj);
        }

        public DataSet BL_listar_semana_actual(PlanillaBE obj)
        {
            return dao.BL_listar_semana_actual(obj);
        }

        public string[] Array_listar_diagnostico(PlanillaBE e)
        {
            return dao.BL_listar_diagnostico_ini(e);
        }

    }
}