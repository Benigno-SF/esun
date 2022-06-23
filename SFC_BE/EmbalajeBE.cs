using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class EmbalajeBE : EmpresaBE
    {
        public int VnIdEmbalaje { get; set; }
        public int vnIdCultivo { get; set; }
        public string vcDesEmbalaje { get; set; }
        public int vnIdTipoc { get; set; }
    }
}


