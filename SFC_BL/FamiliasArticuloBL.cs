using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class FamiliasArticuloBL
    {
        FamiliasArticuloDAO dao = new FamiliasArticuloDAO();
        public DataSet Listado()
        {
            return dao.Listado();
        }
    }
}
