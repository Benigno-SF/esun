using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PalletMovBE : PalletBE
    {
        public int vnIdMov { get; set; }
        public DateTime vdFecha { get; set; }
        public string vcMovObs { get; set; }
        public string vcTipoMovi { get; set; }
        public string vcCodUbic { get; set; }
        public int vnCodUbicDet { get; set; }
    }
}
