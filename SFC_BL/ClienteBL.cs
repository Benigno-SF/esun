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
    public class ClienteBL
    {
        ClienteDAO dao = new ClienteDAO();
        public DataSet ListCliente(ClienteBE e)
        {
            return dao.ListCliente(e);
        }

        public string[] ListClienteProductor(ClienteBE e)
        {
            return dao.ListClienteProductor(e);
        }
    }
}

