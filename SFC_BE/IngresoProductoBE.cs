using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class IngresoProductoBE : EmpresaBE
    {
        public string vcNroGuia { get; set; }
        public int vnIdVariedad { get; set; }
        public int vnIdCultivo { get; set; }
        public int vnCantProd { get; set; }
        public int vnKiloAproxProd { get; set; }
        public int vnIdProd { get; set; }
    }
}
