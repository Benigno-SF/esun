using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ControlFotoBE : EmpresaBE
    {
        public int vnIdFoto { get; set; }
        public int vnIdFotoDeta { get; set; }
        public string vcModulo { get; set; }
        public string vcRutaFoto { get; set; }
        public string vcObseFoto { get; set; }
      //  public bool vbEstado { get; set; }
        public DateTime vdFecha { get; set; }
        public string FileString { get; set; }
        //
        public int vnIdFormato { get; set; }
        public int vnIdControl { get; set; }
        public int vnIdMuestra { get; set; }

    }
}
