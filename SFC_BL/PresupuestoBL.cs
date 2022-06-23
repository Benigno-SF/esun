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
    public class PresupuestoBL
    {
        PresupuestoDAO dao = new PresupuestoDAO();
        public DataSet ListPresPeriodo(PresupuestoBE e)
        {
            return dao.ListPresPeriodo(e);
        }
        public DataSet ListPresupuesto(PresupuestoBE e)
        {
            return dao.ListPresupuesto(e);
        }
        public string BulkInsertPresupuesto(string formato)
        {

            return dao.BulkInsertPresupuesto(formato);
        }
    }
}
