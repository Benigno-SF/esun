using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class Inv_IncidenciaBE
    {
        public int vnIdIncidencia { get; set; }
        public int vnIdDevice { get; set; }
        public int vnIdUbicacion { get; set; }
        public int vnIdArea { get; set; }
        public string vcObservacion { get; set; }
        public int vnIdUsuario { get; set; }
        public int vnIdResponsable { get; set; }
        public string vdFechaIncidencia { get; set; }
    }
}
