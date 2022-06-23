using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class DocumentoBE : EmpresaBE
    {
        public int vnIdDocumento { get; set; }
        public int vnIdTipoDocumento { get; set; }
        public int vnIdTipoDoc { get; set; }
        public string vcTitulo { get; set; }
        public int vnIdClieProv { get; set; }
        public string vnNumero { get; set; }
        public string vnSerie { get; set; }
        public string vcReferencia { get; set; }
        public string vcFilename { get; set; }
        public bool vbDownload { get; set; }
        public bool vbPublico { get; set; }
        public string vcUsuarioCrea { get; set; }

        public string vFiles { get; set; }
        public string vExt { get; set; }
        public string vfolderPath { get; set; }
        public string vFileName { get; set; }
        
    }
}
