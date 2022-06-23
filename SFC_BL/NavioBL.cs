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
    public class NavioBL
    {
        NavioDAO dao = new NavioDAO();
        public DataSet ListNavio(NavioBE e)
        {
            return dao.ListNavio(e);
        }

        public DataSet Insertar(NavioBE e)
        {
            return dao.Insertar(e);
        }

        public DataSet Actualizar(NavioBE e)
        {
            return dao.Actualizar(e);
        }

        public DataSet OneById(NavioBE e)
        {
            return dao.OneById(e);
        }
    }
}
