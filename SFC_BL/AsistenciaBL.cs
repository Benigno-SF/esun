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
    public class AsistenciaBL
    {
        AsistenciaDAO dao = new AsistenciaDAO();
        public DataSet RegiAsis(AsistenciaBE e)
        {
            return dao.RegiAsis(e);
        }

        public DataSet ListAsistencia(AsistenciaBE e)
        {
            return dao.ListAsistencia(e);
        }
        
    }
}
