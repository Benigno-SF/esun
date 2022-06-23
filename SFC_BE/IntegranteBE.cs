using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class IntegranteBE : EmpresaBE
    {
        public int vnidIntegrante { get; set; }
        public int vnIdNivel { get; set; }
        public string vcDescCargo { get; set; }
        public int vnIdPersonal { get; set; }
        public string vcImg { get; set; }

    }
}
