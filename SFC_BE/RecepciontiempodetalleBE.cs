using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class RecepciontiempodetalleBE
    {
        public int nIdRecepciontiempodetalle { get; set; }
        public int nIdRecepciontiempo { get; set; }
        public int nParihuelas { get; set; }
        public DateTime? dIniDescarga { get; set; }
        public DateTime? dFinDescarga { get; set; }
        public DateTime? dIniPesadoetiquetado { get; set; }
        public DateTime? dFinPesadoetiquetado { get; set; }
        public DateTime? dIniCamaragasificado { get; set; }
        public DateTime? dFinCamaragasificado { get; set; }
        public DateTime? dIniCargajabas { get; set; }
        public DateTime? dFinCargajabas { get; set; }
        public bool bEstado { get; set; }
        public int nCampo { get; set; }
        public string vAuxiliar { get; set; }
        public int nTipo { get; set; }
    }
}
