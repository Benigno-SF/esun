using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class UsuarioBE
    {
        public string vcDominio { get; set; }
        public string vcUsuario { get; set; }
        public string vcPassword { get; set; }
        public string vcApellidos { get; set; }
        public string vcNombres { get; set; }
        public string vcCorreo { get; set; }
        public string vcMovil { get; set; }
        public bool vbEstado { get; set; }
        public int vnIdPerfil { get; set; }
        //
        public string vcUserDes { get; set; }
        public bool vbUserAuth { get; set; }
    }
}
