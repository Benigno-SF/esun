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
    public class RendimientoProcesoBL
    {
        RendimientoProcesoDAO dao = new RendimientoProcesoDAO();
        public int BloqueoLinea(RendimientoProcesoBE e)
        {
            return dao.BloqueoLinea(e);
        }
        public DataSet ListRendimientoProceso(RendimientoProcesoBE e)
        {
            return dao.ListRendimientoProceso(e);
        }

        public DataSet RegiRendimientoProceso(RendimientoProcesoBE e)
        {
            return dao.RegiRendimientoProceso(e);
        }
        public DataSet InicFinProceso(RendimientoProcesoBE e)
        {
            return dao.InicFinProceso(e);
        }



    }
}
