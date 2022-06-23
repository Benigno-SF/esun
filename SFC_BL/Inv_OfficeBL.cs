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
    public class Inv_OfficeBL
    {
        Inv_OfficeDAO dao = new Inv_OfficeDAO();

        public DataSet List_Inv_Office(Inv_OfficeBE e)
        {
            return dao.List_Inv_Office(e);
        }

        public DataSet Regi_Inv_Office(Inv_OfficeBE e)
        {
            return dao.Regi_Inv_Office(e);
        }
    }
}
