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
    public class Inv_AntivirusBL
    {
        Inv_AntivirusDAO dao = new Inv_AntivirusDAO();

        public DataSet List_Inv_Antivirus(Inv_AntivirusBE e)
        {
            return dao.List_Inv_Antivirus(e);
        }

        public DataSet Regi_Inv_Antivirus(Inv_AntivirusBE e)
        {
            return dao.Regi_Inv_Antivirus(e);
        }
    }
}
