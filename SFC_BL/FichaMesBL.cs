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
    public class FichaMesBL
    {
        FichaMesDAO dao = new FichaMesDAO();

        public DataSet ListFichaMes(FichaMesBE e)
        {
            return dao.ListFichaMes(e);
        }

        public DataSet RegiFichaMes(FichaMesBE e)
        {
            return dao.RegiFichaMes(e);
        }
        
    }
}
