using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_DAO;
using SFC_BE;

namespace SFC_BL
{
    public class FundoBL
    {
        FundoDAO dao = new FundoDAO();
        public DataSet ListFundo(FundoBE e)
        {
            return dao.ListFundo(e);
        }
    }
}
