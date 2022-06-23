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
    public class ControlGaritaBL
    {
        ControlGaritaDAO dao = new ControlGaritaDAO();
        public DataSet ControlGaritaRegi(ControlGaritaBE e)
        {
            return dao.ControlGaritaRegi(e);
        }

        public DataSet ListControlGarita(ControlGaritaBE e)
        {
            return dao.ListControlGarita(e);
        }
    }
}