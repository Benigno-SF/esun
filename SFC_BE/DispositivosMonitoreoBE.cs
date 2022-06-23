using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class DispositivosMonitoreoBE
    {
        public int nIdDispositivosMonitoreo { get; set; }

        public string cIp { get; set; }

        public string cDescripcion { get; set; }

        public DateTime? dFhsereporta { get; set; }

        public int? nBateria { get; set; }

        public string cNombre { get; set; }
    }
}
