using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class EspecificacionBE
    {
        public EspecificacionBE() 
        {
            Imagenes = new List<EspecificacionDetalleBE>();
        }

        public string Id { get; set; }
        public int? Linea { get; set; }
        public string Productor { get; set; }
        public string Empaque { get; set; }
        public string Categoria { get; set; }
        public string Monitor { get; set; }
        public List<EspecificacionDetalleBE> Imagenes { get; set; }
    }
}
