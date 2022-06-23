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
    public class ParametroGeneralBL
    {
        ParametroGeneralDAO dao = new ParametroGeneralDAO();

        public DataSet ListParametroGeneral(ParametroGeneralBE e)
        {
            return dao.ListParametroGeneral(e);
        }

        public DataSet Insertar(ParametroGeneralBE e)
        {
            return dao.Insertar(e);
        }

        public DataSet Actualizar(ParametroGeneralBE e)
        {
            return dao.Actualizar(e);
        }

        public DataSet OneById(ParametroGeneralBE e)
        {
            return dao.OneById(e);
        }
    }
}
