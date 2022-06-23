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
    public class PersonaBL
    {
        PersonaDAO dao = new PersonaDAO();
        
        public int DeleteSeleccion(PersonaBE e)
        {
            return dao.DeleteSeleccion(e);
        }

        public int SeleccionarPersonal(PersonaBE e)
        {
            return dao.SeleccionarPersonal(e);
        }

        public DataSet ListPreInscripcion(PersonaBE e)
        {
            return dao.ListPreInscripcion(e);
        }
        
         public int UpdateInfoPersona(PersonaBE e)
        {
            return dao.UpdateInfoPersona(e);
        }
        public DataSet ListPersona(PersonaBE e)
        {
            return dao.ListPersona(e);
        }

        public DataSet ListPersona2x(PersonaBE e)
        {
            return dao.ListPersona2x(e);
        }

        public int RegiPersona(PersonaBE e)
        {
            return dao.RegiPersona(e);
        }

        public string[] ArrayPersona(PersonaBE e)
        {
            return dao.ArrayPersona(e);
        }

    }
}

