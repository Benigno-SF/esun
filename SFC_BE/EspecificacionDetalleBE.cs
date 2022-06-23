using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class EspecificacionDetalleBE
    {
        public string Id { get; set; }
        public string IdEspecificacion { get; set; }
        public int Posicion { get; set; }
        public string Imagen { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public string ImagenBase64 { get; set; }
    }
}
