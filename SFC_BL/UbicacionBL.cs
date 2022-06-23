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
    public class UbicacionBL
    {
        UbicacionDAO dao = new UbicacionDAO();
        public DataSet ListUbicacion(UbicacionBE e)
        {
            return dao.ListUbicacion(e);
        }
        public DataSet ListUbicPale(UbicacionBE e)
        {
            return dao.ListUbicPale(e);
        }
        public DataSet ListUbicInfo(UbicacionBE e)
        {
            return dao.ListUbicInfo(e);
        }
    }
}
