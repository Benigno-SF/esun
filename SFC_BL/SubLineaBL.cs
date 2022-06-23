using System.Data;
using SFC_BE;
using SFC_DAO;

namespace SFC_BL
{
    public class SubLineaBL
    {
        SubLineaDAO dao = new SubLineaDAO();

        public DataSet ListSubLinea(SubLineaBE e)
        {
            return dao.ListSubLinea(e);
        }
    }
}
