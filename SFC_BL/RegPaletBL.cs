using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace SFC_BL
{
    public class RegPaletBL
    {
        private RegPaletDAO regPaletDAO = new RegPaletDAO();

        public DataSet Registrar(RegPalet obj, int tipo)
        {
            return regPaletDAO.Registrar(obj, tipo);
        }

        public DataSet UnoPorCodigo(string codigo)
        {
            return regPaletDAO.UnoPorCodigo(codigo);
        }

        public DataSet Reporte_PaletsPorDia()
        {
            return regPaletDAO.Reporte_PaletsPorDia();
        }

        public DataSet Reporte_PaletsPorTunel()
        {
            return regPaletDAO.Reporte_PaletsPorTunel();
        }

        public DataSet Reporte_PaletsPorTunelYPorDia(PersonalBE obj)
        {
            return regPaletDAO.Reporte_PaletsPorTunelYPorDia(obj);
        }

        public DataSet Reporte_PaletsPorTunelYPorDia(string fecha)
        {
            return regPaletDAO.Reporte_PaletsPorTunelYPorDia(fecha);
        }
    }
}
