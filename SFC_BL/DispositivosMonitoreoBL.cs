using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class DispositivosMonitoreoBL
    {
        DispositivosMonitoreoDAO dao = new DispositivosMonitoreoDAO();

        public DataSet Listado()
        {
            return dao.Listado();
        }

        public DataSet Merge(DispositivosMonitoreoBE e)
        {
            return dao.Merge(e);
        }

        public DataSet Servicio(string Ip, int Bateria)
        {
            return dao.Servicio(Ip, Bateria);
        }

        public DataSet Servicio_Url(string Ip)
        {
            return dao.Servicio_Url(Ip);
        }
    }
}
