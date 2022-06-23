using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class CultivoPackingVariedadBE : EmpresaBE
    {
            public int vnIdCultivo { get; set; }
            public int vnIdVariedad { get; set; }
            public string vcDescVariedad { get; set; }
            public DateTime vdFechaCrea { get; set; }
    }
 }
