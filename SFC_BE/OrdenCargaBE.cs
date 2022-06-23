using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class OrdenCargaBE : PalletBE
    {
        public int vnIdOrdCarga { get; set; }
        public int vnNoCarga { get; set; }
        public string vcDescCarga { get; set; }
        public string vcDestino { get; set; }
        public DateTime vdHoraCarga { get; set; }
        public string vcBooking { get; set; }
        public string vcIdProvLote { get; set; }
        public string vcRazonSolcial { get; set; }
        public string vcIdCultivo { get; set; }
        public string vcDescCultivo { get; set; }
    }
}
