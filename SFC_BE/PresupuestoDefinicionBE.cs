using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoDefinicionBE : PresupuestoUnidadNegBE
    {   
        public int vnIdParametro { get; set; }
        public int vnIdParamTitulo { get; set; }
        public int vnNivel { get; set; }
        public int vnNroOrden { get; set; }
    }
}
