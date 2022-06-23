
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ConductorBE : EmpresaBE
    {
        public int nIdConductor { get; set; }
        public string vcNroDocumento { get; set; }
        public string vcApPaterno { get; set; }
        public string vcApMaterno { get; set; }
        public string vcNombres { get; set; }
        public string vcLicenciaConducir { get; set; }
    }
}
