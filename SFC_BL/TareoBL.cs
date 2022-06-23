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
    public class TareoBL
    {
        // hacemos refencia a DAO
        TareoDAO dao = new TareoDAO();

        // funcion listar dat usario
        public DataSet BL_listar_data_usuario(TareoBE obj)
        {
            return dao.DAO_listtar_data_usuario(obj);
        }

        // funcion registrar grupos
        public DataSet BL_registrar_grupo(TareoBE obj)
        {
            return dao.DAO_registrar_grupo(obj);
        }

        // funcion registrar detalle grupos
        public DataSet BL_registrar_detalle_grupo(TareoBE obj)
        {
            return dao.DAO_registrar_detalle_grupo(obj);
        }

        // funcion listar grupos
        public DataSet BL_listar_grupo(TareoBE obj)
        {
            return dao.DAO_listar_grupo(obj);
        }

        public DataSet BuscarNombrePorDni(TareoBE e)
        {
            return dao.buscarNombrePorDni(e);
        }

        public DataSet BL_listar_detalle_grupo(TareoBE obj)
        {
            return dao.DAO_listar_detalle_grupo(obj);
        }

        public DataSet BL_listar_labor_combinaciones(TareoBE obj)
        {
            return dao.DAO_listar_labor_combinaciones(obj);
        }

        public DataSet BL_eliminar_detalle_grupo(TareoBE obj)
        {
            return dao.DAO_eliminar_detalle_grupo(obj);
        }

        public DataSet BL_listar_tareo(TareoBE obj)
        {
            return dao.DAO_listar_tareo(obj);
        }

        public DataSet BL_registrar_cabecera_tareo(TareoBE obj)
        {
            return dao.DAO_registrar_cabecera_tareo(obj);
        }

        public DataSet BL_registrar_combinaciones(TareoBE obj)
        {
            return dao.DAO_registrar_combinaciones(obj);
        }

        public DataSet BL_registrar_trabajador_por_labor(TareoBE obj)
        {
            return dao.DAO_registrar_trabajador_por_labor(obj);
        }

        public DataSet BL_registrar_avance_trab(TareoBE obj)
        {
            return dao.DAO_registrar_avance_trab(obj);
        }

        public DataSet BL_editar_rend_trabajador(TareoBE obj)
        {
            return dao.DAO_editar_rend_trabajador(obj);
        }

        public DataSet BL_listar_rend_trab_up(TareoBE obj)
        {
            return dao.DAO_listar_rend_trab_up(obj);
        }

        public DataSet BL_listar_zona(TareoBE obj)
        {
            return dao.DAO_listar_zona(obj);
        }

        public DataSet BL_editar_jornal_trabajador_indiv(TareoBE obj)
        {
            return dao.DAO_editar_jornal_trabajador_indiv(obj);
        }

        public DataSet BL_listar_x_labor(TareoBE obj)
        {
            return dao.DAO_listar_x_labor(obj);
        }

        public DataSet BL_listar_x_labor2(TareoBE obj)
        {
            return dao.DAO_listar_x_labor1(obj);
        }

        public DataSet BL_eliminar_grupo(TareoBE obj)
        {
            return dao.DAO_eliminar_grupo(obj);
        }

        public DataSet BL_listar_envase(TareoBE obj)
        {
            return dao.DAO_listar_envase(obj);
        }

        public DataSet BL_eliminar_trab_por_jornal(TareoBE obj)
        {
            return dao.DAO_eliminar_trab_por_jornal(obj);
        }

    }
}