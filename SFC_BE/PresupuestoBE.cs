using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PresupuestoBE : EmpresaBE
    {   
        public int vnIdPresupuesto { get; set; }
        public string vcDenominacion { get; set; }
        public DateTime vdFechaInicio { get; set; }
        public string vcTipoPeriodo { get; set; }
        public int vnNroPeriodo { get; set; }
        public int vnIdMoneda { get; set; }
        public decimal vnTCambio { get; set; }
        public bool vbEstado { get; set; }
        public string vcUsuarioCrea { get; set; }
        public DateTime vdFechaCrea { get; set; }
        public string vcUsuarioAprueba { get; set; }
        public DateTime vdFechaAprueba { get; set; }
    }
}
