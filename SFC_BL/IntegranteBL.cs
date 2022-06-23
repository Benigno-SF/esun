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
    public class IntegranteBL
    {
        IntegranteDAO dao = new IntegranteDAO();
        public DataSet ListIntegrante(IntegranteBE e)
        {
            return dao.ListIntegrante(e);
        }

        public DataSet RegiIntegrante(IntegranteBE e)
        {
            return dao.RegiIntegrante(e);
        }

        public DataSet DeleteIntegrante(IntegranteBE e)
        {
            return dao.DeleteIntegrante(e);
        }
    }
}

