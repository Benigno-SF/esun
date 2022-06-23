using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class IncidenciaBE : EmpresaBE
    {
        public string vnIdIncidencia { get; set; }
        public int vnIdFundo { get; set; }
        public int vnIdPersonal { get; set; }
        public int vnIdTipo { get; set; }
        public string vcDescIncidencia { get; set; }
        public string vcFechaIni { get; set; }
        public string vcFechaFin{ get; set; }

    }
}
