using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class AreaGrupoClienteBE : EmpresaBE
    {
     public int vnIdArea { get; set; }
     public int vnIdGrupo { get; set; }
     public int vnIdGrupoCliente { get; set; }
     public int vnIdClieProv { get; set; }
     public int vnIdEmbalaje { get; set; }
     public DateTime vdFechaIni { get; set; }
     public DateTime vdFechaFin { get; set; }
     public bool vbEstadoUso { get; set; }
     public int vnIdProceso { get; set; }
    }
}
