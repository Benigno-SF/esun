using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_DAO;
using SFC_BE;

namespace SFC_BL
{
    public class IncidenciaBL
    {
        IncidenciaDAO dao = new IncidenciaDAO();
        public DataSet ListIncidencia(IncidenciaBE e)
        {
            return dao.ListIncidencia(e);
        }
        public DataSet IncidenciaRegi(IncidenciaBE e)
        {
            return dao.IncidenciaRegi(e);
        }
    }
}
