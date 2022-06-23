using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ControlNroMuestraBE : ControlBE
    {
        public int vnIdMuestra { get; set; }
        public int vnIdFoto { get; set; }
        public string vcObseMuestra { get; set; }
        public DateTime vdFechaMuestra { get; set; }
        //
        public string vcModulo { get; set; }
        public int vnIdFotoDeta { get; set; }
        public string vcRutaFoto { get; set; }
        public string vcObseFoto { get; set; }
        public string FileString { get; set; }

    }
}
