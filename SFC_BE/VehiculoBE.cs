using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class VehiculoBE : EmpresaBE
        {
            public int vnIdVehiculo { get; set; }
            public string vcPlaca { get; set; }
            public string vcDescVehiculo { get; set; }
            public int vnIdTipo { get; set; }

            public string vcType { get; set; }
    }
}
