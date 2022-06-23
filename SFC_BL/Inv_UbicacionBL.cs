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
    public class Inv_UbicacionBL
    {
        Inv_UbicacionDAO dao = new Inv_UbicacionDAO();

        public DataSet List_Inv_Ubicacion(Inv_UbicacionBE e)
        {
            return dao.List_Inv_Ubicacion(e);
        }

        public DataSet Regi_Inv_Ubicacion(Inv_UbicacionBE e)
        {
            return dao.Regi_Inv_Ubicacion(e);
        }
    }
}
