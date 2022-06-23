using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SFC_BE
{
    public class PlanillaBE
    {
        // VARIABLES DEL USUARIO.
        public int USUARIO_DNI { get; set; }
        // VARIABLES DEL DOCUMENTO.
        public int DOCUMENTO_ID { get; set; }
        public string DOCUMENTO_FECHA_CREACION { get; set; }
        public string DOCUMENTO_FECHA_REGISTRO { get; set; }
        public DateTime DOCUMENTO_FECHA_INICIO { get; set; }
        public DateTime DOCUMENTO_FECHA_FIN { get; set; }
        public string DOCUMENTO_DIAS { get; set; }
        public string DOCUMENTO_CMP { get; set; }
        public string DOCUMENTO_CODIGO_DIAGNOSTICO { get; set; }
        public string DOCUMENTO_DIAGNOSTICO { get; set; }
        public string DOCUMENTO_OBSERVACIONES { get; set; }
        public string DOCUMENTO_PROVIENE { get; set; }
        public string DOCUMENTO_MOTIVO { get; set; }
        public string DOCUMENTO_DOCUMENTACION { get; set; }
        public string DOCUMENTO_HORAS { get; set; }
        public string DOCUMENTO_LACTANTE { get; set; }
        public string DOCUMENTO_VINCULO_FAMILIAR { get; set; }
        public string DOCUMENTO_FALLECIDO { get; set; }
        public string DOCUMENTO_CASO { get; set; }
        public string DOCUMENTO_ESTADO { get; set; }
        public string DOCUMENTO_USUARIO { get; set; }
        public string DOCUMENTO_USUARIO_MODIFICADO { get; set; }
        public int DOCUMENTO_TIPO_DOCUMENTO_ID { get; set; }
        public int DOCUMENTO_PERSONAL_ID { get; set; }

        // FILTARDO 
        public int FECHA_ID { get; set; }
        public string FECHA_INICIO { get; set; }
        public string FECHA_FIN { get; set; }
        public string FECHA_ESTADO { get; set; }
        public int FECHA_ESTADO_CER { get; set; }

        // APERTURA ...
        public int APERTURA_SEM_ANIO { get; set; }
        public int APERTURA_SEM_ID { get; set; }

        // PRIVIELGIO
        public string PRIVILEGIOS_DOCUMENTOS_USUARIO { get; set; }
        public int PRIVILEGIOS_DOCUMENTOS_TIPO { get; set; }

        // vaibles de registrar semaman
        public int CERRAR_SEMANA_ID { get; set; }
        public int CERRAR_SEMANA_ANIO { get; set; }
        public string CERRAR_SEMANA_FECHA_INI { get; set; }
        public string CERRAR_SEMANA_FIN { get; set; }
        public string CERRAR_SEMANA_ESTADO { get; set; }

        //7 CERRA_SEMAMA _LIST
        public int CERRAR_SEMANA_LIST { get; set; }

        // FLTRADO_SEMANAS
        public string FILTRO_FECHA_INI { get; set; }
        public string FILTRO_FIN { get; set; }

        // FILTAO SEMAN
        public string SEMANA_ANIO_LIST { get; set; }
        public string SEMANA_ANIO_MES { get; set; }

        // DAROS INCIALES...
        public string FECHA_ACTAUL_SISTEMA { get; set; }
    }
}
