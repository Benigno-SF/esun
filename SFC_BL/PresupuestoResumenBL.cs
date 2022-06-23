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
    public class PresupuestoResumenBL
    {
        PresupuestoResumenDAO dao = new PresupuestoResumenDAO();

        public DataSet ListPresResuDeta(PresupuestoResumenBE e)
        {
            return dao.ListPresResuDeta(e);
        }


    }
}
