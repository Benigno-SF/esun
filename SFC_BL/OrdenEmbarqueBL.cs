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
    public class OrdenEmbarqueBL
    {
        OrdenEmbarqueDAO dao = new OrdenEmbarqueDAO();
        public DataSet ListOrdenEmbarque(OrdenEmbarqueBE e)
        {
            return dao.ListOrdenEmbarque(e);
        }

        public int RegiOrdenEmbarque(OrdenEmbarqueBE e)
        {
            return dao.RegiOrdenEmbarque(e);
        }

        public DataSet RepOrdenEmbarque(OrdenEmbarqueBE e)
        {
            return dao.RepOrdenEmbarque(e);
        }

        public DataSet GenerarOrdenEmbarque(OrdenEmbarqueBE e)
        {
            return dao.GenerarOrdenEmbarque(e);
        }

        public DataSet SaveGenerarOrdenEmbarque(OrdenEmbarqueBE e)
        {
            return dao.SaveGenerarOrdenEmbarque(e);
        }

        public DataSet DeleteCorrOrdenEmbarque(OrdenEmbarqueBE e)
        {
            return dao.DeleteCorrOrdenEmbarque(e);
        }
        
        public DataSet ListOrdenEmbarqueConsolidado(OrdenEmbarqueBE e)
        {
            return dao.ListOrdenEmbarqueConsolidado(e);
        }
        
    }
}
