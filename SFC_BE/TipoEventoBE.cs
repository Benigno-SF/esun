using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class TipoEventoBE : EmpresaBE
    {   
        public int vnIdTipoEvento { get; set; }
        public string vcDescEvento { get; set; }
        public int vnMinDuracion { get; set; }
        public int vnMinTolerancia { get; set; }
        public bool vbEstado { get; set; }
        public string vcUsuarioCrea { get; set; }
        public DateTime vdFechaCrea { get; set; }
    }
}
