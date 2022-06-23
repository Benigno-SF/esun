using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class RecepciontiempoBE
    {
        public int nIdRecepciontiempo { get; set; }
        public string cRuc { get; set; }
        public string dFecha { get; set; }
        public DateTime dFregistro { get; set; }
        public bool bEstado { get; set; }
    }
}
