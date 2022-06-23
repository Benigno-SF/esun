using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class TrackBE : DispositivoBE
    {
        public int vnIdTrack { get; set; }
        public double vnLatitud { get; set; }
        public double vnLongitud { get; set; }
        public DateTime vdFecha { get; set; }
        public int vnTiempo { get; set; }
        public string vcFechaIni { get; set; }
        public string vcFechaFin { get; set; }

    }
}
