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
    public class UnidadNegBL
    {
        UnidadNegDAO dao = new UnidadNegDAO();
        public string[] GetUnidNeg(UnidadNegBE e)
        {
            return dao.GetUnidNeg(e);
        }
        public DataSet ListUnidNeg(UnidadNegBE e)
        {
            return dao.ListUnidNeg(e);
        }
        public DataSet ListUnidNegFundo(UnidadNegBE e)
        {
            return dao.ListUnidNegFundo(e);
        }
    }
}
