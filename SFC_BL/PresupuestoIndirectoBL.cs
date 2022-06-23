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
    public class PresupuestoIndirectoBL
    {
        PresupuestoIndirectoDAO dao = new PresupuestoIndirectoDAO();

        public DataSet ListPresupIndiDeta(PresupuestoIndirectoBE e)
        {
            return dao.ListPresupIndiDeta(e);
        }
        public int RegiPresuIndi(PresupuestoIndirectoBE e, List<PresupuestoIndirectoDetalleBE> lst)
        {
            return dao.RegiPresuIndi(e, lst);
        }

        public DataSet ListPresupIndi(PresupuestoIndirectoBE e)
        {
            return dao.ListPresupIndi(e);
        }

    }
}
