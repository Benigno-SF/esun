using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class MonitorBE : EmpresaBE
    {
        public int vnIdArea { get; set; }
        public int vnIdMonitor { get; set; }
        public string vcDescMonitor { get; set; }
        public string vcIpMonitor { get; set; }
    }
}
