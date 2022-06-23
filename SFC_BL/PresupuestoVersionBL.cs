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
    public class PresupuestoVersionBL
    {
        PresupuestoVersionDAO dao = new PresupuestoVersionDAO();
        public string RegiPresupVers(PresupuestoVersionBE e)
        {
            return dao.RegiPresupVers(e);
        }
        public DataSet ListPresupVersion(PresupuestoVersionBE e)
        {
            return dao.ListPresupVersion(e);
        }
    }
}
