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
    public class ContabilidadBL
    {
        ContabilidadDAO dao = new ContabilidadDAO();

        public DataSet InventarioRegi(ContabilidadBE e, DataTable dtx)
        {
            return dao.InventarioRegi(e, dtx);
        }
    }
}

