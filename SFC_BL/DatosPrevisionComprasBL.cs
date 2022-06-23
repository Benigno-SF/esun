using SFC_BE;
using SFC_DAO;
using System.Data;

namespace SFC_BL
{
    public class DatosPrevisionComprasBL
    {
        DatosPrevisionComprasDAO dao = new DatosPrevisionComprasDAO();
        public DataSet UpdateDatosPrevisionCompras(DatosPrevisionComprasBE e)
        {
            //return null;
            return dao.UpdateDatosPrevisionCompras(e);
        }

        public DataSet InsertDatosPrevisionCompras(DatosPrevisionComprasBE e)
        {
            //return null;
            return dao.InsertDatosPrevisionCompras(e);
        }
    }
}
