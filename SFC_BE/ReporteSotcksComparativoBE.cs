using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ReporteSotcksComparativoBE
    {
        public string Codigo1{ get; set; }
        public string Nombre1{ get; set; }
        public string UnidadMedida1{ get; set; }
        public string Stock1{ get; set; }

        public string Codigo2 { get; set; }
        public string Nombre2 { get; set; }
        public string UnidadMedida2{ get; set; }
        public string Stock2 { get; set; }

        public string Diferencia { get; set; }
    }
}
