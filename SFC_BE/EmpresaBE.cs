using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class EmpresaBE
    {
        public int vnIdEmpresa { get; set; }
        public string vcDescripcion { get; set; }
        public string vcCodigoNisira { get; set; }
        public string vcIpServidor { get; set; }
        public string vcBaseDatos { get; set; }
        public string vcidresponsable { get; set; }
        public string vcHora { get; set; }
        public string vcMensaje { get; set; }
        public string vcIdEmpresa { get; set; }
        //
        public string vcUsuario { get; set; }
        public string vcIpLocal { get; set; }

        public int vnIdTiRow { get; set; }

        public bool vbEstado { get; set; }

        public string vcEstado { get; set; }

        public string vcRUC { get; set; }
        public string vcRazonSocial { get; set; }
        public string vcDirecEmpr { get; set; }

        public string vcFecha { get; set; }
        
    }
}
