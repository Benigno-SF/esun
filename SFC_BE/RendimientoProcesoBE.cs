using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class RendimientoProcesoBE : EmpresaBE
    {
        public int vnIdProceso { get; set; }
        public int vnIdArea { get; set; }
        public DateTime vdFeInic { get; set; }
        public DateTime vdFeFina { get; set; }
        public string vcFechaProceso { get; set; }
        public string vcObservacion { get; set; }

    }
}
