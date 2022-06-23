using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class AsistenciaBE : PersonalBE
    {
        public int vnIdAsistencia { get; set; }
        public DateTime vdFechaRegistro { get; set; }
        public int vnIdDispositivo { get; set; }
        public bool vbImportado { get; set; }
        public int vnTipoMarca { get; set; }
    }
}
