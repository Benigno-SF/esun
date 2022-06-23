using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
       public class RendimientoProcesoDetalleBE : RendimientoProcesoBE
    {
        public int vnIdProcesoDetalle { get; set; }
        public int vnIdGrupo { get; set; }
        public int vnIdSupervisor { get; set; }
        public int vnIdEmbalaje { get; set; }
        public int vnIdCultivo { get; set; }
        public int vnIdVariedad { get; set; }
        public int vnIdClieProv { get; set; }
        public decimal vnHoraEfectiva { get; set; }
        public DateTime vdFechaIni { get; set; }
        public DateTime vdFechaFin { get; set; }
    }
}
