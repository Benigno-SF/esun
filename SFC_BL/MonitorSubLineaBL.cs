using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class MonitorSubLineaBL
    {
        MonitorSubLineaDAO dao = new MonitorSubLineaDAO();
        public DataSet ListMonitor(MonitorSubLineaBE e)
        {
            return dao.ListMonitor(e);
        }

        public DataSet ListSubLineArea(MonitorSubLineaBE e)
        {
            return dao.ListSubLineArea(e);
        }

        public DataSet ListMonitorSubLinea(MonitorSubLineaBE e)
        {
            return dao.ListMonitorSubLinea(e);
        }


    }
}
