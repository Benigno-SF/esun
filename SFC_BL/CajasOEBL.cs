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
    public class CajasOEBL
    {
        CajasOEDAO dao = new CajasOEDAO();
        public DataSet RegiCajasOE(CajasOEBE e)
        {
            return dao.RegiCajasOE(e);
        }
        
        public DataSet CajasOEList(CajasOEBE e)
        {
            return dao.CajasOEList(e);
        }

        public DataSet CajasOEDelete(CajasOEBE e)
        {
            return dao.CajasOEDelete(e);
        }
        
    }
}
