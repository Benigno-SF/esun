using System;

namespace SFC_BE
{
    public class PrevisionesComprasBE
    {
        public int idProveedor { get; set; }
        public int idAlmacen { get; set; }
        public DateTime fechaInicial { get; set; }
        public DateTime fechaFinal { get; set; }
        public int idTipoAplicacion { get; set; }
        public int idActividadNegocio { get; set; }
    }
}
