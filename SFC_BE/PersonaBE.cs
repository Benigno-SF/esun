using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PersonaBE : PersonalBE
    {
        public int vnIdPersona { get; set; }
        public int vnIdTemporada { get; set; }
        public int vcTipoDocumento { get; set; }
        public string vcNacionalidad { get; set; }
        public string vcDireccion { get; set; }
        public string vcDistrito { get; set; }
        public string vcDepartamento { get; set; }
        public string vcCelular { get; set; }
        public string vcEmail { get; set; }
        public string vcTurno { get; set; }
        public string vcImg { get; set; }
        public string vImg { get; set; }

        public bool vbReingresante { get; set; }
        public string vcReCargos { get; set; }
        public string vcReOtroCargo	{ get; set; }
        public string vcReAnios		{ get; set; }
        public string vcReCapanias	{ get; set; }

        public int vnidCargoPost { get; set; }
        public string vcDescCargo { get; set; }
        public int vbExperiencialaboral { get; set; }
        public string vcGradoInstruccion { get; set; }
        public string vcExpOEmpresa { get; set; }
        public string vcFile { get; set; }
        public string vExt { get; set; }
        public string vcIds { get; set; }


    }
}
