using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class DiagnosticoMedicoBE
    {
        public string FECHA_REGISTRO { get; set; }
        public string FECHA_INICIO { get; set; }
        public string FECHA_TERMINO { get; set; }
        public string DIAS { get; set; }
        public string CODIGO { get; set; }
        public string DIAGNOSTICO { get; set; }
        public string OBSERVACIONES { get; set; }
        public string PROVIENE { get; set; }
        public int ID_USUARIO_D_MEDICO { get; set; }
    }
}
