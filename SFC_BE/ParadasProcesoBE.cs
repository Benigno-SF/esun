using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ParadasProcesoBE : EmpresaBE
    {
        public int vnIdParadasProceso { get; set; }
        public int vnIdArea { get; set; }
        public int vnIdProceso { get; set; }
        public int vnIdPersonal { get; set; }
        public int vnIdGrupo  { get; set; }
        public int vnIdSupervisor { get; set; }
        public int vnIdMotivo { get; set; }
        public int vnIdCultivo { get; set; }
        public string vcFechaProc { get; set; }
        public string vcFechaIni { get; set; }
        public string vcFechaFin { get; set; }
        public string vcObservacion { get; set; }
    }
}
