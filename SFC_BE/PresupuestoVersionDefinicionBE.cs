using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoVersionDefinicionBE : PresupuestoDefinicionBE
    {
        public int vnVersion { get; set; }
        public decimal vnImporte { get; set; }
    }
}
