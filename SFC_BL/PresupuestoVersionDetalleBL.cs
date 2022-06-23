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
    public class PresupuestoVersionDetalleBL
    {
        PresupuestoVersionDetalleDAO dao = new PresupuestoVersionDetalleDAO();
        public int RegiPresupVersCopy(PresupuestoVersionBE e, List<PresupuestoVersionDetalleBE> lst)
        {
            return dao.RegiPresupVersCopy(e, lst);
        }
        public DataSet ListPresupVersionDeta(PresupuestoVersionDetalleBE e) {
            return dao.ListPresupVersionDeta(e);
        }
        public int RegiPresupVers(PresupuestoVersionBE e, List<PresupuestoVersionDetalleBE> lst)
        {
            return dao.RegiPresupVers(e, lst);
        }
    }
}
