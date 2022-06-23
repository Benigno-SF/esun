using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class DispositivoBE : EmpresaBE
    {
        public int vnIdDispositivo { get; set; }
        public string vcTipo { get; set; }
        public string vcNombre { get; set; }
        public string vcIP { get; set; }
        public string vcIdSucursal { get; set; }
        public int vnIdDispositivoMast { get; set; }

    }
}
