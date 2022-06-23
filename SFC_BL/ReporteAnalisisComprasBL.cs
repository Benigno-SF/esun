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
    public class ReporteAnalisisComprasBL
    {
        // instancia a DAO.
        ReporteAnalisisComprasDAO dao = new ReporteAnalisisComprasDAO();

        public DataSet BL_reporte_analisis_compra(ReporteAnalisisComprasBE obj)
        {
            return dao.DAO_reporte_analisis_compra(obj);
        }
    }
}
