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
    public class TicketAlimentoBL
    {
        TicketAlimentoDAO dao = new TicketAlimentoDAO();
        public DataSet RegiTicket(TicketAlimentoBE e)
        {
            return dao.RegiTicket(e);
        }
        
        public int RegiProvTicket(TicketAlimentoBE e, DataTable dt) {
            return dao.RegiProvTicket(e, dt);
        }

        public DataSet CountProv(TicketAlimentoBE e)
        {
            return dao.CountProv(e);
        }

        public DataSet TicketAlimentosList (TicketAlimentoBE e)
        {
            return dao.TicketAlimentosList(e);
        }

    }
}
