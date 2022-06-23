using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoVersionDetalleBE : PresupuestoVersionDefinicionBE
    {
        public string vcIdPeriodo { get; set; }
        public decimal vnCantidad1Ha { get; set; }
        public decimal vnCantidadxHa { get; set; }
        public decimal vnImportexHa { get; set; }
        //
    }
}
