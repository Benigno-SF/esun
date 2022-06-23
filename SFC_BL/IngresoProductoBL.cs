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
    public class IngresoProductoBL
    {

        IngresoProductoDAO dao = new IngresoProductoDAO();
        public DataSet IngresoProductoRegi(IngresoProductoBE e)
        {
            return dao.IngresoProductoRegi(e);
        }

        public DataSet ListIngresoProducto(IngresoProductoBE e)
        {
            return dao.ListIngresoProducto(e);
        }

        public DataSet IngresoProductoDel(IngresoProductoBE e)
        {
            return dao.IngresoProductoDel(e);
        }

    }
}
