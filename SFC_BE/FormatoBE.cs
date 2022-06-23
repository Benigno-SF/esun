using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class FormatoBE : EmpresaBE
    {   
        public int vnIdFormato { get; set; }
        public string vcCodigoFormato { get; set; }
        public string vcDescFormato { get; set; }
        public string vcDescFormComp { get; set; }
        public string vcVersion { get; set; }
        public int vnIdCultivo { get; set; }
        public bool vbEstado { get; set; }
        public DateTime vdFechaVersion { get; set; }
        public string vcCodigoCultivo { get; set; }
        public int vnIdTipo { get; set; }
    }
}
