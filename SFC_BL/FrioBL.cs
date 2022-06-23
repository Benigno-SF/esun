using SFC_BE;
using SFC_DAO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BL
{
    public class FrioBL
    {
        private FrioDAO objfrioDAO = new FrioDAO();
        private FrioZonBE objfriobe = new FrioZonBE();


        public DataSet MostrarCamara_ReporteBL()
        {
            return objfrioDAO.MostrarCamara_ReporteDAO();
        }

        public DataSet MostrarRacks_ReporteBL(String camara)
        {
            return objfrioDAO.MostrarRacks_ReporteDAO(camara);
        }
        public DataSet MostrarPiso_ReporteBL(String rack)
        {
            return objfrioDAO.MostrarPiso_ReporteDAO(rack);
        }
        public DataSet MostrarReporte_BL(FrioZonBE objfrio)
        {
            return objfrioDAO.Zonificacion_camara_2022(objfrio);
        }
        public DataSet MostrarStock_BL(string fecha)
        {
            return objfrioDAO.MostrarStock_DAO(fecha);
        }
        public string MostrarEstadoPaleta_BL(string Numpaleta)
        {
            return objfrioDAO.MostrarEstadoPaleta_DAO(Numpaleta);
        }
    }
}
