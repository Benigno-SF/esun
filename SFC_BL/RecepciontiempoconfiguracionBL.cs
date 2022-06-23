using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class RecepciontiempoconfiguracionBL
    {
        private RecepciontiempoconfiguracionDAO dao;

        public RecepciontiempoconfiguracionBL()
        {
            dao = new RecepciontiempoconfiguracionDAO();
        }

        public DataSet Select(RecepciontiempoconfiguracionBE e)
        {
            return dao.Select(e);
        }

        public DataSet Update(RecepciontiempoconfiguracionBE e)
        {
            return dao.Update(e);
        }

        public DataSet OneById(RecepciontiempoconfiguracionBE e)
        {
            return dao.OneById(e);
        }

        public DataSet Actualizarminmax(RecepciontiempoconfiguracionBE e)
        {
            return dao.Actualizarminmax(e);
        }
    }
}
