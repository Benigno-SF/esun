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
    public class FormatoDetalleBL
    {
        FormatoDetalleDAO dao = new FormatoDetalleDAO();
        public DataSet ListFormDeta(FormatoDetalleBE e)
        {
            return dao.ListFormDeta(e);
        }

    }
}
