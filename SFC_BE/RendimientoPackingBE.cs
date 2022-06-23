using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class RendimientoPackingBE : EmpresaBE
    {
        public string palet { get; set; }
        public int vcAnio { get; set; }
        public string vcIdCodigoGeneral { get; set; }
        public int vnIdRendPack { get; set; }
        public int vcNoPartida { get; set; }
        public int vnIdEmbalaje { get; set; }
        public int vnIdArea { get; set; }
        public int vnIdGrupo { get; set; }
        public string vcLabor { get; set; }
        public int vnIdProceso { get; set; }
        public int vnIdClieProv { get; set; }
        public int vnIdCultivo { get; set; }
        public int vnIdVariedad { get; set; }
        public String vnIdMonitor { get; set; }
        public int vnIdPersonal { get; set; }
        //Datos complemento
        public int vnCastigo { get; set; }
        public int vnCaj1Meta { get; set; }
        public double vnPre1Meta { get; set; }
        public int vnCaj2Meta { get; set; }
        public double vnPre2Meta { get; set; }
        public string vcFechaInicio { get; set; }
    }
}
