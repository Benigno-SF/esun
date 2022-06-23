using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class EventoProgDetalleBE : EventoProgBE
    {
        public int vnIdArea { get; set; }
        public int vnIdGrupo { get; set; }
        public DateTime vdFechaInicio { get; set; }
        public DateTime vdFechaFin { get; set; }
        public int vnIdEstado { get; set; }
    }
}
