using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class EventoProgBE : EmpresaBE
    {

        public int vnIdEventoProg { get; set; }
        public int vnIdTipoEvento { get; set; }
        public DateTime vdFechaEvento { get; set; }
        public bool vbConcluido { get; set; }
        public string vcMenu { get; set; }
        public string vcDieta { get; set; }
        public string vcUsuarioCrea { get; set; }
    }
}
