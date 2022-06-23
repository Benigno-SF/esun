using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoIndirectoDetalleBE :PresupuestoIndirectoBE
    {
        public int vnIdFundo { get; set; }
        public int vnIdCultivo { get; set; }
        public int vnIdParametro { get; set; }
        public string vcIdPeriodo { get; set; }
        public string vcDriver { get; set; }
        public decimal vnImporte { get; set; }
        public int vnIdParamTitulo { get; set; }
    }
}
