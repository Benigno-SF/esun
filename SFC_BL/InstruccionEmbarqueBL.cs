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
    public class InstruccionEmbarqueBL
    {
        InstruccionEmbarqueDAO dao = new InstruccionEmbarqueDAO();
        public DataSet RegiInstruccionEmbarqueE(InstruccionEmbarqueBE e)
        {
            return dao.RegiInstruccionEmbarque(e);
        }

        public DataSet InstruccionEmbarqueList(InstruccionEmbarqueBE e)
        {
            return dao.ListInstruccionEmbarque(e);
        }

        public DataSet InstruccionEmbarqueDelete(InstruccionEmbarqueBE e)
        {
            return dao.InstruccionEmbarqueDelete(e);
        }
    }
}
