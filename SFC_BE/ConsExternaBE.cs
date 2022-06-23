using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class ConsExternaBE : EmpresaBE
    {

        public int vnSistema { get; set; }
        public string vctipo { get; set; }
        public string vcIdCliente { get; set; }
        public string vcIdCultivo { get; set; }
        public string vcIdVariedad { get; set; }
        public int vnIdOrdCarga { get; set; }
        //
        public int vnNoCarga { get; set; }
        public string vcDescCarga { get; set; }
        public string vcDestino { get; set; }
        public DateTime vdHoraCarga { get; set; }
        public string vcBooking { get; set; }
        public string vcIdProvLote { get; set; }
        public string vcRazonSolcial { get; set; }
        public string vcDescCultivo { get; set; }
        //
        public string vcPeriodo { get; set; }
        public string vcSemana { get; set; }
        public string vcPeriodo2 { get; set; }
        public string vcSemana2 { get; set; }
        public string vcCodigo { get; set; }
        //
        public string vcIdRegistroPaleta { get; set; }
        public string vcIdCampana { get; set; }
        public string vcNroPaleta { get; set; }
        //
        public string idreferencia { get; set; }
        public string item { get; set; }
        public DateTime fecha { get; set; }
        public string nropaleta { get; set; }
        public string nropaleta_origen { get; set; }
        public string idcliente { get; set; }
        public string desc_cliente { get; set; }
        public string idproductor { get; set; }
        public string desc_productor { get; set; }
        public string grower_code { get; set; }
        public string idproductorm { get; set; }
        public string idcultivo { get; set; }
        public string desc_cultivo { get; set; }
        public string idvariedad { get; set; }
        public string desc_variedad { get; set; }
        public string idenvase { get; set; }
        public string desc_envase { get; set; }
        public string idcondicion { get; set; }
        public string desc_condicion { get; set; }
        public string idcondicionm { get; set; }
        public string idtalla { get; set; }
        public string desc_talla { get; set; }
        public string idtallam { get; set; }
        public string idcolor { get; set; }
        public string desc_color { get; set; }
        public string idcolorm { get; set; }
        public string talla_equiv { get; set; }
        public string idembalaje { get; set; }
        public string desc_embalaje { get; set; }
        public string idparihuela { get; set; }
        public string desc_parihuela { get; set; }
        public string idetiqueta { get; set; }
        public string desc_etiqueta { get; set; }
        public string idetiquetam { get; set; }
        public string idetiqueta2 { get; set; }
        public string desc_etiqueta2 { get; set; }
        public string idetiquetam2 { get; set; }
        public DateTime fechaproc { get; set; }
        public int dias { get; set; }
        public string idmotivopaleta { get; set; }
        public string desc_motivopaleta { get; set; }
        public string nromanual { get; set; }
        public string idsucursal { get; set; }
        public string desc_sucursal { get; set; }
        public string inspeccion { get; set; }
        public string estado { get; set; }
        public string idreferencia_recepcion { get; set; }
        public string docreferencia { get; set; }
        public string idlotecampo { get; set; }
        public DateTime fecha_mp { get; set; }
        public string idpresentacion { get; set; }
        public string DESC_PRESENTACION { get; set; }
        public string idlotep { get; set; }
        public string fundo { get; set; }
        public string idpresentacion2 { get; set; }
        public string DESC_PRESENTACION2 { get; set; }
        public string destino_cliente { get; set; }
        public string lote_trazabilidad { get; set; }
        public string idpaisemisor { get; set; }
        public string pais_destino { get; set; }
        public string verificado { get; set; }
        public string observacion { get; set; }
        public string desc_adicional { get; set; }
        public string idproducto { get; set; }
        public string tipogenerador { get; set; }
        public string DESCLISTAMATERIALES { get; set; }
        public string IDLOTE_AUX { get; set; }
        public string IDLOTECAMPO_AUX { get; set; }
        public string LOTECAMPO_AUX { get; set; }

        public string vcFechaIni { get; set; }
        public string vcFechaFin { get; set; }
    }
}
