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
    public class PersonalBL
    {
        PersonalDAO dao = new PersonalDAO();
        TablaCecoBE cecodao = new TablaCecoBE();
        public DataSet ListPersonalNS(PersonalBE e)
        {
            return dao.ListPersonalNS(e);
        }

        public DataSet ListPersonal(PersonalBE e)
        {
            return dao.ListPersonal(e);
        }

        public DataSet ListPersonalNisira(PersonalBE e)
        {
            return dao.ListPersonalNisira(e); 
        }

        public DataSet ListPersonalNuevo(PersonalBE e)
        {
            return dao.ListPersonalNuevo(e); 
        }

        public DataSet ConsultaUtilidad(PersonalBE e)
        {
            return dao.ConsultaUtilidad(e);
        }

        public DataSet VerificaPersonal(PersonalBE e)
        {
            return dao.VerificaPersonal(e);
        }

        public DataSet UpdatePersonalNisira(PersonalBE e)
        {
            return dao.UpdatePersonalNisira(e);
        }

        public string RegiPersonal(PersonalBE e)
        {
            return dao.RegiPersonal(e);
        }

        public string RegiPersonalNuevo(PersonalBE e)
        {
            return dao.RegiPersonalNuevo(e);
        }

        public DataSet RegiPersonalNuevo2(PersonalBE e)
        {
            return dao.RegiPersonalNuevo2(e); 
        }
        public DataSet DeletePersonalNuevo(PersonalBE e)
        {
            return dao.DeletePersonalNuevo(e);
        }

        public string[] ArrayPersonal(PersonalBE e)
        {
            return dao.ArrayPersonal(e);
        }

        public string ActualizaLabor(PersonalBE e)
        {
            return dao.ActualizaLabor(e);
        }

        public DataSet ActualizaPersonal(PersonalBE e)
        {
            return dao.ActualizaPersonal(e);
        }

        public int InsertarDataTable(string IdDocumento,
            string Apellidos_Nombres,
            string Cod_Planilla,
            string C_Costo,
            string Cod_Sucursal,
            string Cod_Actividad,
            string Cod_Labor,
            string Fecha_Inicio,
            string Fecha_Final,
            float Porcentaje)
        {
            return dao.InsertardataTableDAO(IdDocumento, Apellidos_Nombres, Cod_Planilla, C_Costo, Cod_Sucursal, Cod_Actividad, Cod_Labor, Fecha_Inicio, Fecha_Final, Porcentaje);
        }

        public int InsertarDataTableII(TablaCecoBE objeto)
        {
            return dao.InsertardataTableDAOII(objeto);
        }

        public List<string> EliminarTabla(string h)
        {
            return dao.EliminarTabla(h);
        }

    }
}
