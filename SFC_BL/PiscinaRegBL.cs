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
    public class PiscinaRegBL
    {
        PiscinaRegDAO dao = new PiscinaRegDAO();

        public DataSet Crear(PiscinaRegBE e)
        {
            return dao.Crear(e);
        }

        public DataSet Listado()
        {
            return dao.Listado();
        }

        public DataSet ListadoEntreFechas(DateTime dFechaInicio, DateTime dFechaFin, int nIdPiscina)
        {
            return dao.ListadoEntreFechas(dFechaInicio, dFechaFin, nIdPiscina);
        }

        public DataSet Actualizar(PiscinaRegBE e)
        {
            return dao.Actualizar(e);
        }

        public DataSet Eliminar(PiscinaRegBE e)
        {
            return dao.Eliminar(e);
        }

        public DataSet OneById(PiscinaRegBE e)
        {
            return dao.OneById(e);
        }
    }
}
