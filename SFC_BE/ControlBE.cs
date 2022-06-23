using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ControlBE : FormatoBE
    {
        public int vnIdControl { get; set; }
        public DateTime vdFechaProc { get; set; }
        public string vcIdVariedad { get; set; }
        public string vcIdProvLote { get; set; }
        public string vcIdConsumidor { get; set; }
        public string vcObseControl { get; set; }
        public int vnIdArea { get; set; }
        public int vnIdEstadoDoc { get; set; }
    }
}
