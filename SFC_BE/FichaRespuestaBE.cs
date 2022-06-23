using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class FichaRespuestaBE : FichaPersonalBE
    {
        public int vnIdFicha { get; set; }
        public int vnIdFichaGrupo { get; set; }
        public int vnIdFichaPregunta { get; set; }
        public int vnIdRespuesta  {get; set;}
        public int vnIdFichaPerso {get; set;}
        public string vcRespuesta    {get; set;}
        public string vcObs { get; set; }
    }
}
