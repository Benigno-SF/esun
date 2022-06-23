using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class TablaCecoBE
    {
        public string IdDocumento { get; set; }
        public string Apellidos_Nombres { get; set; }
        public string Cod_Planilla { get; set; }
        public string C_Costo { get; set; }
        public string Cod_Sucursal { get; set; }
        public string Cod_Actividad { get; set; }
        public string Cod_Labor { get; set; }
        public string Fecha_Inicio { get; set; }
        public string Fecha_Final { get; set; }
        public float Porcentaje { get; set; }
    }
}
