using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoUnidadNegBE :UnidadNegBE
    {
        public int vnIdPresupuesto { get; set; }
        public int vnIdFormato { get; set; }
        public int vnFRegistro { get; set; }
        public bool vbTerminado { get; set; }
        
    }
}
