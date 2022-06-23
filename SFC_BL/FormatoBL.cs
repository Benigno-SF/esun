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
    public class FormatoBL
    {
        FormatoDAO dao = new FormatoDAO();
        public DataSet ListFormUser(FormatoBE e)
        {
            return dao.ListFormUser(e);
        }
        public DataSet ListForm(FormatoBE e)
        {
            return dao.ListForm(e);
        }

    }
}
