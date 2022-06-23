using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoResumenBE : EmpresaBE
    {
        public int vnIdPresupuesto { get; set; }
        public string vcIdPeriodo { get; set; }
        public string vnIdParametro { get; set; }
        public int vnIdUnidadNeg { get; set; }
        public decimal vnImpPres { get; set; }
        public decimal vnImpEjec { get; set; }
        public int vnIdParamTitulo { get; set; }
        public string vcTipoCosto { get; set; }

        public int vnIdFundo { get; set; }
        public int vnIdCultivo { get; set; }
    }
}
