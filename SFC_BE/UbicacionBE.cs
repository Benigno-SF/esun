using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class UbicacionBE : EmpresaBE
    {
        public string vcCodUbic { get; set; }
        public string vcDescUbic { get; set; }
        public string vcDescUbicComp { get; set; }
        public int vnTipoUbic { get; set; }
        public string vcDirecUbic { get; set; }
        public bool vbEstado { get; set; }
    }
}
