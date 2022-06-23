using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using SFC_DAO;
using SFC_BE;

namespace SFC_BL
{
    public class FichaRespuestaBL
    {
        FichaRespuestaDAO dao = new FichaRespuestaDAO();
        public DataSet RegiFichaRespuesta(FichaRespuestaBE e)
        {
            return dao.FichaRespuestaRegi(e);
        }
    }
}
