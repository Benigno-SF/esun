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
    public class AreaProcesoBL
    {
        AreaProcesoDAO dao = new AreaProcesoDAO();
        public DataSet ListAreaProceso(AreaProcesoBE e)
        {
            return dao.ListAreaProceso(e);
        }
    }
}
