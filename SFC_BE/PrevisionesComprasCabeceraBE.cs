using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PrevisionesComprasCabeceraBE
    {
        public int Id { get; set; }
        public int Id_Proveedor { get; set; }
        public int Id_FamiliaArticulo { get; set; }
        public int Id_Almacen { get; set; }
        public List<PrevisionesComprasDetalleBE> Detalles { get; set; }
    }
}
