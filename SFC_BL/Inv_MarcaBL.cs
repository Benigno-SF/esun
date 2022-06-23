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
    public class Inv_MarcaBL
    {
        Inv_MarcaDAO dao = new Inv_MarcaDAO();

        public DataSet List_Inv_Marca(Inv_MarcaBE e)
        {
            return dao.List_Inv_Marca(e);
        }

        public DataSet Regi_Inv_Marca(Inv_MarcaBE e)
        {
            return dao.Regi_Inv_Marca(e);
        }
    }
}
