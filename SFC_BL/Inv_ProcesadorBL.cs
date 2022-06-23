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
    public class Inv_ProcesadorBL
    {
        Inv_ProcesadorDAO dao = new Inv_ProcesadorDAO();

        public DataSet List_Inv_Procesador(Inv_ProcesadorBE e)
        {
            return dao.List_Inv_Procesador(e);
        }

        public DataSet Regi_Inv_Procesador(Inv_ProcesadorBE e)
        {
            return dao.Regi_Inv_Procesador(e);
        }
    }
}
