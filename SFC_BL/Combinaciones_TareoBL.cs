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
    public class Combinaciones_TareoBL
    {
        // hacemos refencia a DAO
        Combinaciones_TareoDAO dao = new Combinaciones_TareoDAO();

        public DataSet BL_listar_combinaciones(Combinaciones_TareoBE obj)
        {
            return dao.DAO_listar_combinaciones(obj);
        }
    }
}
