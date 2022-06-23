using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class FundoBE : EmpresaBE
    {   
        public int vnIdFundo { get; set; }
        public string vcDescFundo { get; set; }
        public int vnIdEstado { get; set; }
    }
}
