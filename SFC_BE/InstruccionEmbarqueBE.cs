using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class InstruccionEmbarqueBE : EmpresaBE
    {
        public int vnIdInstruccion { get; set; }
        public int vnIdCampana { get; set; }
        public int vnIdCliente { get; set; }
        public int vnIdLocalizacion { get; set; }
        public int vnIdConsignee { get; set; }
        public int vnIdNotify { get; set; }
        public int vnIdNotify2 { get; set; }
        public string vcFechaIni { get; set; }
        public string vcFechaFin { get; set; }
        public DateTime vdFechaIni { get; set; }
        public DateTime vdFechaFin { get; set; }

    }
}
