using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class ClientesYProductoreBL
    {
        ClientesYProductoresDAO dao = new ClientesYProductoresDAO();
        public DataSet List(string e)
        {
            return dao.List(e);
        }
    }
}
