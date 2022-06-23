using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class FichaMesBE : EmpresaBE
    {
        public int vnIdFichaMes { get; set; }
        public int vnIdFicha { get; set; }
        public int vnMes { get; set; }
        public DateTime vdFeInic { get; set; }
        public DateTime vdFeFina { get; set; }
    }
}
