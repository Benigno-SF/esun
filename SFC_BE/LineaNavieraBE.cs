using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class LineaNavieraBE : EmpresaBE
    {
        public int vnIdLineaNaviera { get; set; }
        public string cDescLineaNaviera { get; set; }
        public int nIdEmpresa { get; set; }
        public bool bEstado { get; set; }
        public int nTipo { get; set; }
        public int nId { get; set; }
    }
}
