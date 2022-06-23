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
    public class PalletMovBL
    {
        PalletMovDAO dao = new PalletMovDAO();
        public String RegiPalletMov(PalletMovBE e)
        {
            return dao.RegiPalletMov(e);
        }
        public DataSet ListPalletEx(PalletMovBE e)
        {
            return dao.ListPalletEx(e);
        }
    }
}
