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
    public class PiscinaBL
    {
        PiscinaDAO dao = new PiscinaDAO();

        public DataSet Leer(int e)
        {
            return dao.Leer(e);
        }

        public DataSet Listado()
        {
            return dao.Listado();
        }
    }
}
