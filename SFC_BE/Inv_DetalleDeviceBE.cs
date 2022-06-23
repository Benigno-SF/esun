using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class Inv_DetalleDeviceBE : EmpresaBE
    {
        public int vnDet             { get; set; }
        public int vnIdSO            { get; set; }
        public int vnRam             { get; set; }
        public int vnIdProcesador    { get; set; }
        public int vnIdOffice        { get; set; }
        public int vnIdAntivirus     { get; set; }
        public string vcIp              { get; set; }
        public string vcMac             { get; set; }
        public string vcTeamviwer       { get; set; }
        public string vcAnydesk         { get; set; }
        public int vnDetMob          { get; set; }
        public string vcIMEI            { get; set; }
        public string vcNumero          { get; set; }
        public int vbAudifonos       { get; set; }
        public int vbCargador        { get; set; }
        public int vbCarcasa         { get; set; }
        public int vnAsig            { get; set; }
        public int vnIdUsuario       { get; set; }
        public int vnIdResponsable   { get; set; }
        public int vnIdUbicacion     { get; set; }
        public int vnIdArea          { get; set; }
        public string vcFechaAsignacion  { get; set; }
        public string vcObservacion     { get; set; }
    }
}
