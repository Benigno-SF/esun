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
    public class EmbalajeBL
    {
        EmbalajeDAO dao = new EmbalajeDAO();
        public DataSet ListEmbalaje(EmbalajeBE e)
        {
            return dao.ListEmbalaje(e);
        }

        public DataSet ListEmbalajec(EmbalajeBE e)
        {
            return dao.ListEmbalajec(e);
        }
    }
}