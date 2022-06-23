using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class TicketAlimentoBE : EmpresaBE
    {
        public int vnIdTicket { get; set; }
        public string vcIdCodigoGeneral { get; set; }
        public DateTime vdFechaTicket { get; set; }
        public int vnIdTipoEvento { get; set; }
        public string vcTipoRegistro { get; set; }
        public DateTime vdFechaAut { get; set; }
    }
}
