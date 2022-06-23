using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PlantaBE : EmpresaBE
    {
        public int vnIdPlanta { get; set; }
        public string vcDescPlanta { get; set; }
        public string vcDireccion { get; set; }
        public string vcNota { get; set; }
        public int nId { get; set; }
        public int nTipo { get; set; }
        public string vcContacto { get; set; }
        public string vcContactoMovil { get; set; }
    }
}
