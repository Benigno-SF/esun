using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PiscinaRegBE
    {
        public int nIdPiscinaReg { get; set; }

        public int nIdPiscina { get; set; }

        public DateTime dFhregistro { get; set; }

        public decimal nCaudalEnt { get; set; }

        public decimal nCaudalSal { get; set; }

        public decimal nNivelxCQ { get; set; }

        public decimal nNivelxCM { get; set; }
    }
}
