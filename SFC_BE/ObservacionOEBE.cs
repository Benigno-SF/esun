using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ObservacionOEBE : EmpresaBE
    {
        public int vnIdObservacionOE { get; set; }
        public int vnIdOrdenEmbarque { get; set; }
        public string vcDescObservacion { get; set; }
    }
}
