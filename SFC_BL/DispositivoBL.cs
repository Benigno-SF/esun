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
    public class DispositivoBL
    {
        DispositivoDAO dao = new DispositivoDAO();
        public DataSet ListDispositivos(DispositivoBE e)
        {
            return dao.ListDispositivos(e);
        }
        public DataSet ListDispositivosChild(DispositivoBE e)
        {
            return dao.ListDispositivosChild(e);
        }
    }
}
