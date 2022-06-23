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
    public class EmpresaBL
    {
        EmpresaDAO dao = new EmpresaDAO();

        public DataSet OneById(EmpresaBE e)
        {
            return dao.OneById(e);
        }

        public DataSet Listado()
        {
            return dao.Listado();
        }
    }
}
