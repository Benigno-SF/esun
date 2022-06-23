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
    public class Inv_IncidenciaBL
    {
        Inv_IncidenciaDAO dao = new Inv_IncidenciaDAO();

        public DataSet List_Inv_Incidencia(Inv_IncidenciaBE e)
        {
            return dao.List_Inv_Incidencia(e);
        }

        public DataSet Regi_Inv_Incidencia(Inv_IncidenciaBE e)
        {
            return dao.Regi_Inv_Incidencia(e);
        }
    }
}
