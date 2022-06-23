using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class Inv_DeviceBE : Inv_DetalleDeviceBE
    {
        public int vnIdDevice { get; set; }
        public int vnIdTipoDevice { get; set; }
        public string vcHostname { get; set; }
        public string vcCodigo { get; set; }
        public string vcSerie { get; set; }
        public int vnIdMarca { get; set; }
        public string vcModelo { get; set; }
        public int vnPropiedad { get; set; }
        public string vcObsDev { get; set; }
        public string vcImg { get; set; }
        public string vcImg2 { get; set; }
        public string vImg { get; set; }
        public string vImg2 { get; set; }
        public string vcFile { get; set; }
        public string vExt { get; set; }
    }
}
