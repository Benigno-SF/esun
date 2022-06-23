using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class CampanaBE : EmpresaBE
    {
        public int vnIdCampana { get; set; }
        public string vcCampNombre { get; set; }
        public int cultivo { get; set; }

    }
}
