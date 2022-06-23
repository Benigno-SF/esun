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
    public class ClienteProdBL
    {
        ClienteProdDAO dao = new ClienteProdDAO();
        public string[] ArrayClienteProd(ClienteProdBE e)
        {
            return dao.ArrayClienteProd(e);
        }

        public DataSet RegiClienteProd(ClienteProdBE e)
        {
            return dao.RegiClienteProd(e);
        }

        public DataSet ListClienteProdExp(ClienteProdBE e)
        {
            return dao.ListClienteProdExp(e);
        }

        //public DataSet ListClienteProdExt(ClienteProdBE e)
        //{
        //    return dao.ListClienteProdExt(e);
        //}
    }
}
