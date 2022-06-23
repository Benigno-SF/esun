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
    public class Inv_AsignacionBL
    {
        Inv_AsignacionDAO dao = new Inv_AsignacionDAO();

        public DataSet List_Inv_Asignacion(Inv_AsignacionBE e)
        {
            return dao.List_Inv_Asignacion(e);
        }

        public DataSet Regi_Inv_Asignacion(Inv_AsignacionBE e)
        {
            return dao.Regi_Inv_Asignacion(e);
        }
    }
}
