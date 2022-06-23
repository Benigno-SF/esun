using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class ProveedorAlmacenBL
    {
        ProveedorAlmacenDAO dao = new ProveedorAlmacenDAO();

        public DataSet ListAlmacenPorProveedor(int e)
        {
            return dao.ListAlmacenPorProveedor(e);
        }
    }
}
