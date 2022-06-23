using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class EspecificacionMonitorBL
    {
        EspecificacionMonitorDAO dao = new EspecificacionMonitorDAO();

        public DataSet Canal(int e)
        {
            return dao.Canal(e);
        }

    }
}
