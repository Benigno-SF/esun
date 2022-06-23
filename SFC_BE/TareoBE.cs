using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class TareoBE
    {
        public string CITEMID { get; set; }
        public string nombre { get; set; }
        public string IDGT { get; set; }
        public string idResponsable { get; set; }
        public string vctg30dbid { get; set; }
        public string vctg30empid { get; set; }
        public string vctg30tarid { get; set; }
        public string vctg30respid { get; set; }
        public string vdfechacreacion { get; set; }
        public string vdfechaprogr { get; set; }
        public string vcestado { get; set; }
        public string vcidplanilla { get; set; }
        public string vciddocumento { get; set; }
        public string vcserie { get; set; }
        public string vcnumero { get; set; }
        public string vcidemisor { get; set; }
        public string vcperiodo { get; set; }
        public string vcidsucursal { get; set; }
        public string vcidturnotrabajo { get; set; }
        public string vcidgrupotrabajo { get; set; }
        public string vctg30proyid { get; set; }
        public string vcsemana { get; set; }
        public string vcidcontrata { get; set; }
        public string vcperiodo__planilla { get; set; }
        public string vimei { get; set; }
        public string vctg30taridorig { get; set; }
        public string viespretareo { get; set; }
        public string vcidpretareo { get; set; }
        public string vcdescresponsable { get; set; }
        public string vicerrado { get; set; }
        public string vialtitud { get; set; }
        public string vilatitud { get; set; }
        public string vilongitud { get; set; }
        public string vctg30respsuperiorid { get; set; }
        public string vcdescresponsablesuperior { get; set; }
        public string vienvioparcial { get; set; }
        public string vcdescsucursal { get; set; }
        public string vcdescplanilla { get; set; }
        public string vctg30cultivoid { get; set; }
        public string vcdesccultivo { get; set; }
        public string vctg30trabrespid { get; set; }
        public string vcapenomtrabresp { get; set; }



        //
        public string vcitem { get; set; }
        public string vctg30actid { get; set; }
        public string vctg30labid { get; set; }
        public string vctg30consid { get; set; }
        public string vihabilitado { get; set; }
        public string vcrendimiento { get; set; }
        public string vdparametro { get; set; }
        public string vdequivalehora { get; set; }
        public string vcdescactividad { get; set; }
        public string vcdesclabor { get; set; }
        public string vcdescconsumidor { get; set; }
        public string vcidturno { get; set; }
        public string vcdescturno { get; set; }
        public string vcidtipogenasistencia { get; set; }
        public string vcdesctipogenasistencia { get; set; }
        public string vcdescproyecto { get; set; }
        public string vctg30targrupoid { get; set; }
        public string vcdescgrupo { get; set; }
        public string vicondestare { get; set; }
        public string viconteogrupal { get; set; }
        public string viavanceporarea { get; set; }
        public string vctg30consid__multiple { get; set; }
        public string vidensidadccosto { get; set; }
        public string vctg30variedadid { get; set; }
        public string vcdescvariedad { get; set; }
        public string vigendesdeconteoindividual { get; set; }
        public string vctg30cultivofiltroid { get; set; }
        public string vcdesccultivofiltro { get; set; }
        public string viavanceobligatorio { get; set; }
        public string vctg30fundofiltro { get; set; }
        public string vcdescfundofiltro { get; set; }


        public string vdnirespgrupo { get; set; }
        public string vdatosrespgrupo { get; set; }
        public string vusuariogrupo { get; set; }
        public string vfechagrupo { get; set; }
        public string vidtareo { get; set; }
        public string videnvase { get; set; }

        // registrar detalle grupo
        public string vdid { get; set; }
        public string vditem { get; set; }
        public string vdcodtrabajdor { get; set; }
        public string vddatostrabajdor { get; set; }
        public string vdtipo { get; set; }
        public int vdmeta { get; set; }
        public string vidtareo_detalle { get; set; }

        public string vusuario { get; set; }
        public string vtfehcagrupo { get; set; }
        public string vtipo { get; set; }
        public int idgrupo { get; set; }
        public string DNI { get; set; }
        public int META { get; set; }

        // listar responsbale grupo
        public string vrgempresa { get; set; }
        public string vrgbaseddatos { get; set; }
        public string vrgtipo { get; set; }
        public string vrgfecha { get; set; }
        public string vrusuario { get; set; }
        public string vridactividad { get; set; }

        // listra tareos 
        public string vtareocabid { get; set; }
        public string vtareocabfecha { get; set; }
        public string vtareocabtipo { get; set; }
        public string vtitem_ini { get; set; }

        // guardar cabcera de tareo
        public string TUSUARIO { get; set; }
        public string TCTG30RESPONSABLE { get; set; }
        public string TCIDPLANILLA { get; set; }
        public string TIDSUCURSAL { get; set; }
        public string TFECHA { get; set; }
        public string TESTADO { get; set; }
        public string TCDESCRESPONSABLESUPERIOR { get; set; }

        // para guardar combinaciones
        public string CCTG30TARID { get; set; }
        public string CCTG30ACTID { get; set; }
        public string CIDTIPOGENASISTENCIA { get; set; }
        public string CCDESCTIPOGENASISTENCIA { get; set; }

        public string CCIDTURNO { get; set; }
        public string CCTG30LABID { get; set; }
        public string CCIDSUPERVISOR { get; set; }
        public string CCIDRESPONSABLE { get; set; }
        public string CCDESCRESPONSABLE { get; set; }
        public string CCIDGRUPO { get; set; }
        public string CCTG30CONSID { get; set; }
        public string CCCDESCGRUPO { get; set; }

        // registrar trabajdor por labor
        public string CTCTG20TARID { get; set; }
        public string CTCTG30TRABID { get; set; }
        public string CTDHORAINICIO { get; set; }
        public string CTCITEM { get; set; }
        public string CTDHORAFIN { get; set; }


        // TRABAJDOR AVANCE
        public string AVCTG30TARID { get; set; }
        public string AVCTG30TRABID { get; set; }
        public int AVIRENDIMIENTO { get; set; }
        public string AVIHABILITADO { get; set; }
        public string AVCITEMID { get; set; }
        public string AVCDITEMID { get; set; }
        public string AVCITEM { get; set; }

        // vaiable slistrar arendiemnto actulizar
        public string LRTcUsuario_up { get; set; }
        public string LRTcFecha_up { get; set; }
        public string LRTtipo_up { get; set; }
        public string LRTitem_up { get; set; }

        // variables para editar rendiemnto
        public string RTCTG30TARID { get; set; }
        public string RTCTG30TRABID { get; set; }
        public string RTIRENDIMIENTO { get; set; }
        public string RTCITEMID { get; set; }
        public string RTCDITEMID { get; set; }
        public string RTCITEM { get; set; }

        // variables para editar traba jornal
        public string LTJCTG20TARID { get; set; }
        public string LTJCTG30TRABID { get; set; }
        public string LTJCITEM { get; set; }
        public string LTJCITEMID { get; set; }
        public DateTime LTJDHORAINICIO { get; set; }
        public DateTime LTJDHORAFIN { get; set; }

        // listar zona
        public string ZID { get; set; }

        // listamos  trabajdores pro albor  
        public string trab_x_usuario { get; set; }
        public string trab_x_fecha { get; set; }
        public string trab_x_tipo { get; set; }
        public string trab_x_item { get; set; }

        // vatiables elinianr grupso
        public string grupo_elim_CTG30TARID { get; set; }
        public string grupo_elim_TABLA { get; set; }
        public string grupo_elim_CSERIE { get; set; }
        public string grupo_elim_CNUMERO { get; set; }
        public string grupo_elim_CTG30TRABID { get; set; }
        public string grupo_elim_CITEMID { get; set; }
        public string grupo_elim_CITEM { get; set; }
        public string grupo_elim_CTG30ACTID { get; set; }
        public string grupo_elim_CTG30LABID { get; set; }
        public string grupo_elim_CTG30CONSID { get; set; }
        public int grupo_elim_IDGT { get; set; }
        public string grupo_elim_COD_RESP { get; set; }
        public int grupo_elim_NRO_GRUPO { get; set; }
        public string grupo_elim_COD_TRAB { get; set; }

        // variable para alinenar tabajkdor porlabor
        public string jornal_elim_CTG30TARID { get; set; }
        public string jornal_elim_CITEMID { get; set; }
        public string jornal_elim_CTG30TRABID { get; set; }
        public string jornal_elim_CITEM { get; set; }


    }
}