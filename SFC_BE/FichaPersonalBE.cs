using System;

namespace SFC_BE
{
    public class FichaPersonalBE : FichaBE
    {
        public int vnIdFichaPersonal { get; set; }
        public int vnIdPersonal { get; set; }
        public string vcNroDocumento { get; set; }
        public int vnIdFichaMes { get; set; }
        public string vcCelular { get; set; }
        public string vcDireccion { get; set; }
        public int vnEdad { get; set; }
        public string vcFechaNac { get; set; }
        public DateTime vdFechaNac { get; set; }
        public string vnSemana { get; set; }
        public string vdFecha { get; set; }
        public int vnAnio { get; set; }
        public int vnMes { get; set; }
    }
}
