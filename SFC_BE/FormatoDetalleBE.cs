using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class FormatoDetalleBE : FormatoBE
    {
        public int vnIdParametro { get; set; }
        public int vnNoOrden { get; set; }
        public bool vbObligatorio { get; set; }
        public bool vbTieneObs { get; set; }
        public int vnNivel { get; set; }
        public int vnIdParamTitulo { get; set; }
        public int vnIdFormatoDetalle { get; set; }
        public string vcValorDefault { get; set; }
    }
}
