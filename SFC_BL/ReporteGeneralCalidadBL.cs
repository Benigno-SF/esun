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
    public class ReporteGeneralCalidadBL
    {
        // intancia a dao
        ReporteGeneralCalidadDAO dao = new ReporteGeneralCalidadDAO();

        public DataSet BL_listar_sucursal(ReporteGeneralCalidadBE obj)
        {
            return dao.DAO_listar_sucursal(obj);
        }

        public DataSet BL_listar_variable(ReporteGeneralCalidadBE obj)
        {
            return dao.DAO_listar_variable(obj);
        }

        public DataSet BL_listar_reporte(ReporteGeneralCalidadBE obj)
        {
            return dao.DAO_listar_reporte(obj);
        }

        public DataSet BL_listar_reporte_general(ReporteGeneralCalidadBE obj)
        {
            return dao.DAO_listar_reporte_general(obj); 
        }
    }
}
