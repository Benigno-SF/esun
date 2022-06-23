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
    public class LineaNavieraBL
    {
        LineaNavieraDAO dao = new LineaNavieraDAO();
        public DataSet ListLineaNaviera(LineaNavieraBE e)
        {
            return dao.ListLineaNaviera(e);
        }

        public DataSet OneById(LineaNavieraBE e)
        {
            return dao.OneById(e);
        }

        public DataSet Merge(LineaNavieraBE e)
        {
            return dao.Merge(e);
        }

        public DataSet Insertar(LineaNavieraBE e)
        {
            return dao.Insertar(e);
        }

        public DataSet Actualizar(LineaNavieraBE e)
        {
            return dao.Actualizar(e);
        }
    }
}
