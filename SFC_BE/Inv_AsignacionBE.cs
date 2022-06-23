using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class Inv_AsignacionBE
    {
        public int vnIdAsignacion { get; set; }
        public int vnIdDevice { get; set; }
        public string vcObservacion { get; set; }
        public bool vbEstado { get; set; }
        public int vnIdUsuario { get; set; }
        public int vnIdResponsable { get; set; }
    }
}
