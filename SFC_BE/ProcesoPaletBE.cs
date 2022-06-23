using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ProcesoPaletBE
    {
        public int? Id { get; set; }
        public DateTime? Fhinicio { get; set; }
        public DateTime? Fhfin { get; set; }
        public string CodPalet { get; set; }
        public string CodTunelEnt { get; set; }
        public string CodTunelSal { get; set; }
    }
}
