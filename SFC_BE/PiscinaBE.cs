using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PiscinaBE
    {
        public int nIdPiscina { get; set; }
        public string cCodigo { get; set; }
        public string cUbicacion { get; set; }
        public string cDatosadicionales { get; set; }
        public decimal nCapacidad { get; set; }
        public int nPeriodoSinc { get; set; }
        public decimal nNivaltasup { get; set; }
        public decimal nNivalmasup { get; set; }
        public decimal nNivaltainf { get; set; }
        public decimal nNivalmainf { get; set; }
    }
}
