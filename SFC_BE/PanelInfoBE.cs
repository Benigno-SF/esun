using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PanelInfoBE : SubLineaBE
    {
        public int vnIdPanelInfo { get; set; }
        public int vnIdCultivo { get; set; }
        public int vnIdCategoria { get; set; }
        public int vnIdCalibre { get; set; }
        public DateTime vdHoraInic { get; set; }
        public DateTime vdHoraFin { get; set; }
        public bool vbPlu { get; set; }
        public bool vbEstado { get; set; }
    }
}
