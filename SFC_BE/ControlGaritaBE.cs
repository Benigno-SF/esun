using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ControlGaritaBE : EmpresaBE
    {
        public int vnIdControlGarita { get; set; }

        public int vnIdVehiculo { get; set; }
        public string vcPLaca { get; set; }
        public int vnTipoVehiculo { get; set; }

        public int vnIdConductor { get; set; }
        public string vcNroDocumento { get; set; }
        public string vcNombres { get; set; }
        public string vcApPaterno { get; set; }
        public string vcApMaterno { get; set; }
        public string vcLicenciaConducir { get; set; }

        public int vnIdClieProv { get; set; }
        public string vnIdentClieProv { get; set; }
        public string vcDescClieProv { get; set; }

        public string vdFechaIngreso { get; set; }
        public string vdFechaSalida { get; set; }

        public string vcObservacionIngreso { get; set; }
        public string vcObservacionSalida { get; set; }



    }
}