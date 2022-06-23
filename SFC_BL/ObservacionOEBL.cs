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
    public class ObservacionOEBL
    {
        ObservacionOEDAO dao = new ObservacionOEDAO();
        public DataSet RegiObservacionOE(ObservacionOEBE e)
        {
            return dao.RegiObservacionOE(e);
        }

        public DataSet ObservacionOEList(ObservacionOEBE e)
        {
            return dao.ObservacionOEList(e);
        }

        public DataSet ObservacionOEDelete(ObservacionOEBE e)
        {
            return dao.ObservacionOEDelete(e);
        }
    }
}
