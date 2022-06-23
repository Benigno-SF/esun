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
    public class ConductorBL
    {
        ConductorDAO dao = new ConductorDAO();

        public DataSet ListConductor(ConductorBE e)
        {
            return dao.ListConductor(e);
        }

        public string RegiPersonal(PersonalBE e)
        {
            return dao.RegiPersonal(e);
        }

        public string ActualizaLabor(PersonalBE e)
        {
            return dao.ActualizaLabor(e);
        }

    }
}