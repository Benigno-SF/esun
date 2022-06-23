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
    public class EventoProgDetalleBL
    {
        EventoProgDetalleDAO dao = new EventoProgDetalleDAO();
        public DataSet EventoProgDetalleList(EventoProgDetalleBE e)
        {
            return dao.EventoProgDetalleList(e);
        }

        public String RegiEventoDetalleProg(EventoProgDetalleBE e)
        {
            return dao.RegiEventoDetalleProg(e);
        }

    }
}
