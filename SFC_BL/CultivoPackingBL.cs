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
    public class CultivoPackingBL
    {
        CultivoPackingDAO dao = new CultivoPackingDAO();
        public DataSet ListCultivoPacking(CultivoPackingBE e)
        {
            return dao.ListCultivoPacking(e);
        }
    }
}
