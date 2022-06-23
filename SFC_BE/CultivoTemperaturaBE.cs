using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class CultivoTemperaturaBE : EmpresaBE
    {
        public int vnIdCultivo { get; set; }
        public int vnIdCultivoTemp { get; set; }
        public int vcTemperatura { get; set; }
    }
}
