using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoResumenDetalleBE : PresupuestoResumenBE
    {
        public int vnitem { get; set; }
        public string vcidcabconta { get; set; }
        public string vcitem { get; set; }
        public string vcidccosto { get; set; }
        public string vcidcuenta { get; set; }
        public string vcidlabor { get; set; }
        public string vcidsubgrupo { get; set; }
        public decimal vnimporte { get; set; }
        public DateTime vdfecha { get; set; }
        public string vcvoucher { get; set; }
        public string vcglosa { get; set; }
        public string vcreferencia { get; set; }
        public string vcdesc_cuenta { get; set; }
        public string vcdesc_actividad { get; set; }
        public string vcdesc_labor { get; set; }
        public string vcdesc_grupo { get; set; }
        public string vcdesc_subgrupo { get; set; }
    }
}
