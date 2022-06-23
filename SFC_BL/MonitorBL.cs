using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class MonitorBL
    {
        MonitorDAO dao = new MonitorDAO();
        public DataSet ListMonitor(MonitorBE e)
        {
            return dao.ListMonitor(e);
        }

        public DataSet ListMonitorArea(MonitorBE e)
        {
            return dao.ListMonitorArea(e);
        }
    }
}
