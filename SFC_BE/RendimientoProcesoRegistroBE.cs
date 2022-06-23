using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class RendimientoProcesoRegistroBE : RendimientoProcesoDetalleBE 
    {   
        public string vcAnio { get; set; }
        public int vnIdPersonal { get; set; }
        public int vnIdRendPack { get; set; }
        public string vcNoPartida { get; set; }
        public DateTime vdFechaImp { get; set; }
        public DateTime vdFechaLec { get; set; }
        public string vcLabor { get; set; }

        public string vcIdCodigoGeneral { get; set; }
        public string vnIdMonitor { get; set; }
        public string vnCastigo { get; set; }
        public string vcNroDocumento { get; set; }
        public string vcNombres { get; set; }


    }
}
