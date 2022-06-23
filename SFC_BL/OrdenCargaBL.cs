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
    public class OrdenCargaBL
    {
        OrdenCargaDAO dao = new OrdenCargaDAO();
        public DataSet LitOrdenCarga(OrdenCargaBE e)
        {
            return dao.LitOrdenCarga(e);
        }
        public string RegiOrdenCarga(OrdenCargaBE e, DataTable dt)
        {
            return dao.RegiOrdenCarga(e, dt);
        }
        public DataSet ListOrdenCarga(OrdenCargaBE e)
        {
            return dao.ListOrdenCarga(e);
        }



    }
}
