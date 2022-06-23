using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class CajasOEBE : EmpresaBE
    {
        public int vnIdOrdenEmbarque { get; set; }
        public int vnIdCajasOE { get; set; }
        public int vnIdCultivo { get; set; }
        public int vnIdVariedad { get; set; }
        public int vnIdEmbalaje { get; set; }
        public int vnCajas { get; set; }
        public bool vbPorConfirmar{ get; set; }
    }
}
