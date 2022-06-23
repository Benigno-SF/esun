using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class OrdenEmbarqueBE : EmpresaBE
    {
      public int vnIdOrdenEmbarque { get; set; }
      public int vnIdInstruccion {get; set; }
      public int vnIdCampana { get; set; }
      public int vnIdCliente  {get; set; }
      public int vnIdDestino  {get; set; }
      public string vcCCliente { get; set; }
      public string vcCShipper { get; set; }
      public int vnIdConsignee {get; set; }
      public int vnIdNotify {get; set; }
      public int vnIdNotify2 {get; set; }
      public string vcTipoTranporte {get; set; }
      public int vnIdOpLogistico {get; set; }
      public int vnIdShipper {get; set; }
      public string vcFechaEmbarque { get; set; }
      public string vcFlete {get; set; }
      public string vcEmisionBL {get; set; }
      public int vnIdCultivo {get; set; }
      public Decimal vncajas {get; set; }
      public Decimal vnPesoNeto {get; set; }
      public Decimal vnPesoBrutoAprox {get; set; }
      public int vbCertOrigen {get; set; }
      public int vbCertFrio {get; set; }
      public int vbCertFitosanitario {get; set; }
      public int vbAPPlanta {get; set; }
      public int vbAcogeDrawback {get; set; }
      public int vnIdCultivoTemp {get; set; }
      public string vcAtmosferaControlada {get; set; }
      public string vcTemperatura { get; set; }
      public string vcHumedad { get; set; }
      public string vcVentilacion{ get; set; }
      public int vnIdOrdenEmbarqueConsolidado {get; set; }
      public int vnIdPlanta {get; set; }
      public int vnIdLugarSalida {get; set; }
      public string vcFechaSalida { get; set; }
      public string vcFIngresoAlmacen { get; set; }
      public string vcETD { get; set; }
      public string vcETA { get; set; }
      public int vnIdVapor {get; set; }
      public string vcCodeVapor {get; set; }
      public string vcCIANaviera { get; set; }
      public int vnIdLineaNaviera {get; set; }
      public string vcContainer {get; set; }
      public string vcSVC {get; set; }
      public int vnIdPersonal {get; set; }
    }
}
