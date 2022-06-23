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
    public class Inv_AreaBL
    {
        Inv_AreaDAO dao = new Inv_AreaDAO();

        public DataSet List_Inv_Area(Inv_AreaBE e)
        {
            return dao.Inv_AreaList(e);
        }

        public DataSet Regi_Inv_Area(Inv_AreaBE e)
        {
            return dao.Regi_Inv_Area(e);
        }
    }
}
