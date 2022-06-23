using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class UnidadNegBE : FundoBE
    {
        public int vnIdUnidadNeg { get; set; }
        public string vcCodNisira { get; set; }
        public string vcDescUnidadNeg { get; set; }
        public string vcTipo { get; set; }
        public string vcFundo { get; set; }
        public decimal vnHa { get; set; }
        public int vnIdCultivo { get; set; }
        public string vcCodigoCultivo { get; set; }
        public bool vbEstado { get; set; }
        public string vcUsuarioCrea { get; set; }
        public DateTime vdFechaCrea { get; set; }
    }
}
