using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PrevisionesComprasDetalleBE
    {
        public int Id { get; set; }
        public int Id_PrevisionCompras { get; set; }
        public string Unidades { get; set; }
        public string fecha { get; set; }
        public int Id_UnidadMedida { get; set; }
    }
}
