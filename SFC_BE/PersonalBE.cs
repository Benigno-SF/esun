using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PersonalBE : EmpresaBE
    {
        public int vnIdPersonal { get; set; }
        public string vcNroDocumento { get; set; }
        public string vcApPaterno { get; set; }
        public string vcApMaterno { get; set; }
        public string vcNombres { get; set; }
        public string vcCodigoControl { get; set; }
        public string vcIdPlanilla { get; set; }
        public string vcGrupoTrabajo { get; set; }
        public string vcIdCodigoGeneral { get; set; }
        public string vcCodigoLabor { get; set; }
        public string vcCodHisp { get; set; }
        public bool vbEstadoRegi { get; set; }
        public string vcRutaImg { get; set; }

        public string vcSexo { get; set; }
        public DateTime vdFechaNacimiento{ get; set; }
        public DateTime vdFechaRegistro { get; set; }
        public string vcFechaNacimiento { get; set; }
        public string vcFechaRegistro { get; set; }
        public int vnEstado { get; set; }
    }
}
