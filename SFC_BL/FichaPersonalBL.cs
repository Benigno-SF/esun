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
    public class FichaPersonalBL
    {
        FichaPersonalDAO dao = new FichaPersonalDAO();

        public DataSet FichaPersonalList(FichaPersonalBE e)
        {
            return dao.FichaPersonalList(e);
        }

        public DataSet RepFichaPersonal(FichaPersonalBE e)
        {
            return dao.RepFichaPersonal(e);
        }

        public DataSet ReporteReparaciones(FichaPersonalBE e)
        {
            return dao.ReporteReparaciones(e);
        }


    }
}
