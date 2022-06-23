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
    public class EventoProgBL
    {
        EventoProgDAO dao = new EventoProgDAO();
        public String RegiEventosProg(EventoProgBE e)
        {
            return dao.RegiEventosProg(e);
        }

        public DataSet EventoProgList(EventoProgBE e)
        {
            return dao.EventoProgList(e);
        }


    }
}
