using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class RecepcionBE : EmpresaBE
    {
        public int vnIdRecepcion { get; set; }
        public string vcRemitente { get; set; }
        public string vcUserDest { get; set; }
        public string vcRutaFoto { get; set; }
        public string vcObser { get; set; }
        public string vbEstado { get; set; }
        public DateTime vdFechaCrea { get; set; }

    }
}
